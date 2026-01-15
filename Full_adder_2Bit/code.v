
module full_adder_1bit(
    input  A, B, Cin,
    output Sum, Carry
);
    assign Sum   = A ^ B ^ Cin;
    assign Carry = (A & B) | (B & Cin) | (A & Cin);
endmodule


module full_adder(
    input  [1:0] A, B,
    input        Cin,
    output [1:0] Sum,
    output       Cout,
    output [2:0]out
);

wire c1;

full_adder_1bit FA0 (
    .A(A[0]), .B(B[0]), .Cin(Cin),
    .Sum(Sum[0]), .Carry(c1)
);

full_adder_1bit FA1 (
    .A(A[1]), .B(B[1]), .Cin(c1),
    .Sum(Sum[1]), .Carry(Cout)
);
assign out = {Cout,Sum};
endmodule
