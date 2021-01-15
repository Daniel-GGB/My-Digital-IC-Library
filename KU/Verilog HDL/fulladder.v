
module fulladder4 #(parameter N = 4) (sum,cout,cin,a,b);

input wire [N-1:0] a,b;
input wire cin;
output reg [N-1:0] sum;
output reg cout;

wire [N:0] temp;
assign temp = cin+a+b;

always@(cin,a,b) begin
if(temp <= 9) {cout,sum} = temp;
else {cout,sum} = temp+6;
end

endmodule

