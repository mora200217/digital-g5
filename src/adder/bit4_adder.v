`include "src/adder/bit1_adder.v"

// Sumador de 5 bits con instancias 
// 
module bit4_adder (x,y,S);

    input [3:0]x; 
    input [3:0]y;  
    output [4:0]S;
    
    wire s1,s2,s3,s4;

    bit1_adder b1(.A(x[0]), .B(y[0]),.Ci(1'b0),.Co(s1),.So(S[0]));
    bit1_adder b2(.A(x[1]), .B(y[1]),.Ci(s1),.Co(s2),.So(S[1]));
    bit1_adder b3(.A(x[2]), .B(y[2]),.Ci(s2),.Co(s3),.So(S[2]));
    bit1_adder b4(.A(x[3]), .B(y[3]),.Ci(s3),.Co(S[4]),.So(S[3]));

    
endmodule