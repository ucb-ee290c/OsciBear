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
  input   reset, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295625:4]
  input   clock // @[chipyard.TestHarness.EE290CBLEConfig.fir 295626:4]
);
endmodule




