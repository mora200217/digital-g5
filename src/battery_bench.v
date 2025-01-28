
// `include "src/adder/bit5_adder.v"
// `include "src/adder/nbit_adder.v"
// `include "src/empty_alarm/empty_charge_indicator.v"
// `include "src/state_indicator/state_indicator.v"
// `include "src/state_indicator/decod.v"

module battery_bench (
    input [3:0] battA,  
    input [3:0] battB, 
    output is_emptyA, 
    output is_emptyB, 
    output [3:0] led_state_indicator, // 4 states 
	 output buzzer
);

wire [4:0] total_battery, total_battery_n; 
wire [1:0] full_state; // 2 bits 

wire is_emptyA_FPGA; 
wire is_emptyB_FPGA; 

wire led_state_indicator_FPGA; 

wire is_Ea, is_Eb; wire[3:0]led_state_indicator_B; 
// Intrancias los modulos 
// bit5_adder adder_uut(battA, battB, total_battery); 
nbit_adder nadder_uut(~battA, ~battB, total_battery_n);

empty_charge_indicator indicator_A(~battA, is_Ea); 
empty_charge_indicator indicator_B(~battB, is_Eb); 

state_indicator state(total_battery_n, full_state); 
decod state2leds(full_state, led_state_indicator_B); 

assign is_emptyA = ~(is_Ea); 
assign is_emptyB = ~(is_Eb); 

assign led_state_indicator = ~(led_state_indicator_B); 
    
 assign buzzer = led_state_indicator[0];
endmodule