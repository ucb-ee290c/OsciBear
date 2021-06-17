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

module user_analog_project_wrapper (
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

    // Digital Pins 
    .serial_tl_clock(io_out[0]), 
    .serial_tl_bits_in_ready(io_out[1]), 
    .serial_tl_bits_in_valid(io_in[2]), 
    .serial_tl_bits_in_bits(io_in[3]), 
    .serial_tl_bits_out_ready(io_in[4]), 
    .serial_tl_bits_out_valid(io_out[5]), 
    .serial_tl_bits_out_bits(io_out[6]), 
    .gpio_0_0_i(io_in[7]), 
    .gpio_0_0_o(io_out[7]), 
    .gpio_0_0_oe(io_oeb[7]), 
    .gpio_0_1_i(io_in[8]), 
    .gpio_0_1_o(io_out[8]), 
    .gpio_0_1_oe(io_oeb[8]), 
    .gpio_0_2_i(io_in[9]), 
    .gpio_0_2_o(io_out[9]), 
    .gpio_0_2_oe(io_oeb[9]), 
    .reset_wire_reset(io_in[10]), 
    .clock(io_in[11]), 
    .spi_0_sck(io_out[14]), 
    .spi_0_cs_0(io_out[15]), 
    .spi_0_dq_0_i(io_in[16]), 
    .spi_0_dq_0_o(io_out[16]), 
    .spi_0_dq_0_oe(io_oeb[16]), 
    .spi_0_dq_1_i(io_in[17]), 
    .spi_0_dq_1_o(io_out[17]), 
    .spi_0_dq_1_oe(io_oeb[17]), 
    .spi_0_dq_2_i(io_in[18]), 
    .spi_0_dq_2_o(io_out[18]), 
    .spi_0_dq_2_oe(io_oeb[18]), 
    .spi_0_dq_3_i(io_in[19]), 
    .spi_0_dq_3_o(io_out[19]), 
    .spi_0_dq_3_oe(io_oeb[19]), 
    .bsel(io_in[20]), 
    .jtag_TCK(io_in[21]), 
    .jtag_TMS(io_in[22]), 
    .jtag_TDI(io_in[23]), 
    .jtag_TDO_data(io_out[24]), 
    .uart_0_txd(io_out[25]), 
    .uart_0_rxd(io_in[26]), 

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
assign io_out[10] = 1'b0; // reset_wire_reset 
assign io_oeb[10] = 1'b1; // reset_wire_reset 
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

  // Digital Pins
  input   jtag_TCK, 
  input   jtag_TMS, 
  input   jtag_TDI, 
  output  jtag_TDO_data, 
  
  output  serial_tl_clock, 
  output  serial_tl_bits_in_ready, 
  input   serial_tl_bits_in_valid, 
  input   serial_tl_bits_in_bits, 
  input   serial_tl_bits_out_ready, 
  output  serial_tl_bits_out_valid, 
  output  serial_tl_bits_out_bits, 
  
  input   gpio_0_0_i,
  output  gpio_0_0_o,
  output  gpio_0_0_oe,
  
  input   gpio_0_1_i,
  output  gpio_0_1_o,
  output  gpio_0_1_oe,

  input   gpio_0_2_i,
  output  gpio_0_2_o,
  output  gpio_0_2_oe,

  output  spi_0_sck, 
  output  spi_0_cs_0, 
  input   spi_0_dq_0_i,
  output  spi_0_dq_0_o,
  output  spi_0_dq_0_oe,
  input   spi_0_dq_1_i,
  output  spi_0_dq_1_o,
  output  spi_0_dq_1_oe,
  input   spi_0_dq_2_i,
  output  spi_0_dq_2_o,
  output  spi_0_dq_2_oe,
  
  input   spi_0_dq_3_i,
  output  spi_0_dq_3_o,
  output  spi_0_dq_3_oe,
  output  uart_0_txd, 
  input   uart_0_rxd, 
  input   bsel, 
  input   reset_wire_reset, 
  input   clock, 

  // Analog Pins 
  inout [`ANALOG_PADS-1:0] io_analog,
  inout [2:0] io_clamp_high,    // FIXME: handling these
  inout [2:0] io_clamp_low      // FIXME: handling these
);

  // Digital-Analog Interface Signals 
  // Just the ADC clock and data 
  wire          adc_clock;
  wire  [7:0]   adc_data;
  
// Digital Instance 
Digital xdig (
  // Supplies 
  .VDD(VDD_D), 
  .VSS(VSS),

  .adc_clock(adc_clock),
  .adc_data(adc_data),

  .jtag_TCK(jtag_TCK), 
  .jtag_TMS(jtag_TMS), 
  .jtag_TDI(jtag_TDI), 
  .jtag_TDO_data(jtag_TDO_data), 
  
  .serial_tl_clock(serial_tl_clock), 
  .serial_tl_bits_in_ready(serial_tl_bits_in_ready), 
  .serial_tl_bits_in_valid(serial_tl_bits_in_valid), 
  .serial_tl_bits_in_bits(serial_tl_bits_in_bits), 
  .serial_tl_bits_out_ready(serial_tl_bits_out_ready), 
  .serial_tl_bits_out_valid(serial_tl_bits_out_valid), 
  .serial_tl_bits_out_bits(serial_tl_bits_out_bits), 
  
  .gpio_0_0_i(gpio_0_0_i),
  .gpio_0_0_o(gpio_0_0_o),
  .gpio_0_0_oe(gpio_0_0_oe),
  .gpio_0_1_i(gpio_0_1_i),
  .gpio_0_1_o(gpio_0_1_o),
  .gpio_0_1_oe(gpio_0_1_oe),
  .gpio_0_2_i(gpio_0_2_i),
  .gpio_0_2_o(gpio_0_2_o),
  .gpio_0_2_oe(gpio_0_2_oe),

  .spi_0_sck(spi_0_sck), 
  .spi_0_cs_0(spi_0_cs_0), 
  .spi_0_dq_0_i(spi_0_dq_0_i),
  .spi_0_dq_0_o(spi_0_dq_0_o),
  .spi_0_dq_0_oe(spi_0_dq_0_oe),
  .spi_0_dq_1_i(spi_0_dq_1_i),
  .spi_0_dq_1_o(spi_0_dq_1_o),
  .spi_0_dq_1_oe(spi_0_dq_1_oe),
  .spi_0_dq_2_i(spi_0_dq_2_i),
  .spi_0_dq_2_o(spi_0_dq_2_o),
  .spi_0_dq_2_oe(spi_0_dq_2_oe),
  
  .spi_0_dq_3_i(spi_0_dq_3_i),
  .spi_0_dq_3_o(spi_0_dq_3_o),
  .spi_0_dq_3_oe(spi_0_dq_3_oe),
  .uart_0_txd(uart_0_txd), 
  .uart_0_rxd(uart_0_rxd), 
  .bsel(bsel), 
  .reset_wire_reset(reset_wire_reset), 
  .clock(clock) 
);
// Analog Instance 
ana xana (
  .VDD(VDD_A), 
  .VSS(VSS),
  .adc_clock(adc_clock),
  .adc_data(adc_data),
  .io_analog(io_analog),
  .io_clamp_high(io_clamp_high),   // FIXME: handling these
  .io_clamp_low(io_clamp_low)      // FIXME: handling these
);

endmodule

/// 
/// # Chip Analog Shell 
/// 
module ana (
    inout   VDD, VSS,
    input   adc_clock,
    output [7:0]   adc_data,
    inout [`ANALOG_PADS-1:0] io_analog,
    inout [2:0] io_clamp_high,    // FIXME: handling these
    inout [2:0] io_clamp_low      // FIXME: handling these
);
  assign adc_data = 8'b0;
