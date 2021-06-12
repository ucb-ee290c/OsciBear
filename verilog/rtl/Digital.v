module Digital( // @[chipyard.TestHarness.EE290CBLEConfig.fir 295616:2]

  // 
  // Updates all right here! 
  // 
  output adc_clock; // Update: added
  input [7:0] adc_data; // Update: added
//   output  jtag_TDO_data_driven, // Update: removed
//   output  gpio_0_0_ie, // Update: removed
//   output  gpio_0_1_ie, // Update: removed
//   output  gpio_0_2_ie, // Update: removed

//   Updates: all `baseband*` signals removed 
//   output        baseband_offChipMode_rx, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output        baseband_offChipMode_tx, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [7:0]  baseband_data_tx_loFSK, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   input  [7:0]  baseband_data_rx_i_data, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   input  [7:0]  baseband_data_rx_q_data, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [7:0]  baseband_data_loCT, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [10:0] baseband_data_pllD, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [7:0]  baseband_tuning_trim_g0, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [7:0]  baseband_tuning_trim_g1, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [7:0]  baseband_tuning_trim_g2, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [7:0]  baseband_tuning_trim_g3, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [7:0]  baseband_tuning_trim_g4, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [7:0]  baseband_tuning_trim_g5, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [7:0]  baseband_tuning_trim_g6, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [7:0]  baseband_tuning_trim_g7, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_mixer_r0, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_mixer_r1, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_mixer_r2, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_mixer_r3, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [9:0]  baseband_tuning_i_vgaAtten, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_i_filter_r0, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_i_filter_r1, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_i_filter_r2, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_i_filter_r3, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_i_filter_r4, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_i_filter_r5, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_i_filter_r6, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_i_filter_r7, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_i_filter_r8, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_i_filter_r9, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [9:0]  baseband_tuning_q_vgaAtten, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_q_filter_r0, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_q_filter_r1, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_q_filter_r2, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_q_filter_r3, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_q_filter_r4, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_q_filter_r5, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_q_filter_r6, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_q_filter_r7, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_q_filter_r8, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [3:0]  baseband_tuning_q_filter_r9, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [5:0]  baseband_tuning_dac_t0, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [5:0]  baseband_tuning_dac_t1, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [5:0]  baseband_tuning_dac_t2, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [5:0]  baseband_tuning_dac_t3, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [4:0]  baseband_tuning_enable_rx_i, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [4:0]  baseband_tuning_enable_rx_q, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [9:0]  baseband_tuning_mux_dbg_in, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]
//   output [9:0]  baseband_tuning_mux_dbg_out, // @[chipyard.TestHarness.EE290CBLEConfig.fir 295620:4]

  
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
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  system_clock; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_reset; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_3_member_subsystem_cbus_0_clock; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_3_member_subsystem_cbus_0_reset; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_2_member_subsystem_fbus_0_clock; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_2_member_subsystem_fbus_0_reset; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_1_member_subsystem_pbus_0_clock; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_1_member_subsystem_pbus_0_reset; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_0_member_subsystem_sbus_0_clock; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_0_member_subsystem_sbus_0_reset; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_auto_subsystem_cbus_fixedClockNode_out_clock; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_auto_subsystem_cbus_fixedClockNode_out_reset; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  /*
  wire  system_serial_tl_clock; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_serial_tl_bits_in_ready; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_serial_tl_bits_in_valid; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_serial_tl_bits_in_bits; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_serial_tl_bits_out_ready; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_serial_tl_bits_out_valid; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_serial_tl_bits_out_bits; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  */
  wire  system_resetctrl_hartIsInReset_0; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_debug_clock; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_debug_reset; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  /*
  wire  system_debug_systemjtag_jtag_TCK; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_debug_systemjtag_jtag_TMS; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_debug_systemjtag_jtag_TDI; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_debug_systemjtag_jtag_TDO_data; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_debug_systemjtag_jtag_TDO_driven; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  */
  wire  system_debug_systemjtag_reset; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_debug_dmactive; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_debug_dmactiveAck; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  /*
  wire  system_uart_0_txd; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_uart_0_rxd; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  */
  wire  system_gpio_0_pins_0_i_ival; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_gpio_0_pins_0_o_oval; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_gpio_0_pins_0_o_oe; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_gpio_0_pins_0_o_ie; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_gpio_0_pins_1_i_ival; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_gpio_0_pins_1_o_oval; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_gpio_0_pins_1_o_oe; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_gpio_0_pins_1_o_ie; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_gpio_0_pins_2_i_ival; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_gpio_0_pins_2_o_oval; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_gpio_0_pins_2_o_oe; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_gpio_0_pins_2_o_ie; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  /*
  wire  system_qspi_0_sck; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  */
  wire  system_qspi_0_dq_0_i; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_qspi_0_dq_0_o; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_qspi_0_dq_0_oe; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_qspi_0_dq_1_i; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_qspi_0_dq_1_o; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_qspi_0_dq_1_oe; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_qspi_0_dq_2_i; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_qspi_0_dq_2_o; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_qspi_0_dq_2_oe; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_qspi_0_dq_3_i; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_qspi_0_dq_3_o; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  system_qspi_0_dq_3_oe; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  /*
  wire  system_qspi_0_cs_0; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  */
  wire  system_boot; // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
  wire  aggregator_auto_in_member_allClocks_subsystem_cbus_0_clock; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_in_member_allClocks_subsystem_cbus_0_reset; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_in_member_allClocks_subsystem_fbus_0_clock; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_in_member_allClocks_subsystem_fbus_0_reset; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_in_member_allClocks_subsystem_pbus_0_clock; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_in_member_allClocks_subsystem_pbus_0_reset; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_in_member_allClocks_subsystem_sbus_0_clock; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_in_member_allClocks_subsystem_sbus_0_reset; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_in_member_allClocks_implicit_clock_clock; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_in_member_allClocks_implicit_clock_reset; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_out_4_member_subsystem_cbus_subsystem_cbus_0_clock; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_out_4_member_subsystem_cbus_subsystem_cbus_0_reset; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_out_3_member_subsystem_fbus_subsystem_fbus_0_clock; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_out_3_member_subsystem_fbus_subsystem_fbus_0_reset; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_out_2_member_subsystem_pbus_subsystem_pbus_0_clock; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_out_2_member_subsystem_pbus_subsystem_pbus_0_reset; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_0_clock; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_0_reset; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_clock; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  aggregator_auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_reset; // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
  wire  dividerOnlyClockGenerator_auto_in_member_dividerOnlyClockGenerator_implicit_clock_clock; // @[ClockGroup.scala 32:69 chipyard.TestHarness.EE290CBLEConfig.fir 295667:4]
  wire  dividerOnlyClockGenerator_auto_in_member_dividerOnlyClockGenerator_implicit_clock_reset; // @[ClockGroup.scala 32:69 chipyard.TestHarness.EE290CBLEConfig.fir 295667:4]
  wire  dividerOnlyClockGenerator_auto_out_clock; // @[ClockGroup.scala 32:69 chipyard.TestHarness.EE290CBLEConfig.fir 295667:4]
  wire  dividerOnlyClockGenerator_auto_out_reset; // @[ClockGroup.scala 32:69 chipyard.TestHarness.EE290CBLEConfig.fir 295667:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_3_member_subsystem_cbus_subsystem_cbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_3_member_subsystem_cbus_subsystem_cbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_3_member_subsystem_cbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_3_member_subsystem_cbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_clock; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_reset; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_clock; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_reset; // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_cbus_0_clock; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_cbus_0_reset; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_fbus_0_clock; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_fbus_0_reset; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_pbus_0_clock; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_pbus_0_reset; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_0_clock; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_0_reset; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_implicit_clock_clock; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_implicit_clock_reset; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_cbus_0_clock; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_cbus_0_reset; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_fbus_0_clock; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_fbus_0_reset; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_pbus_0_clock; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_pbus_0_reset; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_0_clock; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_0_reset; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_implicit_clock_clock; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_implicit_clock_reset; // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
  wire  dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_in_clock; // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
  wire  dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_in_reset; // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
  wire  dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_clock; // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
  wire  dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_reset; // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
  wire  dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_clock; // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
  wire  dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_reset; // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
  wire  dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_clock; // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
  wire  dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_reset; // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
  wire  dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_clock; // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
  wire  dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_reset; // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
  wire  dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_clock; // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
  wire  dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_reset; // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
  wire  debug_reset_syncd_debug_reset_sync_clock; // @[ShiftReg.scala 45:23 chipyard.TestHarness.EE290CBLEConfig.fir 295708:4]
  wire  debug_reset_syncd_debug_reset_sync_reset; // @[ShiftReg.scala 45:23 chipyard.TestHarness.EE290CBLEConfig.fir 295708:4]
  wire  debug_reset_syncd_debug_reset_sync_io_d; // @[ShiftReg.scala 45:23 chipyard.TestHarness.EE290CBLEConfig.fir 295708:4]
  wire  debug_reset_syncd_debug_reset_sync_io_q; // @[ShiftReg.scala 45:23 chipyard.TestHarness.EE290CBLEConfig.fir 295708:4]
  wire  dmactiveAck_dmactiveAck_clock; // @[ShiftReg.scala 45:23 chipyard.TestHarness.EE290CBLEConfig.fir 295717:4]
  wire  dmactiveAck_dmactiveAck_reset; // @[ShiftReg.scala 45:23 chipyard.TestHarness.EE290CBLEConfig.fir 295717:4]
  wire  dmactiveAck_dmactiveAck_io_d; // @[ShiftReg.scala 45:23 chipyard.TestHarness.EE290CBLEConfig.fir 295717:4]
  wire  dmactiveAck_dmactiveAck_io_q; // @[ShiftReg.scala 45:23 chipyard.TestHarness.EE290CBLEConfig.fir 295717:4]
  wire  gated_clock_debug_clock_gate_in; // @[ClockGate.scala 24:20 chipyard.TestHarness.EE290CBLEConfig.fir 295725:4]
  wire  gated_clock_debug_clock_gate_test_en; // @[ClockGate.scala 24:20 chipyard.TestHarness.EE290CBLEConfig.fir 295725:4]
  wire  gated_clock_debug_clock_gate_en; // @[ClockGate.scala 24:20 chipyard.TestHarness.EE290CBLEConfig.fir 295725:4]
  wire  gated_clock_debug_clock_gate_out; // @[ClockGate.scala 24:20 chipyard.TestHarness.EE290CBLEConfig.fir 295725:4]
  
  wire  iocell_bsel_pad; // @[IOCell.scala 116:23 chipyard.TestHarness.EE290CBLEConfig.fir 295927:4]
  wire  iocell_bsel_i; // @[IOCell.scala 116:23 chipyard.TestHarness.EE290CBLEConfig.fir 295927:4]
  wire  iocell_bsel_ie; // @[IOCell.scala 116:23 chipyard.TestHarness.EE290CBLEConfig.fir 295927:4]
  wire  reset_wire_iocell_reset_pad; // @[IOCell.scala 116:23 chipyard.TestHarness.EE290CBLEConfig.fir 295936:4]
  wire  reset_wire_iocell_reset_i; // @[IOCell.scala 116:23 chipyard.TestHarness.EE290CBLEConfig.fir 295936:4]
  wire  reset_wire_iocell_reset_ie; // @[IOCell.scala 116:23 chipyard.TestHarness.EE290CBLEConfig.fir 295936:4]
  wire  iocell_clock_pad; // @[IOCell.scala 116:23 chipyard.TestHarness.EE290CBLEConfig.fir 295945:4]
  wire  iocell_clock_i; // @[IOCell.scala 116:23 chipyard.TestHarness.EE290CBLEConfig.fir 295945:4]
  wire  iocell_clock_ie; // @[IOCell.scala 116:23 chipyard.TestHarness.EE290CBLEConfig.fir 295945:4]
  wire  _debug_reset_syncd_WIRE = debug_reset_syncd_debug_reset_sync_io_q; // @[ShiftReg.scala 48:24 chipyard.TestHarness.EE290CBLEConfig.fir 295712:4 ShiftReg.scala 48:24 chipyard.TestHarness.EE290CBLEConfig.fir 295713:4]
  wire  _T = ~_debug_reset_syncd_WIRE; // @[Periphery.scala 297:38 chipyard.TestHarness.EE290CBLEConfig.fir 295716:4]
  wire  bundleIn_0_clock = system_auto_subsystem_cbus_fixedClockNode_out_clock; // @[Nodes.scala 1210:84 chipyard.TestHarness.EE290CBLEConfig.fir 295677:4 LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295683:4]
  reg  clock_en; // @[Periphery.scala 299:29 chipyard.TestHarness.EE290CBLEConfig.fir 295723:4]

  // FIXME: update these temporary tie-offs
  wire [7:0]  baseband_data_rx_i_data, baseband_data_rx_q_data;
  assign baseband_data_rx_i_data = 8'b0;
  assign baseband_data_rx_q_data = 8'b0;
  wire gpio_0_0_ie, gpio_0_1_ie, gpio_0_2_ie;
  assign adc_clock = 1'b0;

  DigitalTop system ( // @[ChipTop.scala 29:35 chipyard.TestHarness.EE290CBLEConfig.fir 295645:4]
    .clock(system_clock),
    .reset(system_reset),
    .auto_domain_resetCtrl_tile_reset_provider_in_3_member_subsystem_cbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_in_3_member_subsystem_cbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_in_3_member_subsystem_cbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_in_3_member_subsystem_cbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_in_2_member_subsystem_fbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_in_2_member_subsystem_fbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_in_2_member_subsystem_fbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_in_2_member_subsystem_fbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_in_1_member_subsystem_pbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_in_1_member_subsystem_pbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_in_1_member_subsystem_pbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_in_1_member_subsystem_pbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_in_0_member_subsystem_sbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_in_0_member_subsystem_sbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_in_0_member_subsystem_sbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_in_0_member_subsystem_sbus_0_reset),
    .auto_subsystem_cbus_fixedClockNode_out_clock(system_auto_subsystem_cbus_fixedClockNode_out_clock),
    .auto_subsystem_cbus_fixedClockNode_out_reset(system_auto_subsystem_cbus_fixedClockNode_out_reset),
    .serial_tl_clock(serial_tl_clock),
    .serial_tl_bits_in_ready(serial_tl_bits_in_ready),
    .serial_tl_bits_in_valid(serial_tl_bits_in_valid),
    .serial_tl_bits_in_bits(serial_tl_bits_in_bits),
    .serial_tl_bits_out_ready(serial_tl_bits_out_ready),
    .serial_tl_bits_out_valid(serial_tl_bits_out_valid),
    .serial_tl_bits_out_bits(serial_tl_bits_out_bits),
    .baseband_offChipMode_rx(baseband_offChipMode_rx),
    .baseband_offChipMode_tx(baseband_offChipMode_tx),
    .baseband_data_tx_loFSK(baseband_data_tx_loFSK),
    .baseband_data_rx_i_data(baseband_data_rx_i_data),
    .baseband_data_rx_q_data(baseband_data_rx_q_data),
    .baseband_data_loCT(baseband_data_loCT),
    .baseband_data_pllD(baseband_data_pllD),
    .baseband_tuning_trim_g0(baseband_tuning_trim_g0),
    .baseband_tuning_trim_g1(baseband_tuning_trim_g1),
    .baseband_tuning_trim_g2(baseband_tuning_trim_g2),
    .baseband_tuning_trim_g3(baseband_tuning_trim_g3),
    .baseband_tuning_trim_g4(baseband_tuning_trim_g4),
    .baseband_tuning_trim_g5(baseband_tuning_trim_g5),
    .baseband_tuning_trim_g6(baseband_tuning_trim_g6),
    .baseband_tuning_trim_g7(baseband_tuning_trim_g7),
    .baseband_tuning_mixer_r0(baseband_tuning_mixer_r0),
    .baseband_tuning_mixer_r1(baseband_tuning_mixer_r1),
    .baseband_tuning_mixer_r2(baseband_tuning_mixer_r2),
    .baseband_tuning_mixer_r3(baseband_tuning_mixer_r3),
    .baseband_tuning_i_vgaAtten(baseband_tuning_i_vgaAtten),
    .baseband_tuning_i_filter_r0(baseband_tuning_i_filter_r0),
    .baseband_tuning_i_filter_r1(baseband_tuning_i_filter_r1),
    .baseband_tuning_i_filter_r2(baseband_tuning_i_filter_r2),
    .baseband_tuning_i_filter_r3(baseband_tuning_i_filter_r3),
    .baseband_tuning_i_filter_r4(baseband_tuning_i_filter_r4),
    .baseband_tuning_i_filter_r5(baseband_tuning_i_filter_r5),
    .baseband_tuning_i_filter_r6(baseband_tuning_i_filter_r6),
    .baseband_tuning_i_filter_r7(baseband_tuning_i_filter_r7),
    .baseband_tuning_i_filter_r8(baseband_tuning_i_filter_r8),
    .baseband_tuning_i_filter_r9(baseband_tuning_i_filter_r9),
    .baseband_tuning_q_vgaAtten(baseband_tuning_q_vgaAtten),
    .baseband_tuning_q_filter_r0(baseband_tuning_q_filter_r0),
    .baseband_tuning_q_filter_r1(baseband_tuning_q_filter_r1),
    .baseband_tuning_q_filter_r2(baseband_tuning_q_filter_r2),
    .baseband_tuning_q_filter_r3(baseband_tuning_q_filter_r3),
    .baseband_tuning_q_filter_r4(baseband_tuning_q_filter_r4),
    .baseband_tuning_q_filter_r5(baseband_tuning_q_filter_r5),
    .baseband_tuning_q_filter_r6(baseband_tuning_q_filter_r6),
    .baseband_tuning_q_filter_r7(baseband_tuning_q_filter_r7),
    .baseband_tuning_q_filter_r8(baseband_tuning_q_filter_r8),
    .baseband_tuning_q_filter_r9(baseband_tuning_q_filter_r9),
    .baseband_tuning_dac_t0(baseband_tuning_dac_t0),
    .baseband_tuning_dac_t1(baseband_tuning_dac_t1),
    .baseband_tuning_dac_t2(baseband_tuning_dac_t2),
    .baseband_tuning_dac_t3(baseband_tuning_dac_t3),
    .baseband_tuning_enable_rx_i(baseband_tuning_enable_rx_i),
    .baseband_tuning_enable_rx_q(baseband_tuning_enable_rx_q),
    .baseband_tuning_mux_dbg_in(baseband_tuning_mux_dbg_in),
    .baseband_tuning_mux_dbg_out(baseband_tuning_mux_dbg_out),
    .resetctrl_hartIsInReset_0(system_resetctrl_hartIsInReset_0),
    .debug_clock(system_debug_clock),
    .debug_reset(system_debug_reset),
    .debug_systemjtag_jtag_TCK(jtag_TCK),
    .debug_systemjtag_jtag_TMS(jtag_TMS),
    .debug_systemjtag_jtag_TDI(jtag_TDI),
    .debug_systemjtag_jtag_TDO_data(jtag_TDO_data),
    .debug_systemjtag_jtag_TDO_driven(jtag_TDO_driven),
    .debug_systemjtag_reset(system_debug_systemjtag_reset),
    .debug_dmactive(system_debug_dmactive),
    .debug_dmactiveAck(system_debug_dmactiveAck),
    .uart_0_txd(uart_0_txd),
    .uart_0_rxd(uart_0_rxd),
    .gpio_0_pins_0_i_ival(system_gpio_0_pins_0_i_ival),
    .gpio_0_pins_0_o_oval(system_gpio_0_pins_0_o_oval),
    .gpio_0_pins_0_o_oe(system_gpio_0_pins_0_o_oe),
    .gpio_0_pins_0_o_ie(system_gpio_0_pins_0_o_ie),
    .gpio_0_pins_1_i_ival(system_gpio_0_pins_1_i_ival),
    .gpio_0_pins_1_o_oval(system_gpio_0_pins_1_o_oval),
    .gpio_0_pins_1_o_oe(system_gpio_0_pins_1_o_oe),
    .gpio_0_pins_1_o_ie(system_gpio_0_pins_1_o_ie),
    .gpio_0_pins_2_i_ival(system_gpio_0_pins_2_i_ival),
    .gpio_0_pins_2_o_oval(system_gpio_0_pins_2_o_oval),
    .gpio_0_pins_2_o_oe(system_gpio_0_pins_2_o_oe),
    .gpio_0_pins_2_o_ie(system_gpio_0_pins_2_o_ie),
    .qspi_0_sck(qspi_0_sck),
    .qspi_0_dq_0_i(system_qspi_0_dq_0_i),
    .qspi_0_dq_0_o(system_qspi_0_dq_0_o),
    .qspi_0_dq_0_oe(system_qspi_0_dq_0_oe),
    .qspi_0_dq_1_i(system_qspi_0_dq_1_i),
    .qspi_0_dq_1_o(system_qspi_0_dq_1_o),
    .qspi_0_dq_1_oe(system_qspi_0_dq_1_oe),
    .qspi_0_dq_2_i(system_qspi_0_dq_2_i),
    .qspi_0_dq_2_o(system_qspi_0_dq_2_o),
    .qspi_0_dq_2_oe(system_qspi_0_dq_2_oe),
    .qspi_0_dq_3_i(system_qspi_0_dq_3_i),
    .qspi_0_dq_3_o(system_qspi_0_dq_3_o),
    .qspi_0_dq_3_oe(system_qspi_0_dq_3_oe),
    .qspi_0_cs_0(qspi_0_cs_0),
    .boot(system_boot)
  );
  ClockGroupAggregator_4 aggregator ( // @[Clocks.scala 77:32 chipyard.TestHarness.EE290CBLEConfig.fir 295665:4]
    .auto_in_member_allClocks_subsystem_cbus_0_clock(aggregator_auto_in_member_allClocks_subsystem_cbus_0_clock),
    .auto_in_member_allClocks_subsystem_cbus_0_reset(aggregator_auto_in_member_allClocks_subsystem_cbus_0_reset),
    .auto_in_member_allClocks_subsystem_fbus_0_clock(aggregator_auto_in_member_allClocks_subsystem_fbus_0_clock),
    .auto_in_member_allClocks_subsystem_fbus_0_reset(aggregator_auto_in_member_allClocks_subsystem_fbus_0_reset),
    .auto_in_member_allClocks_subsystem_pbus_0_clock(aggregator_auto_in_member_allClocks_subsystem_pbus_0_clock),
    .auto_in_member_allClocks_subsystem_pbus_0_reset(aggregator_auto_in_member_allClocks_subsystem_pbus_0_reset),
    .auto_in_member_allClocks_subsystem_sbus_0_clock(aggregator_auto_in_member_allClocks_subsystem_sbus_0_clock),
    .auto_in_member_allClocks_subsystem_sbus_0_reset(aggregator_auto_in_member_allClocks_subsystem_sbus_0_reset),
    .auto_in_member_allClocks_implicit_clock_clock(aggregator_auto_in_member_allClocks_implicit_clock_clock),
    .auto_in_member_allClocks_implicit_clock_reset(aggregator_auto_in_member_allClocks_implicit_clock_reset),
    .auto_out_4_member_subsystem_cbus_subsystem_cbus_0_clock(
      aggregator_auto_out_4_member_subsystem_cbus_subsystem_cbus_0_clock),
    .auto_out_4_member_subsystem_cbus_subsystem_cbus_0_reset(
      aggregator_auto_out_4_member_subsystem_cbus_subsystem_cbus_0_reset),
    .auto_out_3_member_subsystem_fbus_subsystem_fbus_0_clock(
      aggregator_auto_out_3_member_subsystem_fbus_subsystem_fbus_0_clock),
    .auto_out_3_member_subsystem_fbus_subsystem_fbus_0_reset(
      aggregator_auto_out_3_member_subsystem_fbus_subsystem_fbus_0_reset),
    .auto_out_2_member_subsystem_pbus_subsystem_pbus_0_clock(
      aggregator_auto_out_2_member_subsystem_pbus_subsystem_pbus_0_clock),
    .auto_out_2_member_subsystem_pbus_subsystem_pbus_0_reset(
      aggregator_auto_out_2_member_subsystem_pbus_subsystem_pbus_0_reset),
    .auto_out_1_member_subsystem_sbus_subsystem_sbus_0_clock(
      aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_0_clock),
    .auto_out_1_member_subsystem_sbus_subsystem_sbus_0_reset(
      aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_0_reset),
    .auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_clock(
      aggregator_auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_clock),
    .auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_reset(
      aggregator_auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_reset)
  );
  ClockGroup_4 dividerOnlyClockGenerator ( // @[ClockGroup.scala 32:69 chipyard.TestHarness.EE290CBLEConfig.fir 295667:4]
    .auto_in_member_dividerOnlyClockGenerator_implicit_clock_clock(
      dividerOnlyClockGenerator_auto_in_member_dividerOnlyClockGenerator_implicit_clock_clock),
    .auto_in_member_dividerOnlyClockGenerator_implicit_clock_reset(
      dividerOnlyClockGenerator_auto_in_member_dividerOnlyClockGenerator_implicit_clock_reset),
    .auto_out_clock(dividerOnlyClockGenerator_auto_out_clock),
    .auto_out_reset(dividerOnlyClockGenerator_auto_out_reset)
  );
  ClockGroupParameterModifier dividerOnlyClockGenerator_1 ( // @[ClockGroupNamePrefixer.scala 32:15 chipyard.TestHarness.EE290CBLEConfig.fir 295669:4]
    .auto_divider_only_clock_generator_in_3_member_subsystem_cbus_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_3_member_subsystem_cbus_subsystem_cbus_0_clock),
    .auto_divider_only_clock_generator_in_3_member_subsystem_cbus_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_3_member_subsystem_cbus_subsystem_cbus_0_reset),
    .auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_clock),
    .auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_reset),
    .auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_clock),
    .auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_reset),
    .auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_clock),
    .auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_reset),
    .auto_divider_only_clock_generator_out_3_member_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_3_member_subsystem_cbus_0_clock),
    .auto_divider_only_clock_generator_out_3_member_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_3_member_subsystem_cbus_0_reset),
    .auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_clock),
    .auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_reset),
    .auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_clock),
    .auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_reset),
    .auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_clock),
    .auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_reset)
  );
  ClockGroupParameterModifier_1 dividerOnlyClockGenerator_2 ( // @[ClockGroupNamePrefixer.scala 68:15 chipyard.TestHarness.EE290CBLEConfig.fir 295671:4]
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_clock),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_reset),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_clock),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_reset),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_clock),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_reset),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_clock),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_reset),
    .auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_clock),
    .auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_reset)
  );
  ClockGroupResetSynchronizer dividerOnlyClockGenerator_3 ( // @[ResetSynchronizer.scala 42:69 chipyard.TestHarness.EE290CBLEConfig.fir 295673:4]
    .auto_in_member_allClocks_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_cbus_0_clock),
    .auto_in_member_allClocks_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_cbus_0_reset),
    .auto_in_member_allClocks_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_fbus_0_clock),
    .auto_in_member_allClocks_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_fbus_0_reset),
    .auto_in_member_allClocks_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_pbus_0_clock),
    .auto_in_member_allClocks_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_pbus_0_reset),
    .auto_in_member_allClocks_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_0_clock),
    .auto_in_member_allClocks_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_0_reset),
    .auto_in_member_allClocks_implicit_clock_clock(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_implicit_clock_clock),
    .auto_in_member_allClocks_implicit_clock_reset(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_implicit_clock_reset),
    .auto_out_member_allClocks_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_out_member_allClocks_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_out_member_allClocks_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_out_member_allClocks_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_out_member_allClocks_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_out_member_allClocks_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_out_member_allClocks_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_out_member_allClocks_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_0_reset),
    .auto_out_member_allClocks_implicit_clock_clock(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_implicit_clock_clock),
    .auto_out_member_allClocks_implicit_clock_reset(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_implicit_clock_reset)
  );
  DividerOnlyClockGenerator dividerOnlyClockGenerator_4 ( // @[DividerOnlyClockGenerator.scala 149:69 chipyard.TestHarness.EE290CBLEConfig.fir 295675:4]
    .auto_divider_only_clock_generator_in_clock(dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_in_clock),
    .auto_divider_only_clock_generator_in_reset(dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_in_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_clock(
      dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_reset(
      dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_reset)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 debug_reset_syncd_debug_reset_sync ( // @[ShiftReg.scala 45:23 chipyard.TestHarness.EE290CBLEConfig.fir 295708:4]
    .clock(debug_reset_syncd_debug_reset_sync_clock),
    .reset(debug_reset_syncd_debug_reset_sync_reset),
    .io_d(debug_reset_syncd_debug_reset_sync_io_d),
    .io_q(debug_reset_syncd_debug_reset_sync_io_q)
  );
  ResetSynchronizerShiftReg_w1_d3_i0 dmactiveAck_dmactiveAck ( // @[ShiftReg.scala 45:23 chipyard.TestHarness.EE290CBLEConfig.fir 295717:4]
    .clock(dmactiveAck_dmactiveAck_clock),
    .reset(dmactiveAck_dmactiveAck_reset),
    .io_d(dmactiveAck_dmactiveAck_io_d),
    .io_q(dmactiveAck_dmactiveAck_io_q)
  );
  EICG_wrapper gated_clock_debug_clock_gate ( // @[ClockGate.scala 24:20 chipyard.TestHarness.EE290CBLEConfig.fir 295725:4]
    .in(gated_clock_debug_clock_gate_in),
    .test_en(gated_clock_debug_clock_gate_test_en),
    .en(gated_clock_debug_clock_gate_en),
    .out(gated_clock_debug_clock_gate_out)
  );
  
  GenericDigitalInIOCell iocell_bsel ( // @[IOCell.scala 116:23 chipyard.TestHarness.EE290CBLEConfig.fir 295927:4]
    .pad(iocell_bsel_pad),
    .i(iocell_bsel_i),
    .ie(iocell_bsel_ie)
  );
  GenericDigitalInIOCell reset_wire_iocell_reset ( // @[IOCell.scala 116:23 chipyard.TestHarness.EE290CBLEConfig.fir 295936:4]
    .pad(reset_wire_iocell_reset_pad),
    .i(reset_wire_iocell_reset_i),
    .ie(reset_wire_iocell_reset_ie)
  );
  GenericDigitalInIOCell iocell_clock ( // @[IOCell.scala 116:23 chipyard.TestHarness.EE290CBLEConfig.fir 295945:4]
    .pad(iocell_clock_pad),
    .i(iocell_clock_i),
    .ie(iocell_clock_ie)
  );
  
  assign system_clock = dividerOnlyClockGenerator_auto_out_clock; // @[Nodes.scala 1210:84 chipyard.TestHarness.EE290CBLEConfig.fir 295679:4 LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295689:4]
  assign system_reset = dividerOnlyClockGenerator_auto_out_reset; // @[Nodes.scala 1210:84 chipyard.TestHarness.EE290CBLEConfig.fir 295679:4 LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295689:4]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_3_member_subsystem_cbus_0_clock =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_3_member_subsystem_cbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295693:4]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_3_member_subsystem_cbus_0_reset =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_3_member_subsystem_cbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295693:4]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_2_member_subsystem_fbus_0_clock =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295692:4]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_2_member_subsystem_fbus_0_reset =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295692:4]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_1_member_subsystem_pbus_0_clock =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295691:4]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_1_member_subsystem_pbus_0_reset =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295691:4]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_0_member_subsystem_sbus_0_clock =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295690:4]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_0_member_subsystem_sbus_0_reset =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295690:4]
  
  
  assign system_resetctrl_hartIsInReset_0 = system_auto_subsystem_cbus_fixedClockNode_out_reset; // @[Nodes.scala 1210:84 chipyard.TestHarness.EE290CBLEConfig.fir 295677:4 LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295683:4]
  assign system_debug_clock = gated_clock_debug_clock_gate_out; // @[Periphery.scala 303:19 chipyard.TestHarness.EE290CBLEConfig.fir 295733:4]
  assign system_debug_reset = ~_debug_reset_syncd_WIRE; // @[Periphery.scala 291:40 chipyard.TestHarness.EE290CBLEConfig.fir 295714:4]
  
  
  assign system_debug_systemjtag_reset = system_auto_subsystem_cbus_fixedClockNode_out_reset; // @[Nodes.scala 1210:84 chipyard.TestHarness.EE290CBLEConfig.fir 295677:4 LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295683:4]
  assign system_debug_dmactiveAck = dmactiveAck_dmactiveAck_io_q; // @[ShiftReg.scala 48:24 chipyard.TestHarness.EE290CBLEConfig.fir 295721:4 ShiftReg.scala 48:24 chipyard.TestHarness.EE290CBLEConfig.fir 295722:4]
  
  
  assign system_boot = iocell_bsel_i; // @[IOCell.scala 224:26 chipyard.TestHarness.EE290CBLEConfig.fir 295933:4]
  assign aggregator_auto_in_member_allClocks_subsystem_cbus_0_clock =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295695:4]
  assign aggregator_auto_in_member_allClocks_subsystem_cbus_0_reset =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295695:4]
  assign aggregator_auto_in_member_allClocks_subsystem_fbus_0_clock =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295695:4]
  assign aggregator_auto_in_member_allClocks_subsystem_fbus_0_reset =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295695:4]
  assign aggregator_auto_in_member_allClocks_subsystem_pbus_0_clock =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295695:4]
  assign aggregator_auto_in_member_allClocks_subsystem_pbus_0_reset =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295695:4]
  assign aggregator_auto_in_member_allClocks_subsystem_sbus_0_clock =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295695:4]
  assign aggregator_auto_in_member_allClocks_subsystem_sbus_0_reset =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295695:4]
  assign aggregator_auto_in_member_allClocks_implicit_clock_clock =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295695:4]
  assign aggregator_auto_in_member_allClocks_implicit_clock_reset =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295695:4]
  assign dividerOnlyClockGenerator_auto_in_member_dividerOnlyClockGenerator_implicit_clock_clock =
    aggregator_auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_clock; // @[LazyModule.scala 298:16 chipyard.TestHarness.EE290CBLEConfig.fir 295684:4]
  assign dividerOnlyClockGenerator_auto_in_member_dividerOnlyClockGenerator_implicit_clock_reset =
    aggregator_auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_reset; // @[LazyModule.scala 298:16 chipyard.TestHarness.EE290CBLEConfig.fir 295684:4]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_3_member_subsystem_cbus_subsystem_cbus_0_clock
     = aggregator_auto_out_4_member_subsystem_cbus_subsystem_cbus_0_clock; // @[LazyModule.scala 298:16 chipyard.TestHarness.EE290CBLEConfig.fir 295688:4]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_3_member_subsystem_cbus_subsystem_cbus_0_reset
     = aggregator_auto_out_4_member_subsystem_cbus_subsystem_cbus_0_reset; // @[LazyModule.scala 298:16 chipyard.TestHarness.EE290CBLEConfig.fir 295688:4]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_clock
     = aggregator_auto_out_3_member_subsystem_fbus_subsystem_fbus_0_clock; // @[LazyModule.scala 298:16 chipyard.TestHarness.EE290CBLEConfig.fir 295687:4]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_reset
     = aggregator_auto_out_3_member_subsystem_fbus_subsystem_fbus_0_reset; // @[LazyModule.scala 298:16 chipyard.TestHarness.EE290CBLEConfig.fir 295687:4]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_clock
     = aggregator_auto_out_2_member_subsystem_pbus_subsystem_pbus_0_clock; // @[LazyModule.scala 298:16 chipyard.TestHarness.EE290CBLEConfig.fir 295686:4]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_reset
     = aggregator_auto_out_2_member_subsystem_pbus_subsystem_pbus_0_reset; // @[LazyModule.scala 298:16 chipyard.TestHarness.EE290CBLEConfig.fir 295686:4]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_clock
     = aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_0_clock; // @[LazyModule.scala 298:16 chipyard.TestHarness.EE290CBLEConfig.fir 295685:4]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_reset
     = aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_0_reset; // @[LazyModule.scala 298:16 chipyard.TestHarness.EE290CBLEConfig.fir 295685:4]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_clock =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_cbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295696:4]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_reset =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_cbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295696:4]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_clock =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_fbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295696:4]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_reset =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_fbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295696:4]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_clock =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_pbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295696:4]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_reset =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_pbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295696:4]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_clock =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295696:4]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_reset =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295696:4]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_clock =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_implicit_clock_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295696:4]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_reset =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_implicit_clock_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295696:4]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_cbus_0_clock =
    dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295697:4]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_cbus_0_reset =
    dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295697:4]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_fbus_0_clock =
    dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295697:4]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_fbus_0_reset =
    dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295697:4]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_pbus_0_clock =
    dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295697:4]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_pbus_0_reset =
    dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295697:4]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_0_clock =
    dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295697:4]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_0_reset =
    dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295697:4]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_implicit_clock_clock =
    dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_clock; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295697:4]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_implicit_clock_reset =
    dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_reset; // @[LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295697:4]
  assign dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_in_clock = iocell_clock_i; // @[IOCell.scala 182:61 chipyard.TestHarness.EE290CBLEConfig.fir 295949:4]
  assign dividerOnlyClockGenerator_4_auto_divider_only_clock_generator_in_reset = reset_wire_iocell_reset_i; // @[IOCell.scala 183:64 chipyard.TestHarness.EE290CBLEConfig.fir 295940:4]
  assign debug_reset_syncd_debug_reset_sync_clock = system_auto_subsystem_cbus_fixedClockNode_out_clock; // @[Nodes.scala 1210:84 chipyard.TestHarness.EE290CBLEConfig.fir 295677:4 LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295683:4]
  assign debug_reset_syncd_debug_reset_sync_reset = system_debug_systemjtag_reset; // @[Periphery.scala 282:38 chipyard.TestHarness.EE290CBLEConfig.fir 295704:4]
  assign debug_reset_syncd_debug_reset_sync_io_d = 1'h1; // @[ShiftReg.scala 47:16 chipyard.TestHarness.EE290CBLEConfig.fir 295711:4]
  assign dmactiveAck_dmactiveAck_clock = system_auto_subsystem_cbus_fixedClockNode_out_clock; // @[Nodes.scala 1210:84 chipyard.TestHarness.EE290CBLEConfig.fir 295677:4 LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295683:4]
  assign dmactiveAck_dmactiveAck_reset = ~_debug_reset_syncd_WIRE; // @[Periphery.scala 297:38 chipyard.TestHarness.EE290CBLEConfig.fir 295716:4]
  assign dmactiveAck_dmactiveAck_io_d = system_debug_dmactive; // @[ShiftReg.scala 47:16 chipyard.TestHarness.EE290CBLEConfig.fir 295720:4]
  assign gated_clock_debug_clock_gate_in = system_auto_subsystem_cbus_fixedClockNode_out_clock; // @[Nodes.scala 1210:84 chipyard.TestHarness.EE290CBLEConfig.fir 295677:4 LazyModule.scala 296:16 chipyard.TestHarness.EE290CBLEConfig.fir 295683:4]
  assign gated_clock_debug_clock_gate_test_en = 1'h0; // @[ClockGate.scala 27:19 chipyard.TestHarness.EE290CBLEConfig.fir 295731:4]
  assign gated_clock_debug_clock_gate_en = clock_en; // @[ClockGate.scala 28:14 chipyard.TestHarness.EE290CBLEConfig.fir 295732:4]
  

  assign system_gpio_0_pins_0_i_ival = gpio_0_0_i;
  assign gpio_0_0_ie = ~system_gpio_0_pins_0_o_ie; // @[IOBinders.scala 140:22 chipyard.TestHarness.EE290CBLEConfig.fir 295836:4]
  assign gpio_0_0_o = system_gpio_0_pins_0_o_oval; // @[IOBinders.scala 138:21 chipyard.TestHarness.EE290CBLEConfig.fir 295834:4]
  assign gpio_0_0_oe = ~system_gpio_0_pins_0_o_oe; // @[IOBinders.scala 139:22 chipyard.TestHarness.EE290CBLEConfig.fir 295835:4]

  assign system_gpio_0_pins_1_i_ival = gpio_0_1_i;
  assign gpio_0_1_ie = ~system_gpio_0_pins_1_o_ie; // @[IOBinders.scala 140:22 chipyard.TestHarness.EE290CBLEConfig.fir 295847:4]
  assign gpio_0_1_o = system_gpio_0_pins_1_o_oval; // @[IOBinders.scala 138:21 chipyard.TestHarness.EE290CBLEConfig.fir 295845:4]
  assign gpio_0_1_oe = ~system_gpio_0_pins_1_o_oe; // @[IOBinders.scala 139:22 chipyard.TestHarness.EE290CBLEConfig.fir 295846:4]

  assign system_gpio_0_pins_2_i_ival = gpio_0_2_i;
  assign gpio_0_2_ie = ~system_gpio_0_pins_2_o_ie; // @[IOBinders.scala 140:22 chipyard.TestHarness.EE290CBLEConfig.fir 295847:4]
  assign gpio_0_2_o = system_gpio_0_pins_2_o_oval; // @[IOBinders.scala 138:21 chipyard.TestHarness.EE290CBLEConfig.fir 295845:4]
  assign gpio_0_2_oe = ~system_gpio_0_pins_2_o_oe; // @[IOBinders.scala 139:22 chipyard.TestHarness.EE290CBLEConfig.fir 295846:4]
  
  assign system_qspi_0_dq_0_i = spi_0_dq_0_i;
  assign spi_0_dq_0_o = system_qspi_0_dq_0_o; // @[IOBinders.scala 177:21 chipyard.TestHarness.EE290CBLEConfig.fir 295872:4]
  assign spi_0_dq_0_oe = ~system_qspi_0_dq_0_oe; // @[IOBinders.scala 178:22 chipyard.TestHarness.EE290CBLEConfig.fir 295873:4]

  assign system_qspi_0_dq_1_i = spi_0_dq_1_i;
  assign spi_0_dq_1_o = system_qspi_0_dq_1_o; // @[IOBinders.scala 177:21 chipyard.TestHarness.EE290CBLEConfig.fir 295883:4]
  assign spi_0_dq_1_oe = ~system_qspi_0_dq_1_oe; // @[IOBinders.scala 178:22 chipyard.TestHarness.EE290CBLEConfig.fir 295884:4]

  assign system_qspi_0_dq_2_i = spi_0_dq_2_i;
  assign spi_0_dq_2_o = system_qspi_0_dq_2_o; // @[IOBinders.scala 177:21 chipyard.TestHarness.EE290CBLEConfig.fir 295894:4]
  assign spi_0_dq_2_oe = ~system_qspi_0_dq_2_oe; // @[IOBinders.scala 178:22 chipyard.TestHarness.EE290CBLEConfig.fir 295895:4]

  assign system_qspi_0_dq_3_i = spi_0_dq_3_i;
  assign spi_0_dq_3_o = system_qspi_0_dq_3_o; // @[IOBinders.scala 177:21 chipyard.TestHarness.EE290CBLEConfig.fir 295905:4]
  assign spi_0_dq_3_oe = ~system_qspi_0_dq_3_oe; // @[IOBinders.scala 178:22 chipyard.TestHarness.EE290CBLEConfig.fir 295906:4]


  assign iocell_bsel_pad = bsel; // @[IOCell.scala 213:39 chipyard.TestHarness.EE290CBLEConfig.fir 295926:4]
  assign iocell_bsel_ie = 1'h1; // @[IOCell.scala 220:30 chipyard.TestHarness.EE290CBLEConfig.fir 295932:4]
  assign reset_wire_iocell_reset_pad = reset_wire_reset; // @[IOCell.scala 183:54 chipyard.TestHarness.EE290CBLEConfig.fir 295943:4]
  assign reset_wire_iocell_reset_ie = 1'h1; // @[IOCell.scala 167:24 chipyard.TestHarness.EE290CBLEConfig.fir 295942:4]
  assign iocell_clock_pad = clock; // @[IOCell.scala 182:44 chipyard.TestHarness.EE290CBLEConfig.fir 295952:4]
  assign iocell_clock_ie = 1'h1; // @[IOCell.scala 167:24 chipyard.TestHarness.EE290CBLEConfig.fir 295951:4]
  always @(posedge bundleIn_0_clock or posedge _T) begin
    if (_T) begin
      clock_en <= 1'h1;
    end else begin
      clock_en <= dmactiveAck_dmactiveAck_io_q;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  clock_en = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T) begin
    clock_en = 1'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
