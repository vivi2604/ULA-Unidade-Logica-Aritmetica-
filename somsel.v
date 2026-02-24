module somsel(
    input [3:0] A,
    output [3:0] S);
    
    wire f1, f2, f3, s_mux, descarte;
    wire [3:0] c;
    
    and(f1, A[2], A[1]);
    and(f2, A[2], A[0]);
    or(f3, f1, f2, A[3]);
    
    mux2x1(.i0(1'b0), .i1(1'b1), .sel(f3), .out(s_mux));
    
    meiosomador (.A(A[0]), .B(s_mux),  .S(S[0]), .Cout(c[0]));
    somadorcompleto (.A(A[1]), .B(s_mux), .Cin(c[0]),  .S(S[1]), .Cout(c[1]));
    meiosomador (.A(A[2]), .B(c[1]),  .S(S[2]), .Cout(c[2]));
    meiosomador (.A(A[3]), .B(c[2]),  .S(S[3]), .Cout(descarte));

endmodule

module mux2x1(
    input i0, 
    input i1, 
    input sel,
    output out);
    
    wire f1, f2, notsel;
    
    not(notsel, sel);
     
    and(f1, i0, notsel);
    and(f2, i1, sel);
    or(out, f1, f2);
    
endmodule