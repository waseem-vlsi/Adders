
module CLA_4bit_tb( );
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;
 CLA_4bit DUT(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
initial
begin
cin = 1'b0;
 a = 4'b0000; b = 4'b0000;
#10 a = 4'b0001; b = 4'b0010;
#10 a = 4'b0001; b = 4'b0011;
#10 a = 4'b0011; b = 4'b0010;
#10 a = 4'b0001; b = 4'b0011;
#10 a = 4'b0011; b = 4'b0110;
#10 a = 4'b0101; b = 4'b0110;
#10 a = 4'b1010; b = 4'b1111;
#10 a = 4'b1111; b = 4'b0110;
end
endmodule
