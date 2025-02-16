module control_unit (
    input clk, 
    input reset,  
	input E,
    output reg [15:0] T
);
reg [3:0] D;  
wire [3:0] G;	  



    // State Register	   
// State Register
    D_Flip_Flop dff0 (
        .D(D[0]),
        .CLK(clk),
        .EN(1'b1),   
        .CLR(reset), 
        .L(1'b1),    
        .Q(G[0]),
        .Q_bar()
    );			 
    D_Flip_Flop dff1 (
        .D(D[1]),
        .CLK(clk),
        .EN(1'b1),   
        .CLR(reset), 
        .L(1'b1),    
        .Q(G[1]),
        .Q_bar()
    );		
    D_Flip_Flop dff2 (
        .D(D[2]),
        .CLK(clk),
        .EN(1'b1),  
        .CLR(reset), 
        .L(1'b1),    
        .Q(G[2]),
        .Q_bar()
    );
    D_Flip_Flop dff3 (
        .D(D[3]),
        .CLK(clk),
        .EN(1'b1),   
        .CLR(reset), 
        .L(1'b1),    
        .Q(G[3]),
        .Q_bar()
    );	 

	 // State Decoder							
	decoder4to16 decoder (
        .address(G),
        .row_select(T)
    );
	
	always @(*) begin 		
		  D[3] = (~G[3] & G[2] & G[1] & G[0] & E);
		  D[2] = (~G[3] & ~G[2] & G[1] & G[0]) | (~G[3] & G[2] & ~G[1] & ~G[0]) | (~G[3] & G[2] & ~G[1] & G[0]) | (~G[3] & G[2] & G[1] & ~G[0]);
		  D[1] = (~G[3] & ~G[2] & ~G[1] & G[0]) | (~G[3] & ~G[2] & G[1] & ~G[0]) | (~G[3] & G[2] & ~G[1] & G[0]) | (~G[3] & G[2] & G[1] & ~G[0]);
		  D[0] = (~G[3] & ~G[2] & ~G[1] & ~G[0]) | (~G[3] & ~G[2] & G[1] & ~G[0]) | (~G[3] & G[2] & ~G[1] & ~G[0]) | (~G[3] & G[2] & G[1] & ~G[0])| (~G[3] & G[2] & G[1] & G[0] & ~E);

	end


endmodule