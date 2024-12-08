// state_indicator.v 

module state_indicator (
    input  [4:0] battery, // 5-bits para bateria completa a 30 como carga max 
    output [1:0] state
);

reg [1:0]state_reg; 

always @(*) begin
    // bateria Excelente  
    $display("Battery %b", battery); 
    if (battery > 20) begin
        state_reg = 2'b11; 
    end else if (battery > 15) begin
        state_reg = 2'b10;
    end else if (battery > 3) begin
        state_reg = 2'b01;
    end else  begin
        state_reg = 2'b00;
    end 
end

assign state = state_reg; 
    
endmodule