module bit1_adder(A,B,Ci, Co, So);
  input A;
  input B;
  input Ci;
  output Co;
  output So;

  wire x_ab;
  wire cout_t;
  wire a_ab;

  xor(x_ab,A,B);
  xor(So,x_ab,Ci);
  and(cout_t,x_ab,Ci);
  and(a_ab,A,B);
  or(Co,cout_t,a_ab);

  
endmodule
