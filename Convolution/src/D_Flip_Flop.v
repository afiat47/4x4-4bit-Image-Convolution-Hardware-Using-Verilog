`timescale 1ps / 1ps

module D_Flip_Flop (
    input D,
    input CLK,
    input EN,
    input CLR,
    input L,
    output Q,
    output Q_bar
);

    // Internal signal declaration
    reg temp;

    // Asynchronous Reset and Sequential Logic
    always @(posedge CLK or posedge CLR) begin
        if (CLR) begin
            temp <= 1'b0; // Reset to 0 on CLR
        end else if (EN) begin
            if (L) begin
                temp <= D; // Load D when L is high
            end
        end
    end

    // Assign output signals
    assign Q = temp;
    assign Q_bar = ~temp;

endmodule
