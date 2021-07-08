
//! 
//! # ADC Wrapper 
//! 
//! with its full, ultra-fun Virtuoso cellname 
//! 
module AAA_Slice_edit_sampfix_SA_wrap ( //have to change to ADC if using wrapper
    inout   VDD, VSS,
    input   clk,
    output [8:0]  data_out,
    inout [2:0] vref,
    input in_n, in_p,

    inout top_n, top_p,
    inout [7:0] bot_n, bot_p,
    output [8:0] dm, dp, dn,
    output comp_clk, comp_n, comp_p,
    output clk16, clk_out
    //inout [`ANALOG_PADS-1:0] io_analog,
    //inout [2:0] io_clamp_high,    // FIXME: handling these
    //inout [2:0] io_clamp_low      // FIXME: handling these
);
endmodule
