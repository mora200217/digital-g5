
`include "src/adder/bit5_adder.v"
`include "src/empty_alarm/empty_charge_indicator.v"

module battery_bench (
    input battA, 
    input battB, 
    output is_emptyA, 
    output is_emptyB, 
    output full_state
);

wire [4:0] total_battery; 

// Intrancias los modulos 
bit5_adder adder_uut(battA, battB, total_battery); 

empty_charge_indicator indicator_A(battA, is_emptyA); 
empty_charge_indicator indicator_B(battB, is_emptyB); 
    
endmodule