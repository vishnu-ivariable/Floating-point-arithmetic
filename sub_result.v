`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2025 15:17:05
// Design Name: 
// Module Name: sub_result
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


module sub_result(
    input [7:0] A,
    input [7:0] B,
    output [7:0] Out,
	 output b
    );
	 
wire [7:0]d;
wire [7:0]d1;

sub_8bit S(A,B,d,b);
complement2s C(d, d1);
assign Out=(b == 1'b1)?d1:d;
endmodule