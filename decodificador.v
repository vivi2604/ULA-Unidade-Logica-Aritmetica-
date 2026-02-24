module decodificador(
    input [7:0] S,
    output [0:6] d1,
    output [0:6] d2,
    output [0:6] d3);
    
    wire [3:0] ss0, ss1, ss2, ss3, ss4, ss5, ss6;
    
    somsel (.A({1'b0, S[7], S[6], S[5]}), .S(ss0));
    somsel (.A({ss0[2], ss0[1], ss0[0], S[4]}), .S(ss1));
    somsel (.A({ss1[2], ss1[1], ss1[0], S[3]}), .S(ss2));
    somsel (.A({ss2[2], ss2[1], ss2[0], S[2]}), .S(ss3));
    somsel (.A({ss3[2], ss3[1], ss3[0], S[1]}), .S(ss4));
    
    somsel (.A({1'b0, ss0[3], ss1[3], ss2[3]}), .S(ss5));
    somsel (.A({ss5[2], ss5[1], ss5[0], ss3[3]}), .S(ss6));
    
    display (.A(ss4[2]), .B(ss4[1]), .C(ss4[0]), .D(S[0]), .d(d1));
    display (.A(ss6[2]), .B(ss6[1]), .C(ss6[0]), .D(ss4[3]), .d(d2));
    display2 (.A(ss6[3]), .B(ss5[3]), .d(d3));
    
endmodule