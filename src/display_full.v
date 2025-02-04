`timescale 1ps/1ps

`include "src/utilities/udc.v"
`include "src/utilities/div_freq.v"
`include "src/adder/nbit_adder.v"

module display_full(clk);
input clk; 

wire clk_d; 

div_freq uut_div_freq(clk; ); 
endmodule