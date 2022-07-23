`timescale 1ns/1ns
module Buffer_2 (
    input  clk,
    input [31:0]Mux_Arriba,
    input Jump,
    input [31:0]Shft_Left2,
    input [31:0]ADD_4,
    input Branch,
    input MemRead,
    input MemtoReg,
    input ALUOp,
    input MemWrite,
    input ALUSrc,
    input [31:0]Read_Data1,
    input [31:0]Read_Data2,
    input [5:0]Instruction_Memory,
    input [31:0]SignExtend,
    input [31:0]Mux_Abajo,

    output [31:0]PC,
    output MuxArriba, 
    output [31:0]Muxarriba,
    output [31:0]ADD_ALU,
    output AND,
    output DataMemory,
    output MuxAbajo,
    output ALU_Control,
    output Data_Memory,
    output Mux_ALU,   
    output [31:0]ALU,
    output [31:0]ALU_Mux,
    output [5:0]ALUControl,
    output [31:0]Shift_left2,
    output [31:0]WriteData

);

assign Muxarriba ={ADD_4[31:28],Shft_Left2};

assign PC= (clk) ? Mux_Arriba : PC;
assign MuxArriba= (clk) ? Jump : MuxArriba;
assign Muxarriba=(clk) ? Shift_left2 : Muxarriba;
assign ADD_ALU= (clk) ? ADD_4 : ADD_ALU;
assign AND= (clk) ? Branch : AND;
assign DataMemory= (clk) ? MemRead : DataMemory;
assign MuxAbajo= (clk) ? MemtoReg : MuxAbajo;
assign ALU_Control= (clk) ? ALUOp : ALU_Control;
assign Data_Memory= (clk) ? MemWrite : Data_Memory;
assign Mux_ALU= (clk) ? ALUSrc : Mux_ALU;
assign ALU= (clk) ? Read_Data1 : ALU;
assign ALU_Mux= (clk) ? Read_Data2 : ALU_Mux;
assign ALUControl= (clk) ? Instruction_Memory : ALUControl;
assign Shift_left2= (clk) ? SignExtend : Shift_left2;
assign WriteData= (clk) ? Mux_Abajo : WriteData;


    
endmodule
