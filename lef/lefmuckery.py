"""
High-Tech LEF Muckery Script
"""

import shutil
from enum import Enum, auto
from decimal import Decimal
from io import TextIOWrapper, StringIO
from typing import List, Dict


def wrap(f: callable) -> callable:
    def wrapper(inp: StringIO, *args, **kwargs) -> StringIO:
        out = StringIO()
        # Make the main inner call
        f(inp, out, *args, **kwargs)
        # Make sure all this stuff actually gets written
        out.flush()
        rv = StringIO(out.getvalue())
        inp.close()
        out.close()
        return rv

    wrapper.inner = f
    return wrapper


@wrap
def port_shrink(inp: TextIOWrapper, out: TextIOWrapper, x: int, y: int) -> None:
    """
    Shift all edge `PORT` objects, accommodating an outline shrink of (x,y) *on each side* -
    i.e. an overall shrink in dimensions of (2x, 2y).

    This uses something like the Rob Pike/ Go-template lexer state-function method,
    but operating on one line of input-file at a time
    (and deployed to the high-value task of shifting ports in LEF files).
    """

    def start_state(line: str) -> callable:
        """LEF Start/ "Everything but Ports and Pins" State"""
        out.write(line)  # Write all as-is
        if line.strip().startswith("PIN"):
            return pin_state
        return start_state

    def pin_state(line: str) -> callable:
        """LEF State inside a "PIN" declaration"""
        out.write(line)  # Write all as-is
        if line.strip().startswith("PORT"):
            return port_state
        if line.strip().startswith("END"):
            return start_state
        return pin_state

    def port_state(line: str) -> callable:
        """Inside a PORT section. Shift every RECT statement."""

        if line.strip().startswith("RECT"):
            # Finally we get to the action!
            parts = line.split()
            if len(parts) != 6:
                raise RuntimeError(f"Invalid RECT line: {line}")
            rect, x1, y1, x2, y2, semicolon = parts
            if rect != "RECT" or semicolon != ";":
                raise RuntimeError(f"Invalid RECT line: {line}")

            # Turn each into three-place Decimal values
            def decimize(s: str) -> Decimal:
                return Decimal(s).quantize(Decimal("0.001"))

            x1, y1, x2, y2 = decimize(x1), decimize(y1), decimize(x2), decimize(y2)

            # Figure out which edge each is on
            sizex = 2920
            sizey = 3520
            on_top = (y1 >= sizey) or (y2 >= sizey)
            on_bot = (y1 <= 0) or (y2 <= 0)
            on_lf = (x1 >= sizex) or (x2 >= sizex)
            on_rt = (x1 <= 0) or (x2 <= 0)

            # And sort out shifts accordingly
            if not (on_top or on_bot or on_lf or on_rt):
                # Middle pin; move in both directions (?)
                print(f"Moving middle port {line}")
                shifts = (-x, -y)
            if on_top:
                assert not (on_bot or on_lf or on_rt)
                shifts = (-x, -2 * y)
            elif on_bot:
                assert not (on_top or on_lf or on_rt)
                shifts = (-x, 0)
            elif on_lf:
                assert not (on_bot or on_top or on_rt)
                shifts = (0, -y)
            elif on_rt:
                assert not (on_bot or on_lf or on_top)
                shifts = (-2 * x, -y)

            x1 += shifts[0]
            x2 += shifts[0]
            y1 += shifts[1]
            y2 += shifts[1]

            newline = f"        RECT {x1} {y1} {x2} {y2} ;\n"
            # print(f"Updating: {line}\n  to \n{newline}")
            out.write(newline)
            return port_state

        # Any other line; write it as-is
        out.write(line)
        # Jump up to the "PIN" state if we hit "END"
        if line.strip().startswith("END"):
            return pin_state
        return port_state

    # The fun part: running the state machine
    state = start_state
    line = inp.readline()
    while line:
        state = state(line)
        line = inp.readline()


class Dir(Enum):
    INPUT = auto()
    OUTPUT = auto()
    INOUT = auto()


# Chip-level IO, ordered by eFabless bus bit, mapping to our signal-name and direction
ios = [
    # Bottom-right
    (Dir.OUTPUT, "serial_tl_clock"),
    (Dir.OUTPUT, "serial_tl_bits_in_ready"),
    (Dir.INPUT, "serial_tl_bits_in_valid"),
    (Dir.INPUT, "serial_tl_bits_in_bits"),
    (Dir.INPUT, "serial_tl_bits_out_ready"),
    (Dir.OUTPUT, "serial_tl_bits_out_valid"),
    (Dir.OUTPUT, "serial_tl_bits_out_bits"),
    # Top-right
    (Dir.INOUT, "gpio_0_0_i", "gpio_0_0_o", "gpio_0_0_oe"),
    (Dir.INOUT, "gpio_0_1_i", "gpio_0_1_o", "gpio_0_1_oe"),
    (Dir.INOUT, "gpio_0_2_i", "gpio_0_2_o", "gpio_0_2_oe"),
    (Dir.INPUT, "reset_wire_reset"),  # FIXME: is that really our name? OK fine.
    (Dir.INPUT, "clock"),
    None,
    # Bit 13, outside
    None,
    # Top-Left
    (Dir.OUTPUT, "spi_0_sck"),
    (Dir.OUTPUT, "spi_0_cs_0"),
    (Dir.INOUT, "spi_0_dq_0_i", "spi_0_dq_0_o", "spi_0_dq_0_oe"),
    (Dir.INOUT, "spi_0_dq_1_i", "spi_0_dq_1_o", "spi_0_dq_1_oe"),
    (Dir.INOUT, "spi_0_dq_2_i", "spi_0_dq_2_o", "spi_0_dq_2_oe"),
    (Dir.INOUT, "spi_0_dq_3_i", "spi_0_dq_3_o", "spi_0_dq_3_oe"),
    (Dir.INPUT, "bsel"),
    # Bottom Left
    (Dir.INPUT, "jtag_TCK"),
    (Dir.INPUT, "jtag_TMS"),
    (Dir.INPUT, "jtag_TDI"),
    (Dir.OUTPUT, "jtag_TDO_data"),
    (Dir.OUTPUT, "uart_0_txd"),
    (Dir.OUTPUT, "uart_0_rxd"),
]

