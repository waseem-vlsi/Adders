
module tb_full_adder_2bit;
reg  [1:0] A, B;
reg        Cin;
wire [1:0] Sum;
wire       Cout;
wire [2:0]out;
full_adder dut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout), .out(out));

initial begin
    A=2'b00; B=2'b00; Cin=0;
    #10 A=2'b01; B=2'b01; Cin=0;
    #10 A=2'b10; B=2'b01; Cin=1;
    #10 A=2'b11; B=2'b11; Cin=0;
    #10 $finish;
end
endmodule


