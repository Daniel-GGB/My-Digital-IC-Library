module Binary_Gray #(parameter N=2)(i_Binary,o_Gray);

input wire [N-1:0] i_Binary;
output wire [N-1:0] o_Gray;

assign o_Gray = i_Binary ^ (i_Binary >> 1);

endmodule



