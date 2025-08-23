`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU
// Engineer: WASEEM
// 
// Create Date: 20.08.2025 01:09:22
// Design Name: CLA_4bit
// Module Name: CLA_4bit_new
// Project Name: ADDERS

module adder(
input a,b,c,
output p,g,s);
 
 assign g = a&b;
 assign p = a^b;
 assign s = p^c; 
endmodule
module carry_gen(
input [3:0]p,g,
input cin,
output [3:0]s,
output cout,P0,G0,
output c1,c2,c3);
assign c1 = g[0]|(p[0]&g[0]), c2 = g[1]|(p[1]&g[0])|(p[1]&p[0]&cin) , c3 = g[2]| (g[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin); 
assign P0 = p[3] & p[2] & p[1] & p[0], G0 = g[3] | (p[3] &g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]); 
endmodule

module CLA_4bit(
input [3:0]a,b,
input cin,
output [3:0]sum,
output P0,G0);
wire [3:0]p,g;
wire c1,c2,c3;
adder A1(.a(a[0]), .b(b[0]), .s(sum[0]),.p(p[0]), .g(g[0]), .c(cin));
adder A2(.a(a[1]), .b(b[1]), .s(sum[1]),.p(p[1]), .g(g[1]), .c(c1));
adder A3(.a(a[2]), .b(b[2]), .s(sum[2]),.p(p[2]), .g(g[2]), .c(c2));
adder A4(.a(a[3]), .b(b[3]), .s(sum[3]),.p(p[3]), .g(g[3]),.c(c3));
carry_gen A5(.p(p), .g(g), .c1(c1), .c2(c2),.c3(c3), .P0(P0), .G0(G0));
endmodule
