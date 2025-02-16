`timescale 1ns / 1ps
module Databus_4bit (
    input [3:0] reg_in0,         
    input [3:0] reg_in1,         
    input [3:0] reg_in2,
	input [3:0] reg_in3,
    input [1:0] select_source,   
    output reg [3:0] databus     
);

   
    always @(*) begin
        case (select_source)
            2'b00: databus = reg_in0;  
            2'b01: databus = reg_in1;  
            2'b10: databus = reg_in2;
			2'b11: databus = reg_in3;
            default: databus = 4'b0000; 
        endcase
    end

endmodule
