`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2025 16:37:42
// Design Name: 
// Module Name: mux_24bit
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


module mux_24bit(

    input [22:0] A,
    input [22:0] B,
    input S,
	 output [23:0] Out
    );
	 
genvar i;

generate
 begin
  for(i=0;i<23;i = i + 1)
    Mux M(A[i],B[i],S,Out[i]);
  end
endgenerate

assign Out[23]=1'b1;

endmodule
