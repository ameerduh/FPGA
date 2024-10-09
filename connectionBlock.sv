module connectionBlock(
input logic reset,
input logic clk,
input logic [3:0] in,
input logic z,
input logic [7:0] connect_Config,
output logic [3:0] out,
output logic I0,
output logic I1
);

logic [7:0]outRegister;
shiftRegisterC sC(
.clk(clk),
.reset(reset),
.in(connect_Config),
.out(outRegister)

);

logic [1:0]in3, in4, in5, in6;
assign in3[0] = z;
assign in4[0] = z;
assign in5[0] = z;
assign in6[0] = z;

assign in3[1] = in[0];
assign in4[1] = in[1];
assign in5[1] = in[2];
assign in6[1] = in[3];

mux4to1 m1(.in(in), .sel(outRegister[7:6]), .out(I1));
mux4to1 m2(.in(in), .sel(outRegister[5:4]), .out(I0));


mux2to1 m3(.in(in3), .sel(outRegister[3]), .out(out[0]));
mux2to1 m4(.in(in4), .sel(outRegister[2]), .out(out[1]));
mux2to1 m5(.in(in5), .sel(outRegister[1]), .out(out[2]));
mux2to1 m6(.in(in6), .sel(outRegister[0]), .out(out[3]));

endmodule

