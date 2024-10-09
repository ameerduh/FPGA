module shiftRegisterS(input logic clk,
			input logic reset,
			input logic [15:0] in,
			output logic [15:0] out);
//16 registers for switch box muxes

			dff d1(.clk(clk),
					 .reset(reset),
					 .d(in[0]),
					 .q(out[0]));
			dff d2(.clk(clk),
					 .reset(reset),
					 .d(in[1]),
					 .q(out[1]));
			dff d3(.clk(clk),
					 .reset(reset),
					 .d(in[2]),
					 .q(out[2]));
			dff d4(.clk(clk),
					 .reset(reset),
					 .d(in[3]),
					 .q(out[3]));
			dff d5(.clk(clk),
					 .reset(reset),
					 .d(in[4]),
					 .q(out[4]));
			dff d6(.clk(clk),
					 .reset(reset),
					 .d(in[5]),
					 .q(out[5]));
			dff d7(.clk(clk),
					 .reset(reset),
					 .d(in[6]),
					 .q(out[6]));
			dff d8(.clk(clk),
					 .reset(reset),
					 .d(in[7]),
					 .q(out[7]));
			dff d9(.clk(clk),
					 .reset(reset),
					 .d(in[8]),
					 .q(out[8]));
			dff d10(.clk(clk),
					 .reset(reset),
					 .d(in[9]),
					 .q(out[9]));
			dff d11(.clk(clk),
					 .reset(reset),
					 .d(in[10]),
					 .q(out[10]));
			dff d12(.clk(clk),
					 .reset(reset),
					 .d(in[11]),
					 .q(out[11]));
			dff d13(.clk(clk),
					 .reset(reset),
					 .d(in[12]),
					 .q(out[12]));
			dff d14(.clk(clk),
					 .reset(reset),
					 .d(in[13]),
					 .q(out[13]));
			dff d15(.clk(clk),
					 .reset(reset),
					 .d(in[14]),
					 .q(out[14]));
			dff d16(.clk(clk),
					 .reset(reset),
					 .d(in[15]),
					 .q(out[15]));
				
endmodule