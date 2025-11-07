
module full_adder(
    input a, b, c,
    output sum, carry
);
    assign sum   = a ^ b ^ c;
    assign carry = (a & b) | (b & c) | (c & a);
endmodule


module RCA_6bit_with_overflow(
    input [5:0] a, b,
    input cin,
    output [5:0] sum,
    output cout,
    output overflow
);
    wire w1, w2, w3, w4, w5;

    full_adder f1 (.a(a[0]), .b(b[0]), .c(cin),  .sum(sum[0]), .carry(w1));
    full_adder f2 (.a(a[1]), .b(b[1]), .c(w1),   .sum(sum[1]), .carry(w2));
    full_adder f3 (.a(a[2]), .b(b[2]), .c(w2),   .sum(sum[2]), .carry(w3));
    full_adder f4 (.a(a[3]), .b(b[3]), .c(w3),   .sum(sum[3]), .carry(w4));
    full_adder f5 (.a(a[4]), .b(b[4]), .c(w4),   .sum(sum[4]), .carry(w5));
    full_adder f6 (.a(a[5]), .b(b[5]), .c(w5),   .sum(sum[5]), .carry(cout));

    // Overflow = carry into MSB XOR carry out of MSB
    assign overflow = w5 ^ cout;
endmodule
