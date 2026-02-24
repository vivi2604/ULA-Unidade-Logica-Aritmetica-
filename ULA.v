module ULA(
   input [3:0] A,
   input [3:0] B,
   input Cin,
   input [2:0] SEL,

   output OV,
   output Cout,
   output ERRO,
   output Zero,
	output [6:0] dis1,
	output [6:0] dis2,
	output [6:0] dis3,
	output [6:0] dis4);
    
	wire [7:0] S;
   wire [4:0] a_mod;

   wire [3:0] s_addsub;
   wire ov_addsub, cout_addsub, erro_addsub;
     
   wire [7:0] s_mult;
     
   wire [4:0] s_div;
   wire erro_div;
     
   wire [3:0] s_and, s_or, s_xor;

   wire [7:0] s_bruto;    
   wire habilita_saida, zero_bruto;

   soma_A_Cin (.A_in(A), .Cin(Cin), .A_out(a_mod));

   ss4b(.A(a_mod), .B(B), .Op(SEL[0]), .S(s_addsub), .OV(ov_addsub), .Cout(cout_addsub), .ERRO(erro_addsub));

   multiplicador (.A(a_mod), .B(B), .S(s_mult));

   Divisor2 (.A(a_mod), .B(B), .S(s_div), .Erro(erro_div));

   logic_And (.A(a_mod), .B(B), .S(s_and));
   logic_Or (.A(a_mod), .B(B), .S(s_or));
   logic_Xor (.A(a_mod), .B(B), .S(s_xor));

   mux_8para1_1bit  (.I0(s_addsub[0]), .I1(s_addsub[0]), .I2(s_mult[0]), .I3(s_div[0]), .I4(s_and[0]), .I5(s_or[0]), .I6(s_xor[0]), .I7(1'b0), .SEL(SEL), .OUT(s_bruto[0]));
   mux_8para1_1bit  (.I0(s_addsub[1]), .I1(s_addsub[1]), .I2(s_mult[1]), .I3(s_div[1]), .I4(s_and[1]), .I5(s_or[1]), .I6(s_xor[1]), .I7(1'b0), .SEL(SEL), .OUT(s_bruto[1]));
   mux_8para1_1bit  (.I0(s_addsub[2]), .I1(s_addsub[2]), .I2(s_mult[2]), .I3(s_div[2]), .I4(s_and[2]), .I5(s_or[2]), .I6(s_xor[2]), .I7(1'b0), .SEL(SEL), .OUT(s_bruto[2]));
   mux_8para1_1bit  (.I0(s_addsub[3]), .I1(s_addsub[3]), .I2(s_mult[3]), .I3(s_div[3]), .I4(s_and[3]), .I5(s_or[3]), .I6(s_xor[3]), .I7(1'b0), .SEL(SEL), .OUT(s_bruto[3]));
    
   mux_8para1_1bit  (.I0(cout_addsub), .I1(cout_addsub), .I2(s_mult[4]), .I3(s_div[4]), .I4(1'b0), .I5(1'b0), .I6(1'b0), .I7(1'b0), .SEL(SEL), .OUT(s_bruto[4]));
   mux_8para1_1bit  (.I0(1'b0), .I1(1'b0), .I2(s_mult[5]), .I3(1'b0), .I4(1'b0), .I5(1'b0), .I6(1'b0), .I7(1'b0), .SEL(SEL), .OUT(s_bruto[5]));
   mux_8para1_1bit  (.I0(1'b0), .I1(1'b0), .I2(s_mult[6]), .I3(1'b0), .I4(1'b0), .I5(1'b0), .I6(1'b0), .I7(1'b0), .SEL(SEL), .OUT(s_bruto[6]));
   mux_8para1_1bit  (.I0(1'b0), .I1(1'b0), .I2(s_mult[7]), .I3(1'b0), .I4(1'b0), .I5(1'b0), .I6(1'b0), .I7(1'b0), .SEL(SEL), .OUT(s_bruto[7]));

    
   wire notSel2, notSel1, notSel0, erro_ss4b, erro_div2, erro_selet;
    
   not(notSel2, SEL[2]);
   not(notSel1, SEL[1]);
	not(notSel0, SEL[0]);
    
	and(erro_ss4b, notSel2, notSel1, erro_addsub);
	and(erro_div2, notSel2, SEL[1], SEL[0], erro_div);
	and(erro_selet, SEL[2], SEL[1], SEL[0]);
    
	or(ERRO, erro_div2, erro_ss4b, erro_selet);
    
   not(habilita_saida, ERRO);

   and(S[0], s_bruto[0], habilita_saida);
   and(S[1], s_bruto[1], habilita_saida);
   and(S[2], s_bruto[2], habilita_saida);
   and(S[3], s_bruto[3], habilita_saida);
   and(S[4], s_bruto[4], habilita_saida);
   and(S[5], s_bruto[5], habilita_saida);
   and(S[6], s_bruto[6], habilita_saida);
   and(S[7], s_bruto[7], habilita_saida);

   and(OV, notSel2, notSel1, habilita_saida, ov_addsub);
   and(Cout, notSel2, notSel1, habilita_saida, cout_addsub);
    
   nor(zero_bruto, S[0], S[1], S[2], S[3], S[4], S[5], S[6], S[7]);
   and(Zero, zero_bruto, habilita_saida);
    
   decodificador (.S(S), .d1(dis1), .d2(dis2), .d3(dis3));
	display_op(.A(SEL[0]), .B(SEL[1]), .C(SEL[2]), .d(dis4));

endmodule

