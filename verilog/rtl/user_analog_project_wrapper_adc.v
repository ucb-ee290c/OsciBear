// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

// These are defined elsewhere in the eFabless Verilog stack, 
// which we don't always want to include
// e.g. when running stand-alone testing. 
`define MPRJ_IO_PADS  38
`define ANALOG_PADS   11
`define USE_POWER_PINS

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_analog_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user analog project.
 *
 *-------------------------------------------------------------
 */

module user_analog_project_wrapper_adc (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply - unused
    inout vdda2,	// User area 2 3.3V supply - unused
    inout vssa1,	// User area 1 analog ground - unused
    inout vssa2,	// User area 2 analog ground - unused
    inout vccd1,	// User area 1 1.8V supply - VDD_D
    inout vccd2,	// User area 2 1.8v supply - VDD_A
    inout vssd1,	// User area 1 digital ground - VSS
    inout vssd2,	// User area 2 digital ground - VSS
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,             // Ignored
    input wb_rst_i,             // Ignored
    input wbs_stb_i,            // Ignored
    input wbs_cyc_i,            // Ignored
    input wbs_we_i,             // Ignored
    input [3:0] wbs_sel_i,      // Ignored
    input [31:0] wbs_dat_i,     // Ignored
    input [31:0] wbs_adr_i,     // Ignored
    output wbs_ack_o,           // Tied low
    output [31:0] wbs_dat_o,    // Tied low

    // Logic Analyzer Signals
    input  [127:0] la_data_in,  // Ignored
    output [127:0] la_data_out, // Tied low
    input  [127:0] la_oenb,     // Ignored

    /* GPIOs.  There are 27 GPIOs, on either side of the analog.
     * These have the following mapping to the GPIO padframe pins
     * and memory-mapped registers, since the numbering remains the
     * same as caravel but skips over the analog I/O:
     *
     * io_in/out/oeb/in_3v3 [26:14]  <--->  mprj_io[37:25]
     * io_in/out/oeb/in_3v3 [13:0]   <--->  mprj_io[13:0]	
     *
     * When the GPIOs are configured by the Management SoC for
     * user use, they have three basic bidirectional controls:
     * in, out, and oeb (output enable, sense inverted).  For
     * analog projects, a 3.3V copy of the signal input is
     * available.  out and oeb must be 1.8V signals.
     */

    input  [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_in,
    input  [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_in_3v3,  // Unused
    output [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_oeb,

    /* Analog (direct connection to GPIO pad---not for high voltage or
     * high frequency use).  The management SoC must turn off both
     * input and output buffers on these GPIOs to allow analog access.
     * These signals may drive a voltage up to the value of VDDIO
     * (3.3V typical, 5.5V maximum).
     * 
     * Note that analog I/O is not available on the 7 lowest-numbered
     * GPIO pads, and so the analog_io indexing is offset from the
     * GPIO indexing by 7, as follows:
     *
     * gpio_analog/noesd [17:7]  <--->  mprj_io[35:25]
     * gpio_analog/noesd [6:0]   <--->  mprj_io[13:7]	
     *
     */
    
    inout [`MPRJ_IO_PADS-`ANALOG_PADS-10:0] gpio_analog,  // Unused
    inout [`MPRJ_IO_PADS-`ANALOG_PADS-10:0] gpio_noesd,   // Unused

    /* Analog signals, direct through to pad.  These have no ESD at all,
     * so ESD protection is the responsibility of the designer.
     *
     * user_analog[10:0]  <--->  mprj_io[24:14]
     *
     */
    inout [`ANALOG_PADS-1:0] io_analog,

    /* Additional power supply ESD clamps, one per analog pad.  The
     * high side should be connected to a 3.3-5.5V power supply.
     * The low side should be connected to ground.
     *
     * clamp_high[2:0]   <--->  mprj_io[20:18]
     * clamp_low[2:0]    <--->  mprj_io[20:18]
     *
     */
    inout [2:0] io_clamp_high,    // FIXME: handling these
    inout [2:0] io_clamp_low,     // FIXME: handling these

    // Independent clock (on independent integer divider)
    input   user_clock2,  // Ignored

    // User maskable interrupt signals
    output [2:0] user_irq // Tied low
);

// Supply Ties 
wire VSS;
`ifdef USE_POWER_PINS 
  assign vssd1 = VSS;
  assign vssd2 = VSS;
`else  
  assign VSS = 1'b0;
