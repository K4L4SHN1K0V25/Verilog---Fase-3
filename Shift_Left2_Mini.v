`timescale 1ns/1ns

module ShiftLeft_Mini(
input [25:0] entrada,
output reg [27:0] salida
);

assign salida=entrada<<2;

endmodule

