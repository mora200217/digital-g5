`timescale 1ps/1ps
`include "src/adder/bit1_adder.v"

module testbench();

    reg A;
    reg B;
    reg Ci;

    wire Co;
    wire So;

    bit1_adder uut (
        .A(A),
        .B(B),
        .Ci(Ci),
        .Co(Co),
        .So(So)
    );


    initial begin
        A = 1'b0;
        B = 1'b0;
        Ci = 1'b0;
        #10;
        Ci = 1'b1;
        #10;
        B = 1'b1;
        Ci = 1'b0;
        #10;
        Ci = 1'b1;
        #10
        A = 1'b1;
        B = 1'b0;
        Ci = 1'b0;
        #10
        Ci = 1'b1;
        #10;
        B = 1'b1;
        Ci = 1'b0;
        #10;
        Ci = 1'b1;
    end

    initial begin: TEST_CASE
        $dumpfile("bit1_testbench.vcd");
        $dumpvars(-1, uut);
        #80 $finish; 
    end

endmodule