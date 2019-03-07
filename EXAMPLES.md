
* D flip-flop q output checker
```systemverilog
ERR_Q_DID_NOT_FOLLOW_D: assert property ( 
        @(posedge clk) disable iff(!rst_n) 
        (q == $past(d)) 
    );
```

* X-checks on interface signals 
```systemverilog
ERRM_AXI4_AWVALID_X: assert property ( 
        @(posedge clk) disable iff(!rst_n) 
        ! $isunknown( awvalid ) 
    );
ERRM_AXI4_AWCMD_X: assert property ( 
        @(posedge clk) disable iff(!rst_n) 
        awvalid -> ! $isunknown({^awaddr, ^awburst, ^awcache, ^awid, ^awlen, ^awlock, ^awprot, ^awsize, ^awqos, ^awregion, }) 
    );
```

