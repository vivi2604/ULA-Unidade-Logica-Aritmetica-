module ss4b(
   input Op,
   input [4:0] A,
   input [3:0] B,
     
   output [3:0] S,
   output Cout,
   output OV,
   output ERRO);

   wire [3:0] B_mod;
   wire c1, c2, c3, c4, c5;
   wire not_c5, sx, not_op;

   xor(B_mod[0], B[0], Op);
   xor(B_mod[1], B[1], Op);
   xor(B_mod[2], B[2], Op);
   xor(B_mod[3], B[3], Op);

   somadorcompleto (.A(A[0]), .B(B_mod[0]), .Cin(Op),  .S(S[0]), .Cout(c1));
   somadorcompleto (.A(A[1]), .B(B_mod[1]), .Cin(c1),  .S(S[1]), .Cout(c2));
   somadorcompleto (.A(A[2]), .B(B_mod[2]), .Cin(c2),  .S(S[2]), .Cout(c3));
   somadorcompleto (.A(A[3]), .B(B_mod[3]), .Cin(c3),  .S(S[3]), .Cout(c4));
   somadorcompleto (.A(A[4]), .B(Op), .Cin(c4), .S(sx), .Cout(c5));

   xor(OV, c3, c4);
    
   not (not_c5, c5);
	not (not_op, Op);
   and (ERRO, Op, not_c5);
    
   and(Cout, not_op, sx);

endmodule

