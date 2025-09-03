module CSA_16Bit_tb( );
reg [15:0]X,Y;
reg CIN;
wire [15:0]S;
wire COUT;
CSA_16Bit dut(.X(X), .Y(Y), .S(S), .COUT(COUT), .CIN(CIN));
initial
begin 
CIN = 1'b0;
X = 16'b0000000000000001; Y = 16'b0000000000000001;
#5  X = 16'b0000000000000101; Y = 16'b0000000000000101;
 #5 X = 16'b0100000000000001; Y = 16'b0100000000000001;

#5 $finish;
end  
endmodule
