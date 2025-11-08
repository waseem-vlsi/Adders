module conditional_sum_adder_4bit_tb( );
reg [3:0]A,B;
wire [4:0]out0, out1;
conditional_sum_adder_4bit dut(.A(A), .B(B), .out0(out0), .out1(out1));

initial 
begin
A = 4'd10; B = 4'd15;
#10 $finish;
end 
endmodule
