module udc(value, u , d, c);
input [8:0] value; 

output [3:0] u; 
output [3:0] d; 
output [3:0] c; 

assign u = value % 10;
assign d = (value / 10) % 10;
assign c = (value / 100) % 10;

endmodule