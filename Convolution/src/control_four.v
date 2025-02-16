						   `timescale 1ps / 1ps

module counter_four (
    input CLK,
    input RESET,     // Reset input (maps to CLR in flip-flop)
    output [3:0] Q
	// 4-bit counter output
);	  

	 
	
    wire [3:0] D;
    wire [3:0] Q_bar; 
	
		   
assign D[3]=  (~Q[3] & Q[1] & Q[0]) | (~Q[2]) | (Q[3] & ~Q[1]) | (Q[3] & ~Q[0]);
assign D[2] = (Q[2] & ~Q[1]) | (Q[2] & ~Q[0]) | (Q[3] & Q[1] & Q[0]);
assign D[1] = ~Q[1] | ~ Q[0];
assign D[0] = Q[1];

    // Instantiate D flip-flops
    D_Flip_Flop dff0 (
        .D(D[0]),
        .CLK(CLK),
        .EN(1'b1),   // Always enabled
        .CLR(RESET), // Reset signal
        .L(1'b1),    // Always load
        .Q(Q[0]),
        .Q_bar(Q_bar[0])
    );

    D_Flip_Flop dff1 (
        .D(D[1]),
        .CLK(CLK),
        .EN(1'b1),   // Always enabled
        .CLR(RESET), // Reset signal
        .L(1'b1),    // Always load
        .Q(Q[1]),
        .Q_bar(Q_bar[1])
    );

    D_Flip_Flop dff2 (
        .D(D[2]),
        .CLK(CLK),
        .EN(1'b1),   // Always enabled
        .CLR(RESET), // Reset signal
        .L(1'b1),    // Always load
        .Q(Q[2]),
        .Q_bar(Q_bar[2])
    );
	  D_Flip_Flop dff3 (
        .D(D[3]),
        .CLK(CLK),
        .EN(1'b1),   // Always enabled
        .CLR(RESET), // Reset signal
        .L(1'b1),    // Always load
        .Q(Q[3]),
        .Q_bar(Q_bar[3])
    );





endmodule
