`ifndef ASSERT_MACROS_SVH
`define ASSERT_MACROS_SVH

// assert macros use UVM reporting for errors by default.
// use +define+ASSERT_SVA_RPT to use SVA $error() for reporting errors.

// assert property (PROP) on sampling event @(posedge clk)
`define assert_clk( PROP, CLK=clk, RPT_ID=report_id, MSG="assertion failed!" )  \
    assert property (  \
        @(posedge CLK)  \
        (PROP) )  \
    else begin  \
        `ifdef ASSERT_SVA_RPT  \
            $error($sformatf("[%s] %s", RPT_ID, MSG))  \
        `else  \
            `uvm_error(RPT_ID, $sformatf("%s", MSG))  \
        `endif  \
    end // assert
    
// assert property (PROP) on sampling event @(posedge clk) except when rst_n is asserted
`define assert_clk_xrst( PROP, CLK=clk, RST_N=rst_n, RPT_ID=report_id, MSG="assertion failed!" )  \
    assert property (  \
        @(posedge CLK)  \
        disable iff(!RST_N)  \
        (PROP) )  \
    else begin  \
        `ifdef ASSERT_SVA_RPT  \
            $error($sformatf("[%s] %s", RPT_ID, MSG))  \
        `else  \
            `uvm_error(RPT_ID, $sformatf("%s", MSG))  \
    end // assert
 
`endif // ASSERT_MACROS_SVH
