`timescale 1ns / 1ps

module register_8bit (
    input [7:0] in,     // 8-bit input
    input i_en,         // Active low enable signal
    input clr,          // Clear signal
    input clk,          // Clock signal
    output [7:0] out    // 8-bit output
);

    // Instantiate 8 D Flip-Flops for the 8-bit register
    D_Flip_Flop dff0 (
        .D(in[0]),
        .CLK(clk),
        .EN(~i_en),    // Enable is active low
        .CLR(clr),
        .L(1'b1),      // Load enable always high
        .Q(out[0]),
        .Q_bar()
    );

    D_Flip_Flop dff1 (
        .D(in[1]),
        .CLK(clk),
        .EN(~i_en),
        .CLR(clr),
        .L(1'b1),
        .Q(out[1]),
        .Q_bar()
    );

    D_Flip_Flop dff2 (
        .D(in[2]),
        .CLK(clk),
        .EN(~i_en),
        .CLR(clr),
        .L(1'b1),
        .Q(out[2]),
        .Q_bar()
    );

    D_Flip_Flop dff3 (
        .D(in[3]),
        .CLK(clk),
        .EN(~i_en),
        .CLR(clr),
        .L(1'b1),
        .Q(out[3]),
        .Q_bar()
    );

    D_Flip_Flop dff4 (
        .D(in[4]),
        .CLK(clk),
        .EN(~i_en),
        .CLR(clr),
        .L(1'b1),
        .Q(out[4]),
        .Q_bar()
    );

    D_Flip_Flop dff5 (
        .D(in[5]),
        .CLK(clk),
        .EN(~i_en),
        .CLR(clr),
        .L(1'b1),
        .Q(out[5]),
        .Q_bar()
    );

    D_Flip_Flop dff6 (
        .D(in[6]),
        .CLK(clk),
        .EN(~i_en),
        .CLR(clr),
        .L(1'b1),
        .Q(out[6]),
        .Q_bar()
    );

    D_Flip_Flop dff7 (
        .D(in[7]),
        .CLK(clk),
        .EN(~i_en),
        .CLR(clr),
        .L(1'b1),
        .Q(out[7]),
        .Q_bar()
    );

endmodule
