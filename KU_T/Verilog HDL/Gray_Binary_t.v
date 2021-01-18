`timescale 1ns/1ns
module Gray_Binary_t ();

parameter N = 8;

reg [N-1:0] i_Gray;
wire [N-1:0] o_Binary;

Gray_Binary #(N) U1 (i_Gray,o_Binary);

initial begin
#5
i_Gray = 8'b00111001;
end
endmodule

