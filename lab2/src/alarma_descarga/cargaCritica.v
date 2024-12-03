module cargaCritica (
  input [3:0]A,
  output Y
);
  assign Y = ~((~ X[3] & ~ X[2] & ~ X[1]) | (~ X[3] & ~ X[2] & ~ X[0]));
endmodule