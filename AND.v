`timescale 1ns/1ns
module AND(
    input Branch,
    input ZeroFlag,
    output Mux
);

 assign Mux =Branch & ZeroFlag;

endmodule
