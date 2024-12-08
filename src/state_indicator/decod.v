// decod.v - One hot encoding 

module decod #(
    parameter N = 4
)(
    input [1:0] state, 
    output [N-1:0] pout
);  
    genvar i; 
    generate
         for (i = 0; i < N; i = i + 1) begin : gen_block
              assign pout[i] = (i == state) ? 1'b1 : 1'b0;
        end
    endgenerate    
endmodule