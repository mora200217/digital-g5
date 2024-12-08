`timescale 10ps/10ps

`include "src/adder/bit5_adder.v"
`include "src/empty_alarm/empty_charge_indicator.v"

module testbench();
reg [3:0] battA, battB; // Registros de las bateris 4-bits (0 - 15)

wire [4:0] total_battery; // Suma de la batería total 
wire is_emptyA, is_emptyB; // Validacion de descarga completa 

// Instancias los modulos 
bit5_adder adder_uut(battA, battB, total_battery); 

// Indicadores de descara por cada una de las baterías 
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