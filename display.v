module display(
    input A, 
	 input B, 
	 input C, 
	 input D,
    output [6:0] d);
    
    wire notA, notB, notC, notD;
    wire [26:0] w;
    
    not(notA, A);
    not(notB, B);
    not(notC, C);
    not(notD, D);
    
    and(w[0], A, C);
    and(w[1], notC, notD, B);
	 and(w[2], A, B);
	 and(w[3], notA, notB, notC, D);
    or(d[0], w[0], w[1], w[2], w[3]);
    
    and(w[4], B, notC, D);
    and(w[5], notD, B, C);
	 and(w[6], A, C);
	 and(w[7], A, B);
    or(d[1], w[4], w[5], w[6], w[7]);
    
	 and(w[8], notD, notB, C);
	 and(w[9], A, B);
	 and(w[10], A, C);
    or(d[2], w[8], w[9], w[10], w[11]);
    
    and(w[12], A, B);
    and(w[13], A, C);
    and(w[14], B, C, D);
	 and(w[15], notC, B, notD);
	 and(w[16], notA, notB, notC, D);
    or(d[3], w[12], w[13], w[14], w[15], w[16]);
    
    and(w[17], notC, B);
	 and(w[18], A, C);
    or(d[4], D, w[17], w[18]);
    
    and(w[19], A, B);
	 and(w[20], C, D);
    and(w[21], notB, C);
	 and(w[22], notA, D, notB);
    or(d[5], w[19], w[20], w[21], w[22]);
    
    and(w[23], A, B);
    and(w[24], A, C);
	 and(w[25], B, C, D);
	 and(w[26], notA, notB, notC);
    or(d[6], w[23], w[24], w[25], w[26]);

endmodule
