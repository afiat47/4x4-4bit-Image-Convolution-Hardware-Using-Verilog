module ALU (
    input [3:0] A,       
    input [3:0] B,     
    input [1:0] Sel,     
    output [7:0] Result  
);

    wire [7:0] Sum;       
    wire [7:0] Product;   
    wire Cout;            
    wire [7:0] SelSum;    
    wire [7:0] SelProduct;

    
    eight_bit_adder ADD (
        .A({4'b0000, A}),  
        .B({4'b0000, B}),  
        .Cin(1'b0),        
        .Sum(Sum),        
        .Cout(Cout)        
    );

    multiplier_4x4 MULT (
        .A(A),             
        .B(B),             
        .Product(Product)  
    );

    // Logic gates to implement the selection
    assign SelSum = {8{Sel[1]}} & Sum;             
    assign SelProduct = {8{Sel[0] & ~Sel[1]}} & Product; 

   
    assign Result = SelSum | SelProduct;           

endmodule
