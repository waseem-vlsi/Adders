
module hybrid_RCA_CLA_12_bit_tb();
reg [11:0]A,B;
reg Cin;
wire [12:0]Y;
hybrid_RCA_CLA_12_bit DUT(.A(A), .B(B), .Cin(Cin), .Y(Y));
initial 
begin 
Cin = 1'b0; A = 12'd0; B = 12'd5;
#10 Cin = 1'b0; A = 12'd10; B = 12'd5;
#10 Cin = 1'b0; A = 12'd10; B = 12'd15;
#10 Cin = 1'b0; A = 12'd4095; B = 12'd4095;
#10 $finish;
end
endmodule
