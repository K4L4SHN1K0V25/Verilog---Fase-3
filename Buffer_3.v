`timescale 1ns/1ns
module Buffer_3 (
    input  clk,
    input [31:0]Mux_Arriba,
    input Jump,
    input [31:0]Shift_left2,
    input [31:0]ADD_4,
    input [31:0]ADD_ALU,
    input AND,
    input MemRead,
    input MemtoReg,
    input MemWrite,
    input [31:0]ALU,
    input [31:0]Register,
    input [31:0]Mux_Abajo,


    output [31:0]PC,
    output MuxArriba,
    output [31:0]Muxarriba,
    output [31:0]Mux_Mux,
    output [31:0]mux_mux,
    output MuxMux,
    output DataMemory,
    output MuxAbajo,
    output Data_Memory,
    output Memory_Address,
    output Memory_Write,
    output [31:0]WriteData
   
);


assign PC= (clk) ? Mux_Arriba : PC;
assign MuxArriba= (clk) ? Jump : MuxArriba;
assign Muxarriba= (clk) ? Shift_left2 : Muxarriba;
assign Mux_Mux= (clk) ? ADD_4 : Mux_Mux;
assign mux_mux= (clk) ? ADD_ALU : mux_mux;
assign MuxMux= (clk) ? AND : MuxMux;
assign DataMemory= (clk) ? MemRead : DataMemory;
assign MuxAbajo= (clk) ? MemtoReg : MuxAbajo;
assign Data_Memory= (clk) ? MemWrite : Data_Memory;
assign Memory_Address= (clk) ? ALU : Memory_Address;
assign Memory_Write= (clk) ? Register : Memory_Write;
assign WriteData= (clk) ? Mux_Abajo : WriteData;

    
endmodule
