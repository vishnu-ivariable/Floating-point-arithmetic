`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2025 14:35:34
// Design Name: 
// Module Name: complement
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


module complement(
    input [7:0] A,
    output [7:0] Out
    );
	 
//wire [7:0]w;
genvar j;

 generate
  begin
   for(j=0;j<8;j=j+1)
    begin
     Mux M(1'b1,1'b0,A[j],Out[j]);
    end
  end
endgenerate

endmodule
