`ifndef ASSERT_MACROS_SVH
`define ASSERT_MACROS_SVH

// assert property (PROP) on sampling event @(posedge clk)
`define assert_clk( PROP, CLK=clk, RPT_ID=report_id, MSG="assertion failed!" )  \
    assert property (  \
        @(posedge CLK)  \
        (PROP) )  \
    else begin  \
        `uvm_error(RPT_ID, $sformatf("%s:%0d : %s", `__FILE__, `__LINE__, MSG))  \
    end // assert
    
// assert property (PROP) on sampling event @(posedge clk) except when rst_n is asserted
`define assert_clk_xrst( PROP, CLK=clk, RST_N=rst_n, RPT_ID=report_id, MSG="assertion failed!" )  \
    assert property (  \
        @(posedge CLK)  \
        disable iff(!RST_N)  \
        (PROP) )  \
    else begin  \
        `uvm_error(RPT_ID, $sformatf("%s:%0d : %s", `__FILE__, `__LINE__, MSG))  \
    end // assert
        
`endif // ASSERT_MACROS_SVH
