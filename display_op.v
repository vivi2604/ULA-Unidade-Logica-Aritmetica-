module display_op(
    input A, 
	 input B, 
	 input C, 
    output [6:0] d);
    
    wire notA, notB, notC;
    wire [10:0] w;
    
    not(notA, A);
    not(notB, B);
    not(notC, C);
    
    and(w[0], notC, notA);
	 and(w[1], notB, A);
	 and(w[2], C, B);
    or(d[0], w[0], w[1], w[2]);
     
    or(d[1], A, B);
    
	 and(w[3], notC, A);
	 and(w[4], notC, B);
	 and(w[5], B, A);
    or(d[2], w[3], w[4], w[5]);
    
    xnor(w[6], C, B);
    or(d[3], notA, w[6]);
    
    and(w[7], notB, notC);
	 and(w[8], B, A);
	 and(w[9], C, B);
    or(d[4], w[7], w[8], w[9]);
    
    and(w[10], notC, notB);
    or(d[5], w[10], A);

    and(d[6], A, B, C);

endmodule
	