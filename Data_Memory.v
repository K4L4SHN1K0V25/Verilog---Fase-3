`timescale 1ns/1ns 

module Mem (
	input MemWrite,
	input MemRead,
	input [31:0] Din,
	input [31:0] Dir,
	output reg [31:0] Dout
);

reg [31:0] memoria [0:127];

initial
begin
	memoria [0] = 32'd67;
	memoria [1] = 32'd101;
	memoria [2] = 32'd115;
	memoria [3] = 32'd97;
	memoria [4] = 32'd114;
	memoria [5] = 32'd32;
	memoria [6] = 32'd71;
	memoria [7] = 32'd111;
	memoria [8] = 32'd110;
	memoria [9] = 32'd122;
	memoria [10] = 32'd97;
	memoria [11] = 32'd108;
	memoria [12] = 32'd101;
	memoria [13] = 32'd122;
end

always @* 
begin
	if(MemWrite)
    	begin
        	memoria[Dir] = Din;
    	end
    	else if(MemRead)
    	begin
        	Dout = memoria[Dir];
    	end
    	else
    	begin
        	Dout = 32'dx;
	end
end

endmodule

