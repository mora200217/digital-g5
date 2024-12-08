module cargaCritica (
  input [4:0]A,
  output Y
);
  assign Y = ~((~ \A[2]  & ~ \A[3]  & ~ \A[4] ););
endmodule