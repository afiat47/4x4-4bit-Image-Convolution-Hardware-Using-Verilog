`timescale 1ns / 1ps

module tb_RAM();

    // Testbench signals
    reg [3:0] data_in;      // 4-bit data input
    reg [1:0] address;      // 2-bit address input
    reg write_enable;       // Write enable signal
    reg clk;                // Clock signal
    reg clr;                // Clear signal for reset
    wire [3:0] data_out;    // 4-bit data output

    // Instantiate the RAM module
    RAM uut (
        .data_in(data_in),
        .address(address),
        .write_enable(write_enable),
        .clk(clk),
        .clr(clr),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Testbench procedure
    initial begin
        // Initialize inputs
        clr = 1;          // Assert clear
        write_enable = 0; // Disable write
        data_in = 4'b0000;
        address = 2'b00;

        #10;  // Wait for reset to propagate
        clr = 0;  // De-assert clear

        // Test write operations
        write_enable = 1;
        address = 2'b00; data_in = 4'b1010; #10; // Write 0xA to address 0
        address = 2'b01; data_in = 4'b0101; #10; // Write 0x5 to address 1
        address = 2'b10; data_in = 4'b1111; #10; // Write 0xF to address 2
        address = 2'b11; data_in = 4'b0011; #10; // Write 0x3 to address 3

        // Test read operations
        write_enable = 0; // Disable write
        address = 2'b00; #10; // Read from address 0, expect 0xA
        $display("Address 0: Data = %b", data_out);

        address = 2'b01; #10; // Read from address 1, expect 0x5
        $display("Address 1: Data = %b", data_out);

        address = 2'b10; #10; // Read from address 2, expect 0xF
        $display("Address 2: Data = %b", data_out);

        address = 2'b11; #10; // Read from address 3, expect 0x3
        $display("Address 3: Data = %b", data_out);

        // Reset and verify data cleared
        clr = 1; #10; // Assert clear
        clr = 0; #10; // De-assert clear

        address = 2'b00; #10; // Read from address 0, expect 0x0
        $display("After Reset - Address 0: Data = %b", data_out);

        address = 2'b01; #10; // Read from address 1, expect 0x0
        $display("After Reset - Address 1: Data = %b", data_out);

        address = 2'b10; #10; // Read from address 2, expect 0x0
        $display("After Reset - Address 2: Data = %b", data_out);

        address = 2'b11; #10; // Read from address 3, expect 0x0
        $display("After Reset - Address 3: Data = %b", data_out);

        // End of simulation
        $stop;
    end
endmodule
