`timescale 10ps/10ps

`include "src/adder/bit5_adder.v"
`include "src/empty_alarm/empty_charge_indicator.v"

module testbench();
// Registros de las bateris 4-bits (0 - 15)
reg [3:0] battA; 
reg [3:0] battB; 

wire [4:0] total_battery; 

wire is_emptyA; 
wire is_emptyB; 

// Intrancias los modulos 
bit5_adder adder_uut(battA, battB, total_battery); 


empty_charge_indicator indicator_A(battA, is_emptyA); 
empty_charge_indicator indicator_B(battB, is_emptyB); 

initial begin
    battA = 4'b0111; battB = 4'b0111; 
    #10; 
    battA = 4'b0011; battB = 4'b0000; 
    #10; 
    battA = 4'b0000; battB = 4'b0011; 
    #10; 
    battA = 4'b0000; battB = 4'b0000; 
    $finish; 
end 

initial begin:TEST_CASE
    $dumpfile("full_system.vcd"); 
    $dumpvars(0, adder_uut, indicator_A, indicator_B); 
end 
    
endmodule