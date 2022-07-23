`timescale 1ns/1ns

module Add (
	input [31:0] PC_in,
	output [31:0] Result
);

assign Result = PC_in + 32'd4;

endmodule