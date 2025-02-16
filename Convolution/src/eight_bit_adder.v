`timescale 1ps / 1ps

module eight_bit_adder (
    input [7:0] A,   
    input [7:0] B,    
    input Cin,        
    output [7:0] Sum, 
    output Cout       
);


    wire c1, c2, c3, c4, c5, c6, c7;


    full_adder FA0 (.a(A[0]), .b(B[0]), .cin(Cin),  .s(Sum[0]), .cout(c1));
    full_adder FA1 (.a(A[1]), .b(B[1]), .cin(c1),   .s(Sum[1]), .cout(c2));
    full_adder FA2 (.a(A[2]), .b(B[2]), .cin(c2),   .s(Sum[2]), .cout(c3));
    full_adder FA3 (.a(A[3]), .b(B[3]), .cin(c3),   .s(Sum[3]), .cout(c4));
    full_adder FA4 (.a(A[4]), .b(B[4]), .cin(c4),   .s(Sum[4]), .cout(c5));
    full_adder FA5 (.a(A[5]), .b(B[5]), .cin(c5),   .s(Sum[5]), .cout(c6));
    full_adder FA6 (.a(A[6]), .b(B[6]), .cin(c6),   .s(Sum[6]), .cout(c7));
    full_adder FA7 (.a(A[7]), .b(B[7]), .cin(c7),   .s(Sum[7]), .cout(Cout));

endmodule
