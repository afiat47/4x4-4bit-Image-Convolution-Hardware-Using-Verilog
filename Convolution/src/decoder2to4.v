module decoder2to4 (
    input [1:0] address,   
    output [3:0] row_select 
);

    wire a0_not, a1_not;

  
    not (a0_not, address[0]);
    not (a1_not, address[1]);


    and (row_select[0], a1_not, a0_not); 
    and (row_select[1], a1_not, address[0]); 
    and (row_select[2], address[1], a0_not); 
    and (row_select[3], address[1], address[0]); 

endmodule
