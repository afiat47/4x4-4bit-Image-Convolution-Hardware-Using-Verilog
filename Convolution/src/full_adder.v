
`timescale 1ps / 1ps



module full_adder ( a ,b ,cin ,s ,cout );

input a;
wire a;
input b;
wire b;
input cin;
wire cin;
output s;
wire s;
output cout;
wire cout;	  


wire w1,w2,w3;

half_adder ha1(a ,b ,w1 ,w2);
half_adder ha2(w1 ,cin ,s ,w3);

assign cout = w2 | w3;

//}} End of automatically maintained section

// Enter your statements here //

endmodule
