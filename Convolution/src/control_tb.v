`timescale 1ns / 1ps

module control_tb;

    // Inputs
    reg clk;
    reg reset;
    reg E;

    // Outputs
    wire [15:0] T;

    // Instantiate the Unit Under Test (UUT)
    control_unit uut (
        .clk(clk),
        .reset(reset),
        .E(E),
        .T(T)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period = 10 ns
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;  // Apply reset
        E = 0;      // Set E to 0
        #20;        // Hold reset for 20 ns

        reset = 0;  // Release reset
        #10;

        // Test 1: E = 0
        E = 0;
        #80;

        // Test 2: E = 1
        E = 1;
        #50;

        // Test 3: Reset again
        reset = 1;
        #20;
        reset = 0;
        #30;

        $finish; // End simulation
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | reset: %b | E: %b | T: %b", 
                 $time, reset, E, T);
    end

endmodule
