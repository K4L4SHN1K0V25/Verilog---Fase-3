`timescale 1ns/1ns

module Mux(
	input condition,
	input [31:0] Mux_in0,
	input [31:0] Mux_in1,
	output reg [31:0] Mux_out
);

always @*
begin
	if (condition)
		Mux_out = Mux_in1;
	else
		Mux_out = Mux_in0;
end

endmodule



