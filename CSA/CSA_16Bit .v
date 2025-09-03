`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU
// Engineer: WASEEM
// 
// Create Date: 04.09.2025 01:49:26
// Design Name: CLA 
// Module Name: CSA_16Bit
//////////////////////////////////////////////////////////////////////////////////////
module mux_2x1(a,b,sel,y);
input [4:0]a,b;
input sel;
output reg [4:0] y;
always@(*)
begin 
case(sel)
1'b0: y = a;
1'b1: y = b;
endcase
end
endmodule

module adder(
input a,b,c,
output p,g,s);
 assign g = a&b;
 assign p = a^b;
 assign s = a^b^c; 
endmodule
module carry_gen(
input [3:0]p,g,
input cin,
output cout,P0,G0,
output c1,c2,c3,c4);
assign c1 = g[0]|(p[0]&cin), c2 = g[1]|(p[1]&g[0])|(p[1]&p[0]&cin) , c3 = g[2]| (p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin),  c4 = g[3]|(p[3]&g[2])| (p[3]&g[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);
assign P0 = p[3] & p[2] & p[1] & p[0], G0 = g[3] | (p[3] &g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]); 
assign cout = c4;
endmodule

module CLA_4bit(
input [3:0]a,b,
input cin,
output [3:0]sum,
output cout);
wire [3:0]p,g;
wire c1,c2,c3,c4,P0,G0;
adder A1(.a(a[0]), .b(b[0]), .s(sum[0]),.p(p[0]), .g(g[0]), .c(cin));
adder A2(.a(a[1]), .b(b[1]), .s(sum[1]),.p(p[1]), .g(g[1]), .c(c1));
adder A3(.a(a[2]), .b(b[2]), .s(sum[2]),.p(p[2]), .g(g[2]), .c(c2));
adder A4(.a(a[3]), .b(b[3]), .s(sum[3]),.p(p[3]), .g(g[3]),.c(c3));
carry_gen A5(.p(p), .g(g), .c1(c1), .c2(c2),.c3(c3), .c4(cout), .P0(P0), .G0(G0), .cin(cin));
endmodule

module Block1(
    input  [3:0] A, B,
    input  cin,
    output [4:0] w1);   // combined {cout,sum}
    wire W1, W2;
    wire [3:0] SUM0, SUM1;
    CLA_4bit D1(.a(A), .b(B), .sum(SUM0), .cout(W1), .cin(1'b0));
    CLA_4bit D2(.a(A), .b(B), .sum(SUM1), .cout(W2), .cin(1'b1));
    mux_2x1 D3(.a({W1, SUM0}), .b({W2, SUM1}), .sel(cin), .y(w1));  
endmodule


module CSA_16Bit(
input [15:0]X,Y,
input CIN,
output [15:0]S,
output COUT);
wire W1,W2,W3,W4;
Block1 Z1(.A(X[3:0]), .B(Y[3:0]), .cin(CIN), .w1({W1, S[3:0]}));
Block1 Z2(.A(X[7:4]), .B(Y[7:4]), .cin(W1), .w1({W2, S[7:4]}));
Block1 Z3(.A(X[11:8]), .B(Y[11:8]), .cin(W2), .w1({W3, S[11:8]}));
Block1 Z4(.A(X[15:12]), .B(Y[15:12]), .cin(W3), .w1({COUT, S[15:12]}));
endmodule