endmodule

/// 
/// # Chip Digital Shell
/// 
/// IO frame matching the PnR target
/// 
module Digital( // @[chipyard.TestHarness.EE290CBLEConfig.fir 295616:2]
  // Supplies 
  inout   VDD, VSS,

  output adc_clock,
  input [7:0] adc_data,
  input   jtag_TCK, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295618:4]
  input   jtag_TMS, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295618:4]
  input   jtag_TDI, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295618:4]
  output  jtag_TDO_data, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295618:4]
  
  output  serial_tl_clock, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295619:4]
  output  serial_tl_bits_in_ready, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295619:4]
  input   serial_tl_bits_in_valid, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295619:4]
  input   serial_tl_bits_in_bits, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295619:4]
  input   serial_tl_bits_out_ready, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295619:4]
  output  serial_tl_bits_out_valid, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295619:4]
  output  serial_tl_bits_out_bits, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295619:4]
  
  input   gpio_0_0_i,
  output  gpio_0_0_o,
  output  gpio_0_0_oe,
  
  input   gpio_0_1_i,
  output  gpio_0_1_o,
  output  gpio_0_1_oe,

  input   gpio_0_2_i,
  output  gpio_0_2_o,
  output  gpio_0_2_oe,

  output  spi_0_sck, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295622:4]
  output  spi_0_cs_0, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295622:4]

  input   spi_0_dq_0_i,
  output  spi_0_dq_0_o,
  output  spi_0_dq_0_oe,

  input   spi_0_dq_1_i,
  output  spi_0_dq_1_o,
  output  spi_0_dq_1_oe,

  input   spi_0_dq_2_i,
  output  spi_0_dq_2_o,
  output  spi_0_dq_2_oe,
  
  input   spi_0_dq_3_i,
  output  spi_0_dq_3_o,
  output  spi_0_dq_3_oe,
  
  output  uart_0_txd, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295623:4]
  input   uart_0_rxd, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295623:4]
  input   bsel, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295624:4]
  input   reset_wire_reset, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295625:4]
  input   clock // @[chipyard.TestHarness.EE290CBLEConfig.fir 295626:4]
);
endmodule

