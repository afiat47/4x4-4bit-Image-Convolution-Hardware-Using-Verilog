`timescale 1ns / 1ps
module BreadBoard;
	// Inputs
	
    reg clk;
    reg reset;
    reg E;

    // Outputs
    reg [15:0] T;

    // Instantiate the Unit Under Test (UUT)
    control_unit uut (
        .clk(clk),
        .reset(reset),
        .E(E),
        .T(T)
    );
	
	   wire [1:0] Q;

    // Instantiate the program_counter module
    program_counter pc (
        .clk(T[0]),
        .reset(reset),
        .Q(Q)
    );
	
	// Demux
    reg [3:0] Y;
    Demux_1x4 demux (
        .I(T[1]),
        .S(Q),
        .Y(Y)
    );
	
	wire [3:0] A;
	wire [3:0] B;
	wire [3:0] C;
	wire [3:0] D;

    // Instantiate the Unit Under Test (UUT)
   counter_one c_one (
        .CLK(Y[0]),
        .RESET(reset),
        .Q(A)
    );
	
	  counter_two c_two (
        .CLK(Y[1]),
        .RESET(reset),
        .Q(B)
    );
	counter_three c_three (
        .CLK(Y[2]),
        .RESET(reset),
        .Q(C)
    );
	  counter_four c_four (
        .CLK(Y[3]),
        .RESET(reset),
        .Q(D)
    );
	
	reg [3:0] address;       // Shared databus output

    // Instantiate the Unit Under Test (UUT)
    Databus_4bit databus (
        .reg_in0(A),
        .reg_in1(B),
        .reg_in2(C),
        .reg_in3(D),
        .select_source(Q),
        .databus(address)
    );
	
	   wire [3:0] data;

    // Instantiate the Unit Under Test (UUT)
    ROM rom (
        .address(address),
        .data(data)
    );
	
	   wire [3:0] K;
	   assign E=K[3];
    // Instantiate the program_counter module
    kernel_counter kcnt (
        .CLK(T[3]),
        .RESET(reset),
        .Q(K)
    );
	wire [3:0] kernel_value;     

    
    kernel krn (
        .address(K),
        .data(kernel_value)
    );
	
	
	wire [7:0] Result_M;
	wire [7:0] out;
    
    // Instantiate the 8-bit register module
    reg_8bit register_A (
        .in(Result_M),
        .i_en(~T[4]),
        .clr(0),
        .clk(clk),
        .out(out)
    );
	
    ALU alu (
        .A(data), 
        .B(kernel_value), 
        .Sel({0'b0,T[4] }), 			//01 multi
        .Result(Result_M)
    );

	wire [7:0] out2;
	wire [7:0] Result_ADD;
    
    // Instantiate the 8-bit register module
    reg_8bit register_B (
        .in(Result_ADD),
        .i_en(~T[5]),
        .clr(T[0]),
        .clk(clk),
        .out(out2)
    );	
	
	    ALU alu2 (
        .A(out), 
        .B(out2), 
        .Sel({T[5],1'b0 }), 
        .Result(Result_ADD)
    );
	
	
	wire [7:0] data_out;    // 4-bit data output

    // Instantiate the RAM module
    RAM ram (
        .data_in(out2),
        .address(Q),
        .write_enable(1),
        .clk(T[8]),
        .clr(reset),
        .data_out(data_out)
    );
	
	//Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end	
	

    // Test sequence
    initial begin
		
        
        reset = 1; 
        #10;
		
      
        reset = 0;
        #2520;  
        $finish; 
    end
	
    initial begin
        $monitor("E=%b|T=%b|PC=%b|Demux:%b|address=%b|data=%b|kernel=%b| Multiplication:%b | regA:%b | Addition:%b | regB:%b |address:%b RAM:%b" ,E,T,Q,Y,address,data,kernel_value,Result_M,out,Result_ADD,out2,Q,data_out);
    end
	
endmodule