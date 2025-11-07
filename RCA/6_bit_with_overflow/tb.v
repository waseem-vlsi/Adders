module RCA_6bit_with_overflow_tb();
reg [5:0]a,b;
reg cin;
wire [5:0]sum;
wire cout,overflow;
RCA_6bit_with_overflow dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout), .overflow(overflow));

initial 
begin 
a = 6'd5; b = 6'd6; cin = 1'd0;
#10 a = 6'd7; b = 6'd1; cin = 1'd0;
#10 a = 6'd1; b = 6'd5; cin = 1'd0;
#10  a = 6'b011111;  b = 6'b000001;  cin = 1'b0;
#10 $finish;
end
endmodule
