`timescale 1ps / 1ps

module four_bit_adder (
    input [3:0] A,   
    input [3:0] B,   
    input Cin,        
    output [3:0] Sum, 
    output Cout      
);

    
    wire c1, c2, c3;

   
    full_adder FA0 (.a(A[0]), .b(B[0]), .cin(Cin),  .s(Sum[0]), .cout(c1));
    full_adder FA1 (.a(A[1]), .b(B[1]), .cin(c1),   .s(Sum[1]), .cout(c2));
    full_adder FA2 (.a(A[2]), .b(B[2]), .cin(c2),   .s(Sum[2]), .cout(c3));
    full_adder FA3 (.a(A[3]), .b(B[3]), .cin(c3),   .s(Sum[3]), .cout(Cout));

endmodule