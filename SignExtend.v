`timescale 1ns/1ns

module SignExtend(
input [15:0] entradaa,
output reg [31:0] salidaa
);

always @*
begin
	if(entradaa[15]) 
		salidaa={16'b1,entradaa};
	else
		salidaa={16'b0,entradaa};
end

endmodule

