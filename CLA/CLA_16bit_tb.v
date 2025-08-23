`timescale 1ns / 1ps


module CLA_16bit_tb();
reg [15:0]a,b;
reg cin;
wire [15:0]sum;
wire cout;
CLA_16bit DUT(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
initial
begin
cin = 1'b0;
 a = 16'd5; b = 16'd5;
#10 a = 16'd10; b = 16'd11;
#10 a = 16'd10; b = 16'd10;
#10 a = 16'd1; b = 16'd11;#10 a = 16'd12; b = 16'd12;

    end  
endmodule
