`timescale 1ns / 1ps

module Demux_1x4 (
    input I,              
    input [1:0] S,        
    output [3:0] Y        
);

   
    wire S1_n, S0_n;

    
    not (S1_n, S[1]);
    not (S0_n, S[0]);

   
    and (Y[0], I, S1_n, S0_n);
    and (Y[1], I, S1_n, S[0]); 
    and (Y[2], I, S[1], S0_n); 
    and (Y[3], I, S[1], S[0]); 

endmodule
