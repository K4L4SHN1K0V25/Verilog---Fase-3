`timescale 1ns/1ns

module Registers (
	input RegWrite,
	input [4:0] ReadReg1,
	input [4:0] ReadReg2,
	input [4:0] WriteReg,
	input [31:0] WriteData,
	output reg [31:0] ReadData1,
	output reg [31:0] ReadData2
);

reg [31:0] RegBank [0:31];

initial
begin
	$readmemb("TestF1_BReg.mem", RegBank);
end

always @*
begin
	if (RegWrite)
	begin
		RegBank[WriteReg] = WriteData;
	end
	ReadData1 = RegBank[ReadReg1];
	ReadData2 = RegBank[ReadReg2];
end

endmodule
