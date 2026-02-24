module logic_And(
	input [4:0] A, 
	input [3:0] B,
	output [4:0] S);
		
	and(S[0], A[0], B[0]);
	and(S[1], A[1], B[1]);
	and(S[2], A[2], B[2]);
	and(S[3], A[3], B[3]);
	or(S[4], A[4], 1'b0);
	
endmodule

