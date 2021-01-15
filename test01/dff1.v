module dff1 (d,clk,reset,set,q,qn);

input wire d,clk,reset,set;
output reg q,qn;

always@(posedge clk) begin
if(reset == 0) begin
q = 0; qn = 1;
end
else if(set == 1) begin
q = 1; qn = 0;
end
else begin
q = d; qn = ~d;
end
end

endmodule

