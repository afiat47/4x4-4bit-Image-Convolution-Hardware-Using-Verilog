`timescale 1ns / 1ps

module RAM (
    input [7:0] data_in,    // 8-bit data input
    input [1:0] address,    // 2-bit address input (for 4 addresses)
    input write_enable,     // Write enable signal
    input clk,              // Clock signal
    input clr,              // Clear signal for reset
    output [7:0] data_out   // 8-bit data output
);

    // Internal signals
    wire [3:0] row_select;      // Decoder output for row selection
    reg [7:0] data_out_reg;     // Output register for data_out

    // Memory implementation using 32 D flip-flops (4x8 matrix)
    wire [7:0] memory [3:0];    // 4x8 memory array

    // Address decoder: 2-to-4 line decoder
    decoder2to4 decoder (
        .address(address),
        .row_select(row_select)
    );

    // Instantiate D flip-flops for each bit in the 4x8 memory
    genvar i, j;
    generate
        for (i = 0; i < 4; i = i + 1) begin : ROW
            for (j = 0; j < 8; j = j + 1) begin : BIT
                D_Flip_Flop dff (
                    .D(data_in[j]),               // Data input for the flip-flop
                    .CLK(clk),                    // Clock signal
                    .EN(write_enable & row_select[i]), // Enable writing on selected row
                    .CLR(clr),                    // Clear signal
                    .L(1'b1),                     // Always load when EN is high
                    .Q(memory[i][j]),             // Data stored in the flip-flop
                    .Q_bar()                      // Not used
                );
            end
        end
    endgenerate

    // Read operation: Assign the selected row to the output
    always @(*) begin
        case (address)
            2'b00: data_out_reg = memory[0];
            2'b01: data_out_reg = memory[1];
            2'b10: data_out_reg = memory[2];
            2'b11: data_out_reg = memory[3];
            default: data_out_reg = 8'b00000000;
        endcase
    end

    // Connect the output register to the data_out port
    assign data_out = data_out_reg;

endmodule