assert len(ios) == 27, f"Bad-length IO: {len(ios)}"


@wrap
def rename_pins(inp: TextIOWrapper, out: TextIOWrapper, repls: Dict[str, str]) -> None:
    def start_state(line: str) -> callable:
        """LEF Start/ "Everything but Ports and Pins" State"""
        if line.strip().startswith("PIN"):
            for old, new in repls.items():
                line = line.replace(old, new)
            out.write(line)
            return pin_state
        out.write(line)
        return start_state

    def pin_state(line: str) -> callable:
        """LEF State inside a "PIN" declaration"""
        if line.strip().startswith("END"):
            for old, new in repls.items():
                line = line.replace(old, new)
            out.write(line)
            return start_state
        out.write(line)
        if line.strip().startswith("PORT"):
            return port_state
        return pin_state

    def port_state(line: str) -> callable:
        out.write(line)  # Write everything as-is
        if line.strip().startswith("END"):
            return pin_state
        return port_state

    # The fun part: running the state machine
    state = start_state
    line = inp.readline()
    while line:
        state = state(line)
        line = inp.readline()


@wrap
def remove_pins(inp: TextIOWrapper, out: TextIOWrapper, patterns: List[str]) -> None:
    def start_state(line: str) -> callable:
        if line.strip().startswith("PIN"):
            for pattern in patterns:
                if pattern in line:
                    return remove_pin_state
            # No match; leave as-is
            out.write(line)
            return keep_pin_state
        out.write(line)
        return start_state

    def keep_pin_state(line: str) -> callable:
        """LEF State inside a "PIN" declaration"""
        out.write(line)  # Write everything as-is
        if line.strip().startswith("END"):
            return start_state
        return keep_pin_state

    def remove_pin_state(line: str) -> callable:
        """Pin-removal state
        Writes nothing, just returns `start_state` when it hits an `END`."""
        if line.strip().startswith("PORT"):
            return remove_port_state
        if line.strip().startswith("END"):
            return start_state
        return remove_pin_state

    def keep_port_state(line: str) -> callable:
        out.write(line)  # Write everything as-is
        if line.strip().startswith("END"):
            return keep_pin_state
        return keep_port_state

    def remove_port_state(line: str) -> callable:
        if line.strip().startswith("END"):
            return remove_pin_state
        return remove_port_state

    # The fun part: running the state machine
    state = start_state
    line = inp.readline()
    while line:
        state = state(line)
        line = inp.readline()


def update_io(inp: TextIOWrapper, n: int, io: tuple) -> None:
    """Update a single (digital) IO, often including several LEF pins."""

    if io is None:
        # No connection to this pad; remove its IO from the LEF
        return remove_pins(inp, [f"io_out[{n}]", f"io_in[{n}]", f"io_oeb[{n}]"])

    tp = io[0]
    if tp == Dir.OUTPUT:
        name = io[1]
        inp = remove_pins(inp, [f"io_in[{n}]", f"io_oeb[{n}]"])
        inp = rename_pins(inp, {f"io_out[{n}]": name})
        return inp
    if tp == Dir.INPUT:
        name = io[1]
        inp = remove_pins(inp, [f"io_out[{n}]", f"io_oeb[{n}]"])
        inp = rename_pins(inp, {f"io_in[{n}]": name})
        return inp
    if tp == Dir.INOUT:
        in_name, out_name, oe_name = io[1], io[2], io[3]
        return rename_pins(
            inp,
            {
                f"io_in[{n}]": in_name,
                f"io_out[{n}]": out_name,
                f"io_oeb[{n}]": oe_name,
            },
        )
    raise ValueError


def main():
    inf = "lef/osci-digital-input.lef"
    inp = StringIO(open(inf, "r").read())

    # Create some ADC pins, re-naming some of these WishBone things
    adc_pins = {f"wbs_adr_i[{n}]": f"adc_data[{n}]" for n in range(8)}
    adc_pins["wb_clk_i"] = "adc_clk"
    inp = rename_pins(inp, adc_pins)

    # Remove pins meeting all these patterns
    inp = remove_pins(
        inp,
        [
            "vss",
            "vdd",
            "vcc",
            "VSS",
            "VDD",
            "VCC",
            "la_",
            "wbs_",
            "wb_",
            "_irq",
            "io_analog",
            "io_clamp",
            "io_in_3v3",
            "gpio_noesd",
            "user_clock",
        ],
    )

    # Update all the chip-level IO
    for n, io in enumerate(ios):
        inp = update_io(inp, n, io)

    # Pull in pins around the boundary to match our shrink
    # inp = port_shrink(
    #     inp,
    #     x=5,
    #     y=5,
    # )

    # And don't forget to copy the final file!
    open("lef/osci-digital.lef", "w").write(inp.getvalue())

    pins = getpins(inp)
    print(f"Num Pins: {len(pins)}")
    for pin in pins:
        print(pin)


def getpins(inp: TextIOWrapper) -> List[str]:
    """Get and return a list of pin names"""
    rv = list()
    for line in inp.readlines():
        if line.strip().startswith("PIN"):
            parts = line.split()
            if len(parts) != 2:
                raise TabError
            _pin, name = parts
            rv.append(name)
    return rv


if __name__ == "__main__":
    main()
