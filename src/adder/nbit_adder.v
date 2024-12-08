// nbit_adder.v - Sumador de n bits 
`include "src/adder/bit1_adder.v"

module nbit_adder #(
    parameter N = 4
) (
    input [N-1: 0] A, 
    input [N-1: 0] B, 
    output [N:0] S // Usa el Carry out (Co) como MSB 
);
    genvar i; 
    wire [N:0] carry; 
    assign carry[0] = 1'b0; 

    generate 
        for (i = 0; i < N; i = i + 1) begin
            bit1_adder adder_i(A[i], B[i], carry[i], carry[i + 1], S[i]);
        end 
    endgenerate

    assign S[N] = carry[N]; 

endmodule