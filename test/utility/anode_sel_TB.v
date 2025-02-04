`timescale 1ps/1ps
`include "src/utilities/anode_sel.v"

module anode_sel_TB();

reg [1:0] sel;
wire [3:0]anode; 

anode_sel uut(sel, anode); 

initial begin
   sel = 2'b00; 
   #10
   sel = 2'b01; 
   #10
   sel = 2'b11; 
   #10
   sel = 2'b10; 
   #10
    $finish; 
end 

initial begin:TEST
    $dumpfile("anode_sel_sim.vcd"); 
    $dumpvars(-1, uut); 
    
end 

endmodule