module shiftRegisterL(input logic clk,
			input logic reset,
			input logic [4:0] in,
			output logic [4:0] out);
//5 configs for logic block
//1-4 for mux4to1 inputs
//5 for mux2to1 select
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

endmodule
