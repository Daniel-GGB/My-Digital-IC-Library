module count60_BCD (clk,reset,out,cout);

input wire clk,reset;
output wire [7:0] out;
output wire cout;

reg [3:0] shi;
reg [3:0] ge;
parameter N=60;    //模为60

always@(posedge clk) begin
ge = ge + 1;
if(ge == 10) begin
ge = '0;
shi = shi + 1;
end
if(shi == 10) shi = '0;
end

always@(posedge clk, negedge reset) begin
if(reset == 0) begin
ge = '0; shi = '0;
end
else if((shi == N/10) && (ge == N%10)) begin
shi = '0;
ge = '0;
end
end

assign cout = (shi==(N-1)/10 && ge==(N-1)%10)?1:0;
assign out = {shi,ge};

endmodule
