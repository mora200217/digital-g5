module alarma_descarga (
    input [3:0] A,
    input [3:0] B,
    output Sa,
    output Sb
);

assign Sa =~A; 
assign Sb =~B; 
    
endmodule