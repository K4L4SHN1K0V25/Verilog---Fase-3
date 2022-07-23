`timescale 1ns/1ns

module MuxMini (
	input condition,
	input [4:0] Mux_in0,
	input [4:0] Mux_in1,
	output reg [4:0] Mux_out
);

always @*
begin
	if (condition)
		Mux_out = Mux_in1;
	else
		Mux_out = Mux_in0;
end

endmodule

