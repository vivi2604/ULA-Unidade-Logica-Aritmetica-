module display2(
    input A, 
     input B, 
    output [6:0] d);
    
   wire notA, notB;
   wire [26:0] w;
    
   not(notA, A);
   not(notB, B);
    
   and(d[0], notB, A);
    
   or(d[1], 1'b0, 1'b0);
    
    and(d[2], B, notA);
    
    or(d[3], d[0], 1'b0);
    
    or(d[4], d[0], 1'b0);
    
    xor(d[5], A, B);
    
    or(d[6], notB, 1'b0);

endmodule




