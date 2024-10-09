module shiftRegisterC(input logic clk,
			input logic reset,
			input logic [7:0] in,
			output logic [7:0] out);
//8 registers for connection block muxes


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
			
endmodule
