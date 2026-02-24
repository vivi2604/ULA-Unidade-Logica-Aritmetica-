module soma_A_Cin(
   input [3:0] A_in,
   input Cin,
   output [4:0] A_out);
	
   wire c1, c2, c3;
	
   meiosomador (.A(A_in[0]), .B(Cin), .S(A_out[0]), .Cout(c1));
   meiosomador (.A(A_in[1]), .B(c1), .S(A_out[1]), .Cout(c2));
   meiosomador (.A(A_in[2]), .B(c2), .S(A_out[2]), .Cout(c3));
   meiosomador (.A(A_in[3]), .B(c3), .S(A_out[3]), .Cout(A_out[4]));
    
endmodule