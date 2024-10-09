module switchBox(
input logic clk,
input logic reset,
input logic [15:0]switch_Config,
input logic [3:0] left_in,
input logic [3:0] top_in,
input logic [3:0] right_in,
input logic [3:0] bottom_in,
output logic [3:0] left_out,
output logic [3:0] top_out,
output logic [3:0] right_out,
output logic [3:0] bottom_out
);

logic [15:0]outRegister;
shiftRegisterS sS(
.clk(clk),
.reset(reset),
.in(switch_Config),
.out(outRegister)

);

logic [2:0]inL1, inL2, inT1, inT2, inR1, inR2, inB1, inB2;

//L1
assign inL1[0] = top_in[3];
assign inL1[1] = right_in[2];
assign inL1[2] = bottom_in[3];

//L2
assign inL2[0] = top_in[1];
assign inL2[1] = right_in[0];
assign inL2[2] = bottom_in[1];

//T1
assign inT1[0] = left_in[2];
assign inT1[1] = bottom_in[1];
assign inT1[2] = right_in[2];

//T2
assign inT2[0] = left_in[0];
assign inT2[1] = bottom_in[3];
assign inT2[2] = right_in[0];

//R1
assign inR1[0] = top_in[1];
assign inR1[1] = left_in[0];
assign inR1[2] = bottom_in[3];

//R2
assign inR2[0] = top_in[3];
assign inR2[1] = left_in[2];
assign inR2[2] = bottom_in[1];

//B1
assign inB1[0] = left_in[0];
assign inB1[1] = top_in[3];
assign inB1[2] = right_in[2];

//B2
assign inB2[0] = left_in[2];
assign inB2[1] = top_in[1];
assign inB2[2] = right_in[0];



mux3to1 mLeft_1(.in(inL1), .sel(outRegister[15:14]), .out(left_out[1]));
mux3to1 mLeft_2(.in(inL2), .sel(outRegister[13:12]), .out(left_out[3]));

mux3to1 mTop_1(.in(inT1), .sel(outRegister[11:10]), .out(top_out[2]));
mux3to1 mTop_2(.in(inT2), .sel(outRegister[9:8]), .out(top_out[0]));

mux3to1 mRight_1(.in(inR1), .sel(outRegister[7:6]), .out(right_out[3]));
mux3to1 mRight_2(.in(inR2), .sel(outRegister[5:4]), .out(right_out[1]));

mux3to1 mBottom_1(.in(inB1), .sel(outRegister[3:2]), .out(bottom_out[0]));
mux3to1 mBottom_2(.in(inB2), .sel(outRegister[1:0]), .out(bottom_out[2]));


endmodule