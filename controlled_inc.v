`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2025 16:52:57
// Design Name: 
// Module Name: controlled_inc
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


module controlled_inc(A,Z,out );
input A;
input [7:0]Z;
output [7:0]out;

wire [7:0]w;
wire [7:0]cin;

assign w = (A==1'b1)?1:0;

Halfadder H(Z[0],w[0],out[0],cin[0]);

genvar j;
generate 
 begin
  for(j=1;j<8;j=j+1)
   begin
   Fulladder F1(Z[j],w[j],cin[j-1],out[j],cin[j]);
   end
 end
endgenerate

endmodule
