`timescale 1ps/1ps
`include "src/state_indicator/state_indicator.v"

module state_TB();

    reg [4:0] battery; 
    wire [1:0] state; 

    state_indicator uut(battery, state); 

    initial begin
        battery = 30; 
        #10; 
        battery = 26; 
        #10; 
        battery = 16; 
        #10; 
        battery = 10; 
        #10; 
        battery = 8; 
        #10; 
        battery = 5; 
        #10; 
        battery = 3; 
        #10; 
        battery = 0; 
        #10; 
        $finish; 
    end 

    initial begin
        $dumpfile("state_TB.vcd"); 
        $dumpvars(1, uut); 
    end

endmodule