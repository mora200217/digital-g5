`timescale 1ps/1ps
`include "src/adder/bit5_adder.v"

module testbench();
    reg [3:0] x; 
    reg [3:0] y; 

    wire [4:0] z; 

    bit5_adder uut (
        .x(x),
        .y(y),
        .S(z)
    );

    initial begin
        x = 2; y = 12; 
        #10; 
        x = 6; y = 2; 
        #10; 
        x = 1; y = 9; 
        #10; 
        x = 7; y = 7; 
        #10; 
        x = 15; y = 15; 
        #10; 
    end

    initial begin: TEST_CASE
        $dumpfile("bit5_adder_testbench.vcd");
        $dumpvars(-1, uut);
        #50 $finish; 
    end

endmodule