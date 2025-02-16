`timescale 1ns / 1ps

module ROM (
    input [3:0] address,  
    output [3:0] data     
);

   
    wire [15:0] row_select;  
    wire [3:0] rom_data [15:0]; 
    reg [3:0] D [15:0]; 

    
    initial begin
        D[0]  = 4'b0001; 
        D[1]  = 4'b0010; 
        D[2]  = 4'b0011; 
        D[3]  = 4'b0010; 
        D[4]  = 4'b0001; 
        D[5]  = 4'b0000; 
        D[6]  = 4'b0001;
        D[7]  = 4'b0001; 
        D[8]  = 4'b0011; 
        D[9]  = 4'b0010; 
        D[10] = 4'b0011; 
        D[11] = 4'b0010; 
        D[12] = 4'b0011; 
        D[13] = 4'b0011; 
        D[14] = 4'b0011; 
        D[15] = 4'b0001; 
    end

    
    decoder4to16 decoder (
        .address(address),
        .row_select(row_select)
    );

    
    generate
        genvar i, j;
        for (i = 0; i < 16; i = i + 1) begin : ROW
            for (j = 0; j < 4; j = j + 1) begin : BIT
                D_Flip_Flop dff (
                    .D(D[i][j]),          
                    .CLK(row_select[i]),  
                    .Q(rom_data[i][j]),   
                    .Q_bar(),             
                    .EN(1'b1),            
                    .CLR(1'b0),           
                    .L(1'b1)              
                );
            end
        end
    endgenerate

   
    assign data = rom_data[address];

endmodule
