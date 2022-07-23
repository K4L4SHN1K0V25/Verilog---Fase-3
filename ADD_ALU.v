`timescale 1ns/1ns

module AddSL(
    input [31:0]Add,
    input [31:0]Shiftleft,
    output [31:0]Result
);

    assign Result = Add + Shiftleft ;
    
endmodule

