module bit1_adder(A,B,Ci, Co, So);
  input A, B, Ci;
  output Co, So;

  wire x_ab, cout_t, a_ab;

// Implementacion con compuertas lógicas
  xor(x_ab,A,B);
  xor(So,x_ab,Ci);
  and(cout_t,x_ab,Ci);
  and(a_ab,A,B);
  or(Co,cout_t,a_ab);

endmodule