`endif 

// Output Tie-Offs
assign wbs_ack_o = 1'b0;
assign wbs_dat_o = 32'b0;
assign la_data_out = 128'b0;
assign user_irq = 3'b0;

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

/* ======================================
#  IO Floorplan 
*  ======================================

---------------------------------------- y = 3520
                    IO[13], in analog area 
                                        Analog Area
---------------------------------------- y = 2620
IO[20:14]            IO[12:7]           Digital Area
    Power/Ground, Big Gap
IO[26:15]            IO[6:0]
---------------------------------------- y = 0

Floor-planning locates IOs in 4-5 groups: 

* Bottom-Right - IO[6:0] - TileLink (7p)
* Top-Right - IO[12:7] - GPIO (3p), Clock, Reset, 1 Unused
* Top - IO[13] - Unused
* Top-Left - IO[20:14] - SPI (6p), BSEL
* Bottom-Left - IO[26:21] - JTAG (4p), UART (2p)

IO bit 13 is the step-child here. 
We'll avoid using it unless unavoidable. 

====================================== */
core xcore (

    // Supplies
    .VDD_A(vccd2),  // 1.8V 
    .VDD_D(vccd1),  // Also 1.8V 
    .VSS(VSS),  

    .adc_data({io_out[12:9], io_out[18:15]}),
    .clock(io_in[14]), 

    // Analog Pins 
    .io_analog(io_analog),
    .io_clamp_high(io_clamp_high),   // FIXME: handling these
    .io_clamp_low(io_clamp_low)      // FIXME: handling these

);

// IO Tie-Offs 
assign io_oeb[0] = 1'b0; // serial_tl_clock 
assign io_oeb[1] = 1'b0; // serial_tl_bits_in_ready 
assign io_out[2] = 1'b0; // serial_tl_bits_in_valid 
assign io_oeb[2] = 1'b1; // serial_tl_bits_in_valid 
assign io_out[3] = 1'b0; // serial_tl_bits_in_bits 
assign io_oeb[3] = 1'b1; // serial_tl_bits_in_bits 
assign io_out[4] = 1'b0; // serial_tl_bits_out_ready 
assign io_oeb[4] = 1'b1; // serial_tl_bits_out_ready 
assign io_oeb[5] = 1'b0; // serial_tl_bits_out_valid 
assign io_oeb[6] = 1'b0; // serial_tl_bits_out_bits 
assign io_out[10] = 1'b0; // reset
assign io_oeb[10] = 1'b1; // reset
assign io_out[11] = 1'b0; // clock 
assign io_oeb[11] = 1'b1; // clock 
assign io_out[12] = 1'b0; // Unused 
assign io_oeb[12] = 1'b1; // Unused 
assign io_out[13] = 1'b0; // Unused 
assign io_oeb[13] = 1'b1; // Unused 
assign io_oeb[14] = 1'b0; // spi_0_sck 
assign io_oeb[15] = 1'b0; // spi_0_cs_0 
assign io_out[20] = 1'b0; // bsel 
assign io_oeb[20] = 1'b1; // bsel 
assign io_out[21] = 1'b0; // jtag_TCK 
assign io_oeb[21] = 1'b1; // jtag_TCK 
assign io_out[22] = 1'b0; // jtag_TMS 
assign io_oeb[22] = 1'b1; // jtag_TMS 
assign io_out[23] = 1'b0; // jtag_TDI 
assign io_oeb[23] = 1'b1; // jtag_TDI 
assign io_oeb[24] = 1'b0; // jtag_TDO_data 
assign io_oeb[25] = 1'b0; // uart_0_txd 
assign io_out[26] = 1'b0; // uart_0_rxd 
assign io_oeb[26] = 1'b1; // uart_0_rxd 

endmodule	// user_analog_project_wrapper

`default_nettype wire

/// # Chip Core 
/// 
/// Top-level module, wrapped by `project_wrapper`. 
///  
module core( 
  // Supplies 
  inout   VDD_A, VDD_D, VSS,

  output [7:0] adc_data,
  input   clock, 

  // Analog Pins 
  inout [`ANALOG_PADS-1:0] io_analog,
  inout [2:0] io_clamp_high,    // FIXME: handling these
  inout [2:0] io_clamp_low      // FIXME: handling these
);

 

// Analog Instance 
wire data0;
AAA_Slice_edit_sampfix_SA_wrap xadc ( // have to change to ADC if using wrapper
  .VDD(VDD_A),
  .VSS(VSS),
  .clk(clock),
  .data_out({adc_data, data0}),
  .vref(io_analog[8:6]),
  .in_n(io_analog[5]),
  .in_p(io_analog[4])
);

endmodule

/// 
/// # Chip Analog Shell 
/// 

//full ADC pins
/*
module AAA_Slice_edit_sampfix_SA_wrap ( //have to change to ADC if using wrapper
    inout   VDD, VSS,
    input   clk,
    output [8:0]  data_out,
    inout [2:0] vref,
    input in_n, in_p

    //inout top_n, top_p,
    //inout [7:0] bot_n, bot_p,
    //output [8:0] dm, dp, dn,
    //output comp_clk, comp_n, comp_p,
    //output clk16, clk_out
    //inout [`ANALOG_PADS-1:0] io_analog,
    //inout [2:0] io_clamp_high,    // FIXME: handling these
    //inout [2:0] io_clamp_low      // FIXME: handling these
);
endmodule
*/



