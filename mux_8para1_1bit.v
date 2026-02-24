module mux_8para1_1bit(
   input I0, I1, I2, I3, I4, I5, I6, I7,
   input [2:0] SEL,
   output OUT);
     
   wire nS0, nS1, nS2;
   wire t0, t1, t2, t3, t4, t5, t6, t7;
     
   not(nS0, SEL[0]);
   not(nS1, SEL[1]);
   not(nS2, SEL[2]);
     
   and(t0, I0, nS2, nS1, nS0);
   and(t1, I1, nS2, nS1, SEL[0]);
   and(t2, I2, nS2, SEL[1], nS0);
   and(t3, I3, nS2, SEL[1], SEL[0]);
   and(t4, I4, SEL[2], nS1, nS0);
   and(t5, I5, SEL[2], nS1, SEL[0]);
   and(t6, I6, SEL[2], SEL[1], nS0);
   and(t7, I7, SEL[2], SEL[1], SEL[0]);
     
   or(OUT, t0, t1, t2, t3, t4, t5, t6, t7);
     
endmodule