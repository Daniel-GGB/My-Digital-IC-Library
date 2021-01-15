`timescale 1ns/1ps
module fulladder4_t();

parameter N = 4;
reg [N-1:0] a,b;
reg cin;
wire [N-1:0] sum;
wire cout;

fulladder4 #(N) f1 (sum,cout,cin,a,b);

initial begin

#10 
cin = 1'b0;
a = 1;
b = 1;
#20
cin = 1'b0;
a = 7;
b = 8;
#20
cin = 1'b0;
a = 6;
b = 9;
#20
cin = 1'b0;
a = 3;
b = 7;
#20
cin = 1'b1;
a = 4;
b = 4;
#20
cin = 1'b1;
a = 8;
b = 5;
#20
cin = 1'b1;
a = 2;
b = 3;
#20
cin = 1'b1;
a = 5;
b = 6;
end

endmodule




