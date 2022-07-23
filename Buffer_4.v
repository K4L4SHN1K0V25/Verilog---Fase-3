`timescale 1ns/1ns
module Buffer_4 (
    input  clk,
    input [31:0]Mux_Arriba,
    input Jump,
    input [31:0]Shift_left2,
    input [31:0]Mux_Mux,
    input MemtoReg,
    input [31:0]Read_Memory,
    input [31:0]ALU,
    input [31:0]muxabajo,

    output [31:0]PC,
    output MuxArriba,
    output [31:0]Muxarriba,
    output [31:0]muxarriba,
    output MuxAbajo,
    output Mux_Abajo,
    output [31:0]Muxabajo,
    output [31:0]WriteData
  
);


assign PC= (clk) ? Mux_Arriba : PC;
assign MuxArriba= (clk) ? Jump : MuxArriba;
assign Muxarriba= (clk) ? Shift_left2 : Muxarriba;
assign muxarriba= (clk) ? Mux_Mux : muxarriba;
assign MuxAbajo= (clk) ? MemtoReg : MuxAbajo;
assign Mux_Abajo= (clk) ? Read_Memory : Mux_Abajo;
assign Muxabajo= (clk) ? ALU : Muxabajo;
assign WriteData= (clk) ? muxabajo : WriteData;



    
endmodule
