module decoder4to16 (
    input [3:0] address,
    output [15:0] row_select
);

    wire a0_not, a1_not, a2_not, a3_not;

    not (a0_not, address[0]);
    not (a1_not, address[1]);
    not (a2_not, address[2]);
    not (a3_not, address[3]);

    and (row_select[0], a3_not, a2_not, a1_not, a0_not);
    and (row_select[1], a3_not, a2_not, a1_not, address[0]);
    and (row_select[2], a3_not, a2_not, address[1], a0_not);
    and (row_select[3], a3_not, a2_not, address[1], address[0]);
    and (row_select[4], a3_not, address[2], a1_not, a0_not);
    and (row_select[5], a3_not, address[2], a1_not, address[0]);
    and (row_select[6], a3_not, address[2], address[1], a0_not);
    and (row_select[7], a3_not, address[2], address[1], address[0]);
    and (row_select[8], address[3], a2_not, a1_not, a0_not);
    and (row_select[9], address[3], a2_not, a1_not, address[0]);
    and (row_select[10], address[3], a2_not, address[1], a0_not);
    and (row_select[11], address[3], a2_not, address[1], address[0]);
    and (row_select[12], address[3], address[2], a1_not, a0_not);
    and (row_select[13], address[3], address[2], a1_not, address[0]);
    and (row_select[14], address[3], address[2], address[1], a0_not);
    and (row_select[15], address[3], address[2], address[1], address[0]);

endmodule