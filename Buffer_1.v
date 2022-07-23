`timescale 1ns/1ns
module Buffer_1 (
    input  clk,
    input [31:0]Mux,
    input [31:0]ADD_4,
    input [31:0]Instruction_Memory,
    output [31:0]PC,
    output [31:0]ADD_ALU,
    output [31:0]Register

);

assign PC= (clk) ? Mux : PC;
assign ADD_ALU= (clk) ? ADD_4 : ADD_ALU;
assign Register= (clk) ? Instruction_Memory : Register;
    
endmodule