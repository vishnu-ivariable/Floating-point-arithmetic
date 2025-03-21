`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2025 17:42:38
// Design Name: 
// Module Name: fp_add
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


module fp_add(A,B,Out);
input [31:0] A,B;
output [31:0] Out;
wire [22:0] MA,MB;
wire [7:0] EA,EB;

assign EA = A[30:23];
assign MA = A[22:0];
assign MB = B[22:0];
assign EB = B[30:23];

wire [7:0]Modulo;
wire Borrow;
sub_result subtract(EA,EB,Modulo,Borrow);
 
wire [23:0]mux2out,mux1out;
mux_24bit rightshiftertop(MB,MA,Borrow,mux1out);
mux_24bit addertop(MA,MB,Borrow,mux2out);

wire [23:0]outshift;
wire [4:0]shiftdiff;
assign shiftdiff = Modulo[4:0];
barrel_shifter rightshift(mux1out,outshift,shiftdiff);

wire [23:0]adderout;
wire cout;
adder_24bit A1(mux2out,outshift,cout,adderout);

wire [7:0]maxexp ;
mux_8bit expmax(EA,EB,Borrow,maxexp);

wire [7:0]expfinal;
controlled_inc finexp(cout,maxexp,expfinal);

wire [23:0]finalM;
wire [4:0]select;
assign select[4:1] = 4'b0000;
assign select[0] = cout;
barrel_shifter finalshifter(adderout,finalM,select);
assign Out[31] = 0;
assign Out[22:0] = finalM;
assign Out[30:23] = expfinal;

//mux_24bit addertop(MA,MB,Borrow,mux2out);

//wire [23:0]outshift;
//wire [4:0]shiftdiff;
//assign shiftdiff = Modulo[4:0];
//barrel_shifter rightshift(mux1out,outshift,shiftdiff);

//wire [23:0]adderout;
//wire cout;
//adder_24bit A1(mux2out,outshift,adderout,cout);

//wire [7:0]maxexp ;
//mux_8bit expmax(EA,EB,Borrow,maxexp);

//wire [7:0]expfinal;
//controlled_inc finexp(cout,maxexp,expfinal);

//wire [23:0]finalM;
//wire [4:0]select;
//assign select[4:1] = 4'b0000;
//assign select[0] = cout;
//barrel_shifter finalshifter(adderout,finalM,select);
//assign Out[31] = 0;

endmodule
