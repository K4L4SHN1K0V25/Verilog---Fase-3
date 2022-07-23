 `timescale 1ns/1ns

module DataPath (
	input clock
);

//Cables PC
wire [31:0] Buffer1_PC, PC_Out; 
//Cables Add
wire  [31:0] PC_Add, Add_Buffer1;
//Cables Instruction Memory
wire [31:0] PC_InsMemory, InsMemory_Buffer1;
//Cables Buffer 1
wire  [31:0]  Buffer1_Buffer2, Buffer1_AddALU, Buffer1_Register;
//Cable ShiftLeft 2 Mini 
wire [31:0] ShiftLeft_Mini_Buffer2;
//Cables Control
wire RegDst_Mux, Jump_Buffer2, Branch_Buffer2, MemRead_Buffer2, MemWrite_Buffer2, MemToReg_Buffer2, ALUSrc_Buffer2;
wire [2:0] ALUOp_Buffer2;
//Cables Registers
wire RegWrite_Registers;
wire [4:0] Mux_Registers;
wire [31:0] Buffer2_WriteData, ReadData1_Buffer2, ReadData2_Buffer2;
//Cables SignExtend
wire [31:0] SignExtend_Buffer2;
//Cables Buffer 2
wire [31:0] Buffer2_Buffer3, Jump_Buffer3, ShiftLeft_Mini_Buffer3,Buffer2_AddALU;
wire [31:0] Buffer2_AND, MemRead_Buffer3, MemToReg_Buffer3,Buffer2_ALUControl;
wire [31:0] MemWrite_Buffer3, ALUSrc_MuxALU, Buffer2_ALU, Buffer2_MuxALU, Instruction_ALUControl, Buffer2_Shiftleft, Buffer3_Buffer2;
//Cables AddSl
wire [31:0] ShiftLeft_AddSL, AddSL_Buffer3;
//Cable AND
wire ZeroFlag_AND, AND_Buffer3;
//Cables ALU
wire [2:0] ALUControl_ALU;
wire [31:0] ALU_Buffer3,Mux_ALU;
//Cables Buffer 3
wire [31:0 ] Buffer4_Buffer3, ShiftLeft_Mini_Buffer4, Add4__Mux, ADDALU_Mux,  ALU_AddressMemory,Buffer2_WriteDataMemory,Buffer4_WriteData;
wire Jump_Buffer4, AND_Mux, MemRead_DataMemory, MemToReg_Buffer4, MemWrite_DataMemory;
//Cables Mux de buffer 3/4
wire [31:0] Mux_Buffer4;
//Cables Buffer 4
wire [31:0] Mux_PC, Shiftleft_Mux, Mux_Mux, DataMemory_Mux, ALU_Mux, Mux_WriteData;
wire Jump_Mux, MemToReg_Mux;


PC inst0 (
	.clk(clock),
	.entrada(Buffer1_PC),
	.salida(PC_out)
);

Add inst1 (
	.PC_in(PC_Add),
	.Result(Add_Buffer1)
);

InstructionMemory inst2 (
	.InsAdress(PC_InsMemory),
	.Instruction(InsMemory_Buffer1)
);

Buffer_1 inst3(
	.clk(clock),
	.Mux(Buffer1_PC),
	.ADD_4(ADD_4_Buffer_1),
	.Instruction_Memory(InsMemory_Buffer1),
	.PC(Buffer1_Buffer2),
	.ADD_ALU(Buffer1_AddALU),
	.Register(Buffer1_Register)
);

ShiftLeft_Mini inst4(
	.entrada(Buffer1_Register[25:0]),
	.salida(ShiftLeft_Mini_Buffer2)
);

Control inst5(
	.OpCode(Buffer1_Register[31:26]),
	.RegDst(RegDst_Mux),
	.Jump(Jump_Buffer2),
	.Branch(Branch_Buffer2),
	.MemRead(MemRead_Buffer2),
	.MemWrite(MemWrite_Buffer2),
	.MemToReg(MemToReg_Buffer2),
	.ALUOp(ALUOp_Buffer2),
	.ALUSrc(ALUSrc_Buffer2),
	.RegWrite(RegWrite_Registers)
);

Registers inst6(
	.RegWrite(RegWrite_Registers),
	.ReadReg1(Buffer1_Register[25:21]),
	.ReadReg2(Buffer1_Register[20:16]),
	.WriteReg(Mux_Registers),
	.WriteData(Buffer2_WriteData),
	.ReadData1(ReadData1_Buffer2),
	.ReadData2(ReadData2_Buffer2)
);

MuxMini	inst7(
	.condition(RegDst_Mux),
	.Mux_in0(Buffer1_Register[20:16]),
	.Mux_in1(Buffer1_Register[15:11]),
	.Mux_out(Mux_Registers)
);

SignExtend inst8(
	.entradaa(Buffer1_Register[15:0]),
	.salidaa(SignExtend_Buffer2)
);

Buffer_2 inst9(
	.clk(clock),
	.Mux_Arriba(Buffer1_Buffer2),
	.Jump(Jump_Buffer2),
	.Shft_Left2(ShiftLeft_Mini_Buffer2),
	.ADD_4(Buffer1_AddALU),
	.Branch(Branch_Buffer2),
	.MemRead(MemRead_Buffer2),
	.MemtoReg(MemToReg_Buffer2),
	.ALUOp(ALUOp_Buffer2),
	.MemWrite(MemWrite_Buffer2),
	.ALUSrc(ALUSrc_Buffer2),
	.Read_Data1(ReadData1_Buffer2),
	.Read_Data2(ReadData2_Buffer2),
	.Instruction_Memory(Buffer1_Register[5:0]),
	.SignExtend(SignExtend_Buffer2),
	.Mux_Abajo(Buffer2_WriteData),
	.PC(Buffer2_Buffer3),
	.MuxArriba(Jump_Buffer3),
	.Muxarriba(ShiftLeft_Mini_Buffer3),
	.ADD_ALU(Buffer2_AddALU),
	.AND(Buffer2_AND),
	.DataMemory(MemRead_Buffer3),
	.MuxAbajo(MemToReg_Buffer3),
	.ALU_Control(Buffer2_ALUControl),
	.Data_Memory(MemWrite_Buffer3),
	.Mux_ALU(ALUSrc_MuxALU),
	.ALU(Buffer2_ALU),
	.ALU_Mux(Buffer2_MuxALU),
	.ALUControl(Instruction_ALUControl),
	.Shift_left2(Buffer2_Shiftleft),
	.WriteData(Buffer3_Buffer2)

);

AddSL inst10(
	.Add(Buffer2_AddALU),
	.Shiftleft(ShiftLeft_AddSL),
	.Result(AddSL_Buffer3)
);

ShiftLeft inst11(
	.entrada(Buffer2_Shiftleft),
	.salida(ShiftLeft_AddSL)
);

AND inst12(
	.Branch(Buffer2_AND),
	.ZeroFlag(ZeroFlag_AND),
	.Mux(AND_Buffer3)
);

ALU inst13(
	.i_op1(Buffer2_ALU),
	.i_op2(Mux_ALU),
	.Sel(ALUControl_ALU),
	.ALUresult(ALU_Buffer3),
	.Zero(ZeroFlag_AND)
);

Mux inst14(
	.condition(ALUSrc_MuxALU),
	.Mux_in0(Buffer2_MuxALU),
	.Mux_in1(Buffer2_Shiftleft),
	.Mux_out(Mux_ALU)
);

ALU_control inst15(
	.FunctCode(Instruction_ALUControl),
	.ALUOpIn(Buffer2_ALUControl),
	.signal(ALUControl_ALU)
);

Buffer_3 inst16(
	.clk(clock),
	.Mux_Arriba(Buffer1_Buffer2),
	.Jump(Jump_Buffer3),
	.Shift_left2(ShiftLeft_Mini_Buffer2),
	.ADD_4(Buffer2_AddALU),
	.ADD_ALU(AddSL_Buffer3),
	.AND(AND_Buffer3),
	.MemRead(MemRead_Buffer3),
	.MemtoReg(MemToReg_Buffer3),
	.MemWrite(MemWrite_Buffer3),
	.ALU(ALU_Buffer3),
	.Register(Buffer2_MuxALU),
	.Mux_Abajo(Buffer3_Buffer2),
	.PC(Buffer4_Buffer3),
	.MuxArriba(Jump_Buffer4),
	.Muxarriba(ShiftLeft_Mini_Buffer4),
	.Mux_Mux(Add4__Mux),
	.mux_mux(ADDALU_Mux),
	.MuxMux(AND_Mux),
	.DataMemory(MemRead_DataMemory),
	.MuxAbajo(MemToReg_Buffer4),
	.Data_Memory(MemWrite_DataMemory),
	.Memory_Address(ALU_AddressMemory),
	.Memory_Write(Buffer2_WriteDataMemory),
	.WriteData(Buffer4_WriteData)
);

Mux inst17(
	.condition(AND_Mux),
	.Mux_in0(Add4__Mux),
	.Mux_in1(ADDALU_Mux),
	.Mux_out(Mux_Buffer4)
);

Mem inst18(
	.MemWrite(MemWrite_DataMemory),
	.MemRead(MemRead_DataMemory),
	.Din(Buffer2_WriteDataMemory),
	.Dir(ALU_AddressMemory),
	.Dout(DataMemory_Buffer4)
);

Buffer_4 inst19(
	.clk(clock),
	.Mux_Arriba(Buffer4_Buffer3),
	.Jump(Jump_Buffer4),
	.Shift_left2(ShiftLeft_Mini_Buffer4),
	.Mux_Mux(Mux_Buffer4),
	.MemtoReg(MemToReg_Buffer4),
	.Read_Memory(DataMemory_Buffer4),
	.ALU(ALU_AddressMemory),
	.muxabajo(Buffer4_WriteData),
	.PC(Mux_PC),
	.MuxArriba(Jump_Mux),
	.Muxarriba(Shiftleft_Mux),
	.muxarriba(Mux_Mux),
	.MuxAbajo(MemToReg_Mux),
	.Mux_Abajo(DataMemory_Mux),
	.Muxabajo(ALU_Mux),
	.WriteData(Mux_WriteData)
);

Mux inst20(
	.condition(Jump_Mux),
	.Mux_in0(Mux_Mux),
	.Mux_in1(Shiftleft_Mux),
	.Mux_out(Mux_PC)
);

Mux inst21(
	.condition(MemToReg_Mux),
	.Mux_in0(ALU_Mux),
	.Mux_in1(DataMemory_Mux),
	.Mux_out(Mux_WriteData)
);
endmodule

