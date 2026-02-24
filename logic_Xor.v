module logic_Xor(
	input [4:0] A, 
	input [3:0] B,
	output [4:0] S);
		
	xor(S[0], A[0], B[0]);
	xor(S[1], A[1], B[1]);
	xor(S[2], A[2], B[2]);
	xor(S[3], A[3], B[3]);
	or(S[4], A[4], 1'b0);
	
endmodule

