`include "./src/sumador/sumador1bPrimitiva.v"

module sumador5b (x,y,S);

    input [3:0]x; 
    input [3:0]y;  
    output [4:0]S;
    
    wire s1,s2,s3,s4;

    sumador1bPrimitiva b1(.A(x[0]), .B(y[0]),.Ci(0),.Co(s1),.So(S[0]));
    sumador1bPrimitiva b2(.A(x[1]), .B(y[1]),.Ci(s1),.Co(s2),.So(S[1]));
    sumador1bPrimitiva b3(.A(x[2]), .B(y[2]),.Ci(s2),.Co(s3),.So(S[2]));
    sumador1bPrimitiva b4(.A(x[3]), .B(y[3]),.Ci(s3),.Co(s4),.So(S[3]));

    
endmodule