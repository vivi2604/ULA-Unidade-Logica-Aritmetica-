module somadorcompleto(
    input A, B, Cin,
    output S, Cout);
    
    wire F1, F2, F3;
    
    xor(S, A, B, Cin);
    
    and(F1, A, B);
    xor(F2, A, B);
    and(F3, F2, Cin);
    or(Cout, F1, F3);
    
endmodule