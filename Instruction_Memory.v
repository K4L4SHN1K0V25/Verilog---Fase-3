`timescale 1ns/1ns

module InstructionMemory (
	input [31:0] InsAdress,
	output reg [31:0] Instruction
);

reg [7:0] Memin [0:255];

initial
begin
	$readmemb("TestF3_MemInst.mem", Memin);
end

always @*
begin
	Instruction = {Memin[InsAdress], Memin[InsAdress+1], Memin[InsAdress+2], Memin[InsAdress+3]};
end

endmodule
