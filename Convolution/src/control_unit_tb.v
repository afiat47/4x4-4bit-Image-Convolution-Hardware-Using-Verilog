`timescale 1ns / 1ps

module control_unit_tb;

    // Inputs
    reg clk;
    reg reset;
    reg E;
    reg Q;

    // Outputs
    wire [15:0] T;

    // Instantiate the Unit Under Test (UUT)
    control_unit uut (
        .clk(clk),
        .reset(reset),
        .E(E),
        .Q(Q),
        .T(T)
    );

    // Clock generation
    always #5 clk = ~clk; // 100 MHz clock (10 ns period)

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        E = 1;
        Q = 1;

        // Monitor signals
        $monitor("Time = %0t | Reset = %b | E = %b | Q = %b | T = %b", $time, reset, E, Q, T);

        // Apply test cases
        // Test case 1: Reset the system
        #10 reset = 1;
        #10 reset = 0;

        // Test case 2: Basic transition with E = 0, Q = 0
        #20 E = 1; Q = 1;
        //#20 E = 1; Q = 0;

        // Test case 3: Basic transition with E = 1, Q = 1
        //#20 E = 1; Q = 1;
        //#20 E = 0; Q = 1;

        // Test case 5: Verify decoder outputs for different G values
        //#20 E = 0; Q = 0; // Check T values
        //#20 E = 1; Q = 1; // Check T values
        //#20 E = 1; Q = 0; // Check T values
        //#20 E = 0; Q = 1; // Check T values

        // Finish simulation
        #100 $finish;
    end

endmodule