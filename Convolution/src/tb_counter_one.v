`timescale 1ns / 1ps

module tb_counter_one;

    // Inputs
    reg CLK;
    reg RESET;

    // Outputs
    wire [3:0] Q;

    // Instantiate the Unit Under Test (UUT)
    counter_one uut (
        .CLK(CLK),
        .RESET(RESET),
        .Q(Q)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // Clock period = 10 ns
    end

    // Test sequence
    initial begin
        // Initialize inputs
        RESET = 1;  // Assert reset
        #10;        // Hold reset for a few clock cycles

        RESET = 0;  // Release reset
        #120;       // Allow counter to increment for 100 ns

        RESET = 1;  // Assert reset again
        #20;

        RESET = 0;  // Release reset
        #50;        // Run counter for a few more cycles

        $finish;    // End simulation
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | RESET: %b | Q: %b", $time, RESET, Q);
    end

endmodule
