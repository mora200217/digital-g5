`timescale 10ps/10ps

`include "src/battery_bench.v"

module testbench();
// Registros de las bateris 4-bits (0 - 15)
reg [3:0] battA; 
reg [3:0] battB; 

wire is_emptyA; 
wire is_emptyB; 
wire full_state; 

battery_bench uut(battA, battB, is_emptyA, is_emptyB, full_state); 

initial begin
    battA = 4'b0111; battB = 4'b0111; 
    #10; 
    battA = 4'b0011; battB = 4'b0000; 
    #10; 
    battA = 4'b0000; battB = 4'b0011; 
    #10; 
    battA = 4'b0000; battB = 4'b0000; 
    #10; 
    battA = 4'b1100; battB = 4'b0111; 
    $finish; 
end 

initial begin:TEST_CASE
    $dumpfile("full_system.vcd"); 
    $dumpvars(0, uut); 
end 
    
endmodule