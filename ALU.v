`timescale 1ns/1ns

module ALU (
	input [31:0] i_op1,
	input [31:0] i_op2,
	input [2:0] Sel,
	output reg [31:0]  ALUresult,
	output reg Zero
);

always @*
begin
	case (Sel)
	3'b001: ALUresult = i_op1 - i_op2;
	3'b010: ALUresult = i_op1 & i_op2;
	3'b011: ALUresult = i_op1 | i_op2;
	3'b100: ALUresult = (i_op1 < i_op2) ? 31'd1 : 31'd0;
	3'b110: ALUresult = i_op1 * i_op2;
	3'b111: ALUresult = 0;
	endcase
	if(ALUresult == 0)
	begin
        	Zero = 1'd1;
        end
        else
        begin
        	Zero = 1'd0;
       	end
end

/*
ADD 	|	000000 00001 00010 10100 00000 100000	<-
SUB 	|	000000 00101 00100 10101 00000 100010
AND	|	000000 01000 00100 11000 00000 100100
OR	|	000000 01010 01010 11001 00000 100101
SLT	|	000000 00101 01010 11010 00000 101010	<-
NOP	|	000000 00000 00000 00000 00000 000000
*/

endmodule

