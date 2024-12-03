`timescale 1ps/1ps
`include "/Users/amoralesma/Desktop/Digital-G5/lab2/identificador_descarga.v"

module testbench();

    reg battery_tb;

    wire led_tb;

    identificador_descarga uut (
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
    end

    initial begin: TEST_CASE
        $dumpfile("testbench.vcd");
        $dumpvars(-1, uut);
        #40 $finish; 
    end

endmodule