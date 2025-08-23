`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU
// Engineer: WASEEM
// 
// Create Date: 12.08.2025 11:47:36
// Module Name: CLA_16bit
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
output [15:0]s,
output cout,P0,G0,
output c1,c2,c3,c4);
assign c1 = g[0]|(p[0]&g[0]), c2 = g[1]|(p[1]&g[0])|(p[1]&p[0]&cin) , c3 = g[2]| (g[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin) ,  c4 = g[3]|(p[3]&g[2])| (p[3]&g[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);
assign P0 = p[3] & p[2] & p[1] & p[0], G0 = g[3] | (p[3] &g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]); 
endmodule

module CLA_16bit(
input [15:0]a,b,
input cin,
output [15:0]sum,
output cout
);
wire [15:0]p,g;
wire P0,G0,P1,P2,P3,G1,G2,G3;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16;
adder A1(.a(a[0]), .b(b[0]), .s(sum[0]),.p(p[0]), .g(g[0]), .c(cin));
adder A2(.a(a[1]), .b(b[1]), .s(sum[1]),.p(p[1]), .g(g[1]), .c(c1));
adder A3(.a(a[2]), .b(b[2]), .s(sum[2]),.p(p[2]), .g(g[2]), .c(c2));
adder A4(.a(a[3]), .b(b[3]), .s(sum[3]),.p(p[3]), .g(g[3]),.c(c3));
carry_gen A17(.p(p[3:0]), .g(g[3:0]), .c1(c1), .c2(c2),.c3(c3), .P0(P0), .G0(G0), .cin(cin));

adder A5(.a(a[4]), .b(b[4]), .s(sum[4]),.p(p[4]), .g(g[4]), .c(c4));
adder A6(.a(a[5]), .b(b[5]), .s(sum[5]),.p(p[5]), .g(g[5]), .c(c5));
adder A7(.a(a[6]), .b(b[6]), .s(sum[6]),.p(p[6]), .g(g[6]), .c(c6));
adder A8(.a(a[7]), .b(b[7]), .s(sum[7]),.p(p[7]), .g(g[7]),.c(c7));
carry_gen A18(.p(p[7:4]), .g(g[7:4]), .c1(c5), .c2(c6),.c3(c7), .P0(P1), .G0(G1), .cin(c4));

adder A9(.a(a[8]), .b(b[8]), .s(sum[8]),.p(p[8]), .g(g[8]), .c(c8));
adder A10(.a(a[9]), .b(b[9]), .s(sum[9]),.p(p[9]), .g(g[9]), .c(c9));
adder A11(.a(a[10]), .b(b[10]), .s(sum[10]),.p(p[10]), .g(g[10]), .c(c10));
adder A12(.a(a[11]), .b(b[11]), .s(sum[11]),.p(p[11]), .g(g[11]),.c(c11));
carry_gen A19(.p(p[11:8]), .g(g[11:8]), .c1(c9), .c2(c10),.c3(c11), .P0(P2), .G0(G2), .cin(c8));

adder A13(.a(a[12]), .b(b[12]), .s(sum[12]),.p(p[12]), .g(g[12]), .c(c12));
adder A14(.a(a[13]), .b(b[13]), .s(sum[13]),.p(p[13]), .g(g[13]), .c(c13));
adder A15(.a(a[14]), .b(b[14]), .s(sum[14]),.p(p[14]), .g(g[14]), .c(c14));
adder A16(.a(a[15]), .b(b[15]), .s(sum[15]),.p(p[15]), .g(g[15]),.c(c15));
carry_gen A20(.p(p[15:12]), .g(g[15:12]), .c1(c13), .c2(c14),.c3(c15), .P0(P3), .G0(G3), .cin(c12));


carry_gen A21(.p({P0,P1,P2,P3}), .g({G0,G1,G2,G3}),.c1(c4), .c2(c8),.c3(c12), .cin(cin) , .c4(cout) );

assign cout = c16;
endmodule



