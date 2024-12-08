`timescale 1ps/1ps
`include "src/state_indicator/decod.v"

module decod_TB();

    reg [1:0] state; 
    wire [3:0] led_indicator; 

    decod #(4) uut(state, led_indicator); 

    initial begin
        state = 3; #10; 
        state = 2; #10; 
        state = 1; #10; 
        state = 0; #10; 
        $finish; 
    end 

    initial begin
        $dumpfile("decod_TB.vcd"); 
        $dumpvars(1, uut); 
    end

endmodule