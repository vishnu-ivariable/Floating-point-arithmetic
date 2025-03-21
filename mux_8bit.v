`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2025 16:45:18
// Design Name: 
// Module Name: mux_8bit
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


module mux_8bit(
    input [7:0] A,
    input [7:0] B,
    input C,
    output [7:0] Out
    );
	 
 genvar j;
 
 generate 
  begin
   for(j=0;j<=7;j=j+1)
    begin
     Mux M(A[j],B[j],C,Out[j]);
    end
   end
endgenerate

endmodule
