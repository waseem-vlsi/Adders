`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JAMMU
// Engineer: SHAIK WASEEM
// Create Date: 12.08.2025 22:52:06
// Module Name: RCA_4bit
// Project Name: ADDERS
// Target Devices: FPGA

    module full_adder(
    input a,b,c,
    output sum,carry);
    assign sum = a^b^c;
    assign carry = (a&b) | (b&c) | (c&a);
    endmodule
module RCA_4bit(
input [3:0]a,b,
input cin,
output [3:0]sum,
output cout
    );

    wire w1,w2,w3;
    full_adder f1(.a(a[0]), .b(b[0]), .c(cin), .sum(sum[0]), .carry(w1));
    full_adder f2(.a(a[1]), .b(b[1]), .c(w1), .sum(sum[1]), .carry(w2));
    full_adder f3(.a(a[2]), .b(b[2]), .c(w2), .sum(sum[2]), .carry(w3));
    full_adder f4(.a(a[3]), .b(b[3]), .c(w3), .sum(sum[3]), .carry(cout));
endmodule
