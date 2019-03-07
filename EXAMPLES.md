
* D flip-flop q output checker
```systemverilog
ERROR_Q_DID_NOT_FOLLOW_D: assert property ( 
        @(posedge clk) disable iff(!rst_n) 
        (q == $past(d)) 
    );
```
