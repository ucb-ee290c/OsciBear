"""
High-Tech LEF Muckery Script
"""
from decimal import Decimal
from io import TextIOWrapper


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
        if "PIN" in line:
            return pin_state
        return start_state

    def pin_state(line: str) -> callable:
        """LEF State inside a "PIN" declaration"""
        out.write(line)  # Write all as-is
        if "PORT" in line:
            return port_state
        if "END" in line:
            return start_state
        return pin_state

    def port_state(line: str) -> callable:
        """Inside a PORT section. Shift every RECT statement."""

        if "RECT" in line:
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
        if "END" in line:
            return pin_state
        return port_state

    # The fun part: running the state machine
    state = start_state
    line = inp.readline()
    while line:
        state = state(line)
        line = inp.readline()

    # Make sure all this stuff actually gets written
    out.flush()


port_shrink(
    open("lef/osci-digital-input.lef", "r"),
    open("lef/osci-digital.lef", "w"),
    x=5,
    y=5,
)
