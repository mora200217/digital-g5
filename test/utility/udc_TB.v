`timescale 1ps/1ps
`include "src/utilities/udc.v"

module udc_TB();

reg [8:0] value;

wire [3:0] u; 
wire [3:0] d; 
wire [3:0] c; 

udc uut(value, u, d, c); 

initial begin
    value = 23; 
    #10 
    value = 123; 
    #10 
    value = 234; 
    #10 
    value = 151; 
    #10 
    value = 2; 
    #10 
    value = 232; 
    #10
    $finish; 
end 

initial begin:TEST
    $dumpfile("udc_sim.vcd"); 
    $dumpvars(-1, uut); 
    
end 

endmodule