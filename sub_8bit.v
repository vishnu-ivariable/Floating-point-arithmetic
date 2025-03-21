`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2025 15:12:51
// Design Name: 
// Module Name: sub_8bit
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


module sub_8bit ( input [7:0] A,
    input [7:0] B,
    output [7:0] D,
    output Bout
    );
	 
wire [7:0] w;

half_sub H1(A[0],B[0],D[0],w[0]);
full_sub F1(A[1],B[1],w[0],D[1],w[1]);
full_sub F2(A[2],B[2],w[1],D[2],w[2]);
full_sub F3(A[3],B[3],w[2],D[3],w[3]);
full_sub F4(A[4],B[4],w[3],D[4],w[4]);
full_sub F5(A[5],B[5],w[4],D[5],w[5]);
full_sub F6(A[6],B[6],w[5],D[6],w[6]);
full_sub F7(A[7],B[7],w[6],D[7],w[7]);

assign Bout=w[7];
endmodule
