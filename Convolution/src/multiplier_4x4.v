module multiplier_4x4 (
    input [3:0] A,      
    input [3:0] B,     
    output [7:0] Product 
);

   
    wire [3:0] pp0, pp1, pp2, pp3;
    wire [4:0] sum1, sum2, sum3;
    wire c1, c2;

   
    assign pp0 = A & {4{B[0]}}; 
    assign pp1 = A & {4{B[1]}}; 
    assign pp2 = A & {4{B[2]}}; 
    assign pp3 = A & {4{B[3]}}; 

    
    four_bit_adder ADD1 (.A(pp1), .B({1'b0, pp0[3:1]}), .Cin(1'b0), .Sum(sum1[3:0]), .Cout(sum1[4]));
    four_bit_adder ADD2 (.A(pp2), .B({sum1[4], sum1[3:1]}), .Cin(1'b0), .Sum(sum2[3:0]), .Cout(sum2[4]));
    four_bit_adder ADD3 (.A(pp3), .B({sum2[4], sum2[3:1]}), .Cin(1'b0), .Sum(sum3[3:0]), .Cout(sum3[4]));

   
    assign Product = {sum3[4], sum3[3:0], sum2[0], sum1[0], pp0[0]};

endmodule
