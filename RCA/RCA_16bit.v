`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU
// Engineer: WASEEM
// 
// Create Date: 12.08.2025 11:47:36
// Module Name: RCA_16bit
// Project Name: ADDERS

    module full_adder(
    input a,b,c,
    output sum,carry);
    assign sum = a^b^c;
    assign carry = (a&b) | (b&c) | (c&a);
    endmodule
module RCA_16bit(
input [15:0]a,b,
input cin,
output [15:0]sum,
output cout
    );

    wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15;
    full_adder f1(.a(a[0]), .b(b[0]), .c(cin), .sum(sum[0]),.carry(w1));
    full_adder f2(.a(a[1]), .b(b[1]), .c(w1), .sum(sum[1]), .carry(w2));
    full_adder f3(.a(a[2]), .b(b[2]), .c(w2), .sum(sum[2]), .carry(w3));
    full_adder f4(.a(a[3]), .b(b[3]), .c(w3), .sum(sum[3]), .carry(w4));
    full_adder f5(.a(a[4]), .b(b[4]), .c(w4), .sum(sum[4]), .carry(w5));
    full_adder f6(.a(a[5]), .b(b[5]), .c(w5), .sum(sum[5]), .carry(w6));
    full_adder f7(.a(a[6]), .b(b[6]), .c(w6), .sum(sum[6]), .carry(w7));
    full_adder f8(.a(a[7]), .b(b[7]), .c(w7), .sum(sum[7]), .carry(w8));
    full_adder f9(.a(a[8]), .b(b[8]), .c(w8), .sum(sum[8]), .carry(w9));
    full_adder f10(.a(a[9]), .b(b[9]), .c(w9), .sum(sum[9]), .carry(w10));
    full_adder f11(.a(a[10]), .b(b[10]), .c(w10), .sum(sum[10]), .carry(w11));
    full_adder f12(.a(a[11]), .b(b[11]), .c(w11), .sum(sum[11]), .carry(w12));
    full_adder f13(.a(a[12]), .b(b[12]), .c(w12), .sum(sum[12]), .carry(w13));
    full_adder f14(.a(a[13]), .b(b[13]), .c(w13), .sum(sum[13]), .carry(w14));
    full_adder f15(.a(a[14]), .b(b[14]), .c(w14), .sum(sum[14]), .carry(w15));
    full_adder f16(.a(a[15]), .b(b[15]), .c(w15), .sum(sum[15]), .carry(cout));
endmodule

