`timescale 1ns / 1ps

module program_counter (
    input clk,       
    input reset,     
    output reg [1:0] Q 
);

    wire [2:0] D;
    wire [2:0] Q_bar; 
	
	assign D[1] = Q[1] ^ Q[0];          
    assign D[0] = ~Q[0];  
     
    D_Flip_Flop dff0 (
        .D(D[0]),
        .CLK(clk),
        .EN(1'b1),   
        .CLR(reset), 
        .L(1'b1),    
        .Q(Q[0]),
        .Q_bar(Q_bar[0])
    );

    D_Flip_Flop dff1 (
        .D(D[1]),
        .CLK(clk),
        .EN(1'b1),   
        .CLR(reset), 
        .L(1'b1),    
        .Q(Q[1]),
        .Q_bar(Q_bar[1])
    );

endmodule