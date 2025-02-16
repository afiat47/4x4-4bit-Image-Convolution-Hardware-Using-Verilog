`timescale 1ns / 1ps
module Databus_2bit (
    input [3:0] reg_in0,         // Input from Register 0
    input [3:0] reg_in1,         // Input from Register 1
    input [3:0] reg_in2,
	input [3:0] reg_in3,// Input from Register 2
    input [1:0] select_source,   // Select signal to choose the source register
    output reg [3:0] databus     // 4-bit output on the shared databus
);

    // Combinational logic to select which register drives the databus
    always @(*) begin
        case (select_source)
            2'b00: databus = reg_in0;  // Register 0 drives the bus
            2'b01: databus = reg_in1;  // Register 1 drives the bus
            2'b10: databus = reg_in2;
			2'b11: databus = reg_in3;// Register 2 drives the bus
            default: databus = 4'b0000; // Default: Bus is zero
        endcase
    end

endmodule
