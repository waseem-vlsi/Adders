module conditional_sum_adder_4bit(
input [3:0]A,B,
output [4:0]out0, out1);

// Stage 0: Generate all possible sum/carry for all bits and both carry-in
wire [3:0] S_C0, S_C1; 
wire [3:0] C_C0, C_C1;

CC_block a1(.A(A[0]), .B(B[0]), .S0(S_C0[0]), .C0(C_C0[0]), .S1(S_C1[0]), .C1(C_C1[0]));
CC_block a2(.A(A[1]), .B(B[1]), .S0(S_C0[1]), .C0(C_C0[1]), .S1(S_C1[1]), .C1(C_C1[1]));
CC_block a7(.A(A[2]), .B(B[2]), .S0(S_C0[2]), .C0(C_C0[2]), .S1(S_C1[2]), .C1(C_C1[2]));
CC_block a8(.A(A[3]), .B(B[3]), .S0(S_C0[3]), .C0(C_C0[3]), .S1(S_C1[3]), .C1(C_C1[3]));

// First output: carry-in 0 path
wire s1_1, c1_1, s1_2, c1_2, s1_3, c1_3;
Mux_2X1 a3(.I0(S_C0[1]), .I1(S_C1[1]), .sel(C_C0[0]), .Y(s1_1));
Mux_2X1 a4(.I0(C_C0[1]), .I1(C_C1[1]), .sel(C_C0[0]), .Y(c1_1));
Mux_2X1 a13(.I0(S_C0[2]), .I1(S_C1[2]), .sel(c1_1), .Y(s1_2));
Mux_2X1 a15(.I0(C_C0[2]), .I1(C_C1[2]), .sel(c1_1), .Y(c1_2));
Mux_2X1 a14(.I0(S_C0[3]), .I1(S_C1[3]), .sel(c1_2), .Y(s1_3));
Mux_2X1 a15b(.I0(C_C0[3]), .I1(C_C1[3]), .sel(c1_2), .Y(c1_3));

// Second output: carry-in 1 path
wire s2_1, c2_1, s2_2, c2_2, s2_3, c2_3;
Mux_2X1 a5(.I0(S_C0[1]), .I1(S_C1[1]), .sel(C_C1[0]), .Y(s2_1));
Mux_2X1 a6(.I0(C_C0[1]), .I1(C_C1[1]), .sel(C_C1[0]), .Y(c2_1));
Mux_2X1 a16(.I0(S_C0[2]), .I1(S_C1[2]), .sel(c2_1), .Y(s2_2));
Mux_2X1 a18(.I0(C_C0[2]), .I1(C_C1[2]), .sel(c2_1), .Y(c2_2));
Mux_2X1 a17(.I0(S_C0[3]), .I1(S_C1[3]), .sel(c2_2), .Y(s2_3));
Mux_2X1 a18b(.I0(C_C0[3]), .I1(C_C1[3]), .sel(c2_2), .Y(c2_3));

// Outputs
assign out0 = {c1_3, s1_3, s1_2, s1_1, S_C0[0]};
assign out1 = {c2_3, s2_3, s2_2, s2_1, S_C1[0]};

endmodule
