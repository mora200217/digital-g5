`timescale 1ps/1ps

`include "src/utilities/div_freq.v"

module testbench();
reg clk; 
wire clk_d; 

initial begin:CLK
    clk = 0; 
end

always #5 clk = ~clk;

div_freq uut_div_freq(clk, clck_d); 

initial begin    
    #100; 
    $finish; 
end 

initial begin:TEST_CASE
    $dumpfile("div_freq.vcd"); 
    $dumpvars(0, uut_div_freq); 
end 
    
endmodule