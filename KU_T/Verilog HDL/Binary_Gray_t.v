`timescale 1ns/1ns
module Binary_Gray_t ();

parameter N=8;

reg [N-1:0] i_Binary;
wire [N-1:0] o_Gray;

Binary_Gray #(N) U1(i_Binary,o_Gray);

initial begin
#10
i_Binary = 8'b00101110;
end

endmodule



