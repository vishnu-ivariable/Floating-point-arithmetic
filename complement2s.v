`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2025 12:45:26
// Design Name: 
// Module Name: complement2s
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


module complement2s(
    input [7:0] A,
    output [7:0] Out
    );
	 
wire [7:0]w;
genvar j;

 generate
  begin
   for(j=0;j<8;j=j+1)
    begin
     Mux M(1'b1,1'b0,A[j],w[j]);
    end
  end
endgenerate

wire [7:0]c;
Halfadder H1(w[0],1'b1,Out[0],c[0]);

genvar i;

	generate
		begin
			for(i=1;i<8;i=i+1)
			  begin
			    Fulladder F1(w[i],1'b0,c[i-1],Out[i],c[i]);
			  end
		end
	endgenerate
	
endmodule