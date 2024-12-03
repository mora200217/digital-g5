`timescale 1ps/1ps
`include "src/empty_alarm/empty_charge_indicator.v"

module testbench();

    reg battery_tb;

    wire led_tb;

    empty_charge_indicator uut (
        .X(battery_tb),
        .Y(led_tb)
    );


    initial begin
        battery_tb = 4'b0001;
        #10;
        battery_tb = 4'b0000;
        #10;
        battery_tb = 4'b1011;
        #10;
        battery_tb = 4'b1111;
        #10;
    end

    initial begin: TEST_CASE
        $dumpfile("testbench.vcd");
        $dumpvars(-1, uut);
        #60 $finish; 
    end

endmodule