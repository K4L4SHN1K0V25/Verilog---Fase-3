`timescale 1ns/1ns

module PC (
	input clk,
	input [31:0] entrada, 
	output reg [31:0] salida
);

assign salida = 32'd0;

always @(posedge clk)
begin
	if (entrada >= 32'd0) 
    begin
		salida = entrada;
	end
	else 
    begin
		salida = 32'd0;
	end
end

endmodule
