module div_freq #(parameter N = 2)(clk, clk_d);
// Divisor de frecuencia. Frecuencia inicial a frecuencia final 
    input clk; 
    output clk_d; 

    reg [3:0] count; 
    reg clk_d_reg; 

    initial begin:CI
        count = 0; 
        clk_d_reg = 0; 
    end

    always @(posedge clk ) begin
        
        if(count % N == 0) begin 
            clk_d_reg = (clk_d_reg + 1) % 2; 
        end
        count = count + 1 ; 
    end

    assign clk_d = clk_d_reg; 
    
endmodule

