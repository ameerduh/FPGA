module fpga(input logic clk,
			input logic reset,
			input logic [115:0] prog_in,
			input logic A,
			input logic B,
			input logic C,
			input logic D,
			output logic Z
			);

logic [19:0] logic_Config;
logic [31:0] connect_Config;
logic [63:0] switch_Config;		

assign logic_Config = prog_in[19:0];
assign connect_Config = prog_in[51:20];
assign switch_Config = prog_in[115:52];	

// 00

//all 4 parallel inputs 00 
logic [3:0] in00;
//all 4 parallel outputs 00
logic [3:0] out00;
//output-selector 
logic [1:0] I00;

//revised logic 00
logic I00_0,I00_1;

//output-selector parts 00
assign I00[0] = I00_0;
assign I00[1] = I00_1;

// outputs and inputs of switch box 00
logic [3:0] left00_in, top00_in, right00_in, bottom00_in;
logic [3:0] left00_out, top00_out, right00_out, bottom00_out;

//01

//all 4 parallel inputs 01 
logic [3:0] in01;
//all 4 parallel outputs 01
logic [3:0] out01;

//revised logic 01
logic I01_0,I01_1;

//output-selector 
logic [1:0] I01;

//output-selector parts 01
assign I01[0] = I01_0;
assign I01[1] = I01_1;

// outputs and inputs of switch box 01
logic [3:0] left01_in, top01_in, right01_in, bottom01_in;
logic [3:0] left01_out, top01_out, right01_out, bottom01_out;

//10

//all 4 parallel inputs 10 
logic [3:0] in10;
//all 4 parallel outputs 10
logic [3:0] out10;
//output-selector 
logic [1:0] I10;

//revised logic 10
logic I10_0,I10_1;

//output-selector parts 10
assign I10[0] = I10_0;
assign I10[1] = I10_1;

// outputs and inputs of switch box 10
logic [3:0] left10_in, top10_in, right10_in, bottom10_in;
logic [3:0] left10_out, top10_out, right10_out, bottom10_out;

//11

//all 4 parallel inputs 11 
logic [3:0] in11;
//all 4 parallel outputs 11
logic [3:0] out11;
//output-selector 
logic [1:0] I11;

//revised logic 11
logic I11_0,I11_1;

//output-selector parts 11
assign I11[0] = I11_0;
assign I11[1] = I11_1;

// outputs and inputs of switch box 11
logic [3:0] left11_in, top11_in, right11_in, bottom11_in;
logic [3:0] left11_out, top11_out, right11_out, bottom11_out;


//////////////
assign in00[0] = A;
assign in00[2] = B;
assign right01_in[2] = C;
assign right01_in[0] = D;
assign Z = right11_out[1];
//////////////

////////////////////////////////////////////////////////////////////////
logicBlock L00(
.clk(clk),
.reset(reset),
.I(I00),
.logic_Config(logic_Config[19:15]),
.Z(Z00)
);


//left00
assign left00_in[0] = out00[0];
assign in00[1] = left00_out[1];
assign left00_in[2] = out00[2];
assign in00[3] = left00_out[3];

//no top00

//right00
assign right00_in[0] = out01[3];
assign in01[2] = right00_out[1];
assign right00_in[2] = out01[1];
assign in01[0] = right00_out[3];

//bottom00
assign top10_in[3] = bottom00_out[0];
assign bottom00_in[1] = top10_out[2];
assign top10_in[1] = bottom00_out[2];
assign bottom00_in[3] = top10_out[0];

connectionBlock C00(
.clk(clk),
.reset(reset),
.in(in00),
.out(out00), 
.I0(I00_0), 
.I1(I00_1), 
.z(Z00), 
.connect_Config(connect_Config[31:24])
);

switchBox S00(
.clk(clk),
.reset(reset),
.left_in(left00_in),
.top_in(top00_in),
.right_in(right00_in),
.bottom_in(bottom00_in),
.left_out(left00_out),
.top_out(top00_out),
.right_out(right00_out),
.bottom_out(bottom00_out),
.switch_Config(switch_Config[63:48])
);
/////////////////////////////////////////////////////////////////////////////////////



logicBlock L01(
.clk(clk),
.reset(reset),
.I(I01),
.logic_Config(logic_Config[14:10]),
.Z(Z01)
);



//left01 
assign left01_in[0] = out01[0];
assign in01[1] = left01_out[1]; 
assign left01_in[2] = out01[2]; 
assign in01[3] = left01_out[3]; 

//no top01
//no right01

//bottom01
assign top11_in[3] = bottom01_out[0];
assign bottom01_in[1] = top11_out[2];
assign top11_in[1] = bottom01_out[2];
assign bottom01_in[3] = top11_out[0]; 

connectionBlock C01(
.clk(clk),
.reset(reset),
.in(in01),
.out(out01), 
.I0(I01_0), 
.I1(I01_1), 
.z(Z01), 
.connect_Config(connect_Config[23:16])
);

switchBox S01(
.clk(clk),
.reset(reset),
.left_in(left01_in),
.top_in(top01_in),
.right_in(right01_in),
.bottom_in(bottom01_in),
.left_out(left01_out),
.top_out(top01_out),
.right_out(right01_out),
.bottom_out(bottom01_out),
.switch_Config(switch_Config[47:32])
);
////////////////////////////////////////////////////////////////////////////



logicBlock L10(
.clk(clk),
.reset(reset),
.I(I10),
.logic_Config(logic_Config[9:5]),
.Z(Z10)
);



//left10
assign left10_in[0] = out10[0];
assign in10[1] = left10_out[1];
assign left10_in[2] = out10[2];
assign in10[3] = left10_out[3];

//top10 repeated


//right10 
assign right10_in[0] = out11[3];
assign in11[2] = right10_out[1];
assign right10_in[2] = out11[1];
assign in11[0] = right00_out[3];

//no bottom10

connectionBlock C10(
.clk(clk),
.reset(reset),
.in(in10),
.out(out10), 
.I0(I10_0), 
.I1(I10_1), 
.z(Z10), 
.connect_Config(connect_Config[15:8])
);

switchBox S10(
.clk(clk),
.reset(reset),
.left_in(left10_in),
.top_in(top10_in),
.right_in(right10_in),
.bottom_in(bottom10_in),
.left_out(left10_out),
.top_out(top10_out),
.right_out(right10_out),
.bottom_out(bottom10_out),
.switch_Config(switch_Config[31:16])
);
///////////////////////////////////////////////////////////////////////////////////////////


logicBlock L11(
.clk(clk),
.reset(reset),
.I(I11),
.logic_Config(logic_Config[4:0]),
.Z(Z11)
);



//left11
assign left11_in[0] = out11[0];
assign in11[1] = left11_out[1];
assign left11_in[2] = out11[2];
assign in11[3] = left11_out[3];

//top11 repeated

//no right11

//no bottom11

connectionBlock C11(
.clk(clk),
.reset(reset),
.in(in11),
.out(out11), 
.I0(I11_0), 
.I1(I11_1), 
.z(Z11), 
.connect_Config(connect_Config[7:0])
);

switchBox S11(
.clk(clk),
.reset(reset),
.left_in(left11_in),
.top_in(top11_in),
.right_in(right11_in),
.bottom_in(bottom11_in),
.left_out(left11_out),
.top_out(top11_out),
.right_out(right11_out),
.bottom_out(bottom11_out),
.switch_Config(switch_Config[15:0])
);


endmodule