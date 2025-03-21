`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2025 17:43:34
// Design Name: 
// Module Name: adder_24bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder_24bit(a,b,cout,sum);
input [23:0] a,b;
output [23:0] sum;
output cout;

wire [23:0] cin;
Halfadder h1(a[0],b[0],sum[0],cin[0]);
genvar j;

generate 
begin 
for(j=1;j<=23;j=j+1)
begin
Fulladder f1(a[j],b[j],cin[j-1],sum[j],cin[j]);
end
end
assign cout = cin[23];
endgenerate

endmodule
