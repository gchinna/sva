// D flip-flop q output checker
ERROR_Q_DID_NOT_FOLLOW_D: assert property ( 
        @(posedge clk) disable iff(!rst_n) 
        (q == $past(d)) 
    );