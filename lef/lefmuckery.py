"""
High-Tech LEF Muckery Script
"""

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
            on_lf = (x1 <= 0) or (x2 <= 0)
            on_rt = (x1 >= sizex) or (x2 >= sizex)

            # And sort out shifts accordingly
            if not (on_top or on_bot or on_lf or on_rt):
                raise TabError
                # Middle pin; move in both directions (?)
                print(f"Moving middle port {line}")
                shifts = (-x, -y)
            if on_top:
                raise TabError  # Just not dealing with these; no need to yet
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
    (Dir.INPUT, "uart_0_rxd"),
]

assert len(ios) == 27, f"Bad-length IO: {len(ios)}"


def get_some_verilog() -> (str, str):
    """
    Create two piles of Verilog,
    targeted for pasting into a larger module:
    * By-name pin connections for everything in `ios`
    * Assignments for all signals that need tying off
    """
    conns = str()
    assigns = str()

    for n, io in enumerate(ios):
        if io is None:
            # Unused: tie `out` low, tie `oeb` high (input mode), leave `in` unconnected
            assigns += f"assign io_out[{n}] = 1'b0; // Unused \n"
            assigns += f"assign io_oeb[{n}] = 1'b1; // Unused \n"
            continue

        tp = io[0]
        if tp == Dir.OUTPUT:
            # Output: connect `out`, tie `oeb` low, leave `in` unconnected
            name = io[1]
            conns += f".{name}(io_out[{n}]), \n"
            assigns += f"assign io_oeb[{n}] = 1'b0; // {name} \n"
        elif tp == Dir.INPUT:
            # Input: connect `in`, tie `out` low, tie `oeb` high
            name = io[1]
            conns += f".{name}(io_in[{n}]), \n"
            assigns += f"assign io_out[{n}] = 1'b0; // {name} \n"
            assigns += f"assign io_oeb[{n}] = 1'b1; // {name} \n"
        elif tp == Dir.INOUT:
            # Input: connect all three of `in`, `out`, `oeb`
            in_name, out_name, oe_name = io[1], io[2], io[3]
            conns += f".{in_name}(io_in[{n}]), \n"
            conns += f".{out_name}(io_out[{n}]), \n"
            conns += f".{oe_name}(io_oeb[{n}]), \n"
        else:
            raise ValueError

    return (conns, assigns)


@wrap
def edit_size(inp: TextIOWrapper, out: TextIOWrapper, x: int, y: int) -> None:
    """Edit the SIZE directive by delta (x,y)"""
    for line in inp.readlines():
        if line.strip().startswith("SIZE"):
            parts = line.split()
            if len(parts) != 5:
                raise TabError
            _size, sx, _by, sy, _semi = parts
            sx = Decimal(sx).quantize(Decimal("0.001"))
            sy = Decimal(sy).quantize(Decimal("0.001"))
            sx += x
            sy += y
            newline = f"  SIZE {sx} BY {sy} ;"
            out.write(newline)
        else:
            out.write(line)


@wrap
def shift_pins(
    inp: TextIOWrapper, out: TextIOWrapper, patterns: List[str], x: int, y: int
) -> None:
    """
    Shift all pins which match `patterns` by (x,y)
    """

    def start_state(line: str) -> callable:
        """LEF Start/ "Everything but Ports and Pins" State"""
        out.write(line)  # Write all as-is
        if line.strip().startswith("PIN"):
            for pattern in patterns:
                if pattern in line:
                    return move_pin_state
            return keep_pin_state
        return start_state

    def keep_pin_state(line: str) -> callable:
        """LEF State inside a "PIN" declaration"""
        out.write(line)  # Write everything as-is
        if line.strip().startswith("PORT"):
            return keep_port_state
        if line.strip().startswith("END"):
            return start_state
        return keep_pin_state

    def move_pin_state(line: str) -> callable:
        out.write(line)  # Write everything as-is
        if line.strip().startswith("PORT"):
            return move_port_state
        if line.strip().startswith("END"):
            return start_state
        return move_pin_state

    def keep_port_state(line: str) -> callable:
        out.write(line)  # Write everything as-is
        if line.strip().startswith("END"):
            return keep_pin_state
        return keep_port_state

    def move_port_state(line: str) -> callable:
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

            x1 += x
            x2 += x
            y1 += y
            y2 += y

            newline = f"        RECT {x1} {y1} {x2} {y2} ;\n"
            print(f"Updating: {line}\n  to \n{newline}")
            out.write(newline)
            return move_port_state

        # Any other line; write it as-is
        out.write(line)
        # Jump up to the "PIN" state if we hit "END"
        if line.strip().startswith("END"):
            return move_pin_state
        return move_port_state

    # The fun part: running the state machine
    state = start_state
    line = inp.readline()
    while line:
        state = state(line)
        line = inp.readline()


def main():
    inf = "lef/osci-digital-input.lef"
    inp = StringIO(open(inf, "r").read())

    # Create some ADC pins, re-naming some of these WishBone things
    adc_pins = {f"wbs_adr_i[{n}]": f"adc_data[{n}]" for n in range(8)}
    adc_pins["wb_clk_i"] = "adc_clk"
    inp = rename_pins(inp, adc_pins)
    # Shift those right, more or less to the center
    inp = shift_pins(inp, list(adc_pins.values()), x=1460, y=0)

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
    inp = port_shrink(
        inp,
        x=10,
        y=5,
    )
    # Make a corresponding edit to the size,
    # and hack out the analog area while we're at it
    inp = edit_size(
        inp,
        x=-20,
        y=-905,
    )
    # Shift those ADC pins to the top 
    inp = shift_pins(inp, list(adc_pins.values()), x=0, y=2615)

    # And don't forget to copy the final file!
    open("lef/osci-digital.lef", "w").write(inp.getvalue())

    print("Pin List: \n\n")
    pins = getpins(inp)
    print(f"Num Pins: {len(pins)}")
    for pin in pins:
        print(pin)
    print("\n\n")

    print("Some Verilog Help: \n\n")
    conns, assigns = get_some_verilog()
    print(conns)
    print(assigns)
    print("\n\n")


if __name__ == "__main__":
    main()
