`timescale 1ns/1ns

module ALU_control (
	input [5:0] FunctCode,
	input [2:0] ALUOpIn,
	output reg [2:0] signal
);

always @*
begin
	case (ALUOpIn)
		3'b111:
		case (FunctCode)
			6'b100000: signal = 3'b000;
			6'b100010: signal = 3'b001;
			6'b100100: signal = 3'b010;
			6'b100101: signal = 3'b011;
			6'b101010: signal = 3'b100;
			6'b000000: signal = 3'b101;
			default: signal = 3'b101;
		endcase
		    3'b101: signal = 3'b000;//addi
            3'b100: signal = 3'b101;//slti
            3'b011: signal = 3'b100;//andi
            3'b010: signal = 3'b011;//ori
            3'b001: signal = 3'b000;//lw y sw
            3'b000: signal = 3'b010;//beq
	endcase
end

endmodule

