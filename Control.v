`timescale 1ns/1ns

module Control (
	input [5:0] OpCode,		//000000
	output reg RegDst,
    output reg Jump,		//1
	output reg Branch, 		//0
	output reg MemRead,		//0
	output reg MemWrite,		//1
	output reg MemToReg,		//1
	output reg [2:0] ALUOp,		//111
	output reg ALUSrc,		//0
	output reg RegWrite		//1
);

always @*
begin
	case (OpCode)
		6'b000000:
			begin
			RegDst = 1;
            Jump=0;
			Branch = 0;
			MemToReg = 0;
			ALUOp = 111;
			ALUSrc = 0;
			RegWrite = 1;
			MemWrite = 1;
			MemRead = 0;
			end
		6'b001000: //Addi
        	begin
        	RegDst = 0;
            Jump=0;
			Branch = 0;
			MemToReg = 0;
			ALUOp = 3'b101;
			ALUSrc = 1;
			RegWrite = 1;
			MemWrite = 0;
			MemRead = 0; 
        	end
        	6'b001010: //slti
        	begin
            RegDst = 0;
            Jump=0;
			Branch = 0;
			MemToReg = 0;
			ALUOp = 3'b100;
			ALUSrc = 1;
			RegWrite = 1;
			MemWrite = 0;
			MemRead = 0;
        	end
        	6'b001100://andi
        	begin
            RegDst = 0;
            Jump=0;
			Branch = 0;
			MemToReg = 0;
			ALUOp = 3'b011;
			ALUSrc = 1;
			RegWrite = 1;
			MemWrite = 0;
			MemRead = 0;
        	end
        	6'b001101: //ori
        	begin
            RegDst = 0;
            Jump=0;
			Branch = 0;
			MemToReg = 0;
			ALUOp = 3'b010;
			ALUSrc = 1;
			RegWrite = 1;
			MemWrite = 0;
			MemRead = 0;
        	end
        	6'b101011://sw
            begin
            RegDst = 1'dx;
            Jump=0;
			Branch = 0;
			MemToReg = 1'dx;
			ALUOp = 3'b001;
			ALUSrc = 1;
			RegWrite = 0;
			MemWrite = 1;
			MemRead = 0;
        	end
        	6'b100011://lw
        	begin
            RegDst = 0;
            Jump=0;
			Branch = 0;
			MemToReg = 1;
			ALUOp = 3'b001;
			ALUSrc = 1;
			RegWrite = 1;
			MemWrite = 0;
			MemRead = 1;
        	end
        	6'b000100://beq
        	begin
            RegDst = 1'dx;
            Jump=0;
			Branch = 1;
			MemToReg = 1'dx;
			ALUOp = 3'b000;
			ALUSrc = 0;
			RegWrite = 0;
			MemWrite = 0;
			MemRead = 1;
        	end
        	6'b000010://Jump
        	begin
            RegDst = 1'd0;
            Jump=1'd1;
			Branch = 1'd0;
			MemToReg = 1'd0;
			ALUOp = 3'dx;
			ALUSrc = 1'd0;
			RegWrite = 1'd0;
			MemWrite = 1'd0;
			MemRead = 1'd0;
        	end
	endcase
end

endmodule
