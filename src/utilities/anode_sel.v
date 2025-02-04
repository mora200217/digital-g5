module anode_sel(selector, anode_bus);
    input [1:0] selector; 
    output [3:0] anode_bus; 

    assign anode_bus = 2 ** selector; 

endmodule