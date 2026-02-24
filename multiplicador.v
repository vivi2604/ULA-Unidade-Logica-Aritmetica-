module multiplicador(
   input [4:0] A,
   input [3:0] B,
   output [7:0] S);

    wire f00, f01, f02, f03;
   wire f10, f11, f12, f13;
   wire f20, f21, f22, f23;
   wire f30, f31, f32, f33;
    wire f40, f41, f42, f43;
    
   wire [14:0] c;
    wire [7:0] s;
    wire descarte;

   and(f00, A[0], B[0]);
   and(f01, A[0], B[1]);
   and(f02, A[0], B[2]);
   and(f03, A[0], B[3]);
    
   and(f10, A[1], B[0]);
   and(f11, A[1], B[1]);
   and(f12, A[1], B[2]);
   and(f13, A[1], B[3]);

   and(f20, A[2], B[0]);
   and(f21, A[2], B[1]);
   and(f22, A[2], B[2]);
   and(f23, A[2], B[3]);

   and(f30, A[3], B[0]);
   and(f31, A[3], B[1]);
   and(f32, A[3], B[2]);
   and(f33, A[3], B[3]);
    
   and(f40, A[4], B[0]);
   and(f41, A[4], B[1]);
   and(f42, A[4], B[2]);
   and(f43, A[4], B[3]);

   or(S[0], f00, 1'b0);

   meiosomador(.A(f01), .B(f10), .S(S[1]), .Cout(c[0]));
    
    somadorcompleto(.A(f20), .B(f11), .Cin(c[0]), .S(s[0]), .Cout(c[1]));
    meiosomador(.A(f02), .B(s[0]), .S(S[2]), .Cout(c[2]));
    
    somadorcompleto(.A(f21), .B(f30), .Cin(c[1]), .S(s[1]), .Cout(c[3]));
    somadorcompleto(.A(s[1]), .B(f12), .Cin(c[2]), .S(s[2]), .Cout(c[4]));
    meiosomador(.A(s[2]), .B(f03), .S(S[3]), .Cout(c[5]));
    
    somadorcompleto(.A(f40), .B(f31), .Cin(c[3]), .S(s[3]), .Cout(c[6]));
    meiosomador(.A(f41), .B(c[6]), .S(s[4]), .Cout(c[7]));
    somadorcompleto(.A(s[3]), .B(f22), .Cin(c[4]), .S(s[5]), .Cout(c[8]));
    somadorcompleto(.A(s[4]), .B(f32), .Cin(c[8]), .S(s[6]), .Cout(c[9]));
    
    somadorcompleto(.A(f42), .B(c[7]), .Cin(c[9]), .S(s[7]), .Cout(c[10]));
    somadorcompleto(.A(s[5]), .B(f13), .Cin(c[5]), .S(S[4]), .Cout(c[11]));
    somadorcompleto(.A(s[6]), .B(f23), .Cin(c[11]), .S(S[5]), .Cout(c[12]));
    somadorcompleto(.A(s[7]), .B(f33), .Cin(c[12]), .S(S[6]), .Cout(c[13]));
    somadorcompleto(.A(c[10]), .B(f43), .Cin(c[13]), .S(S[7]), .Cout(c[14]));

endmodule

