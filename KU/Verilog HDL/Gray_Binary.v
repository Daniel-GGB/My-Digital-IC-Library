module Gray_Binary #(parameter N = 2) (i_Gray,o_Binary);

input wire [N-1:0] i_Gray;
output wire [N-1:0] o_Binary;

assign o_Binary[N-1] = i_Gray[N-1];

genvar i;
generate
	for(i = N-2; i >= 0; i=i-1) begin: gray_2_bin
		assign o_Binary[i] = o_Binary[i+1] ^ i_Gray[i];
	end
endgenerate

endmodule
