module logicBlock(input logic [1:0] I,
				  input logic [4:0] logic_Config,
				  input logic clk,
				  input logic reset,
				  output logic Z);
						
			logic [4:0] out;
			
			shiftRegisterL sL(.clk(clk),
				   .reset(reset),
				   .in(logic_Config),
				   .out(out));
					 
			logic [1:0] options;	
			
			mux4to1 m1(.in(out[3:0]),
					   .sel(I),
					   .out(options[0]));	
							
			dff d1(.clk(clk),
				   .reset(reset),
				   .d(options[0]),
				   .q(options[1]));
					 
			mux2to1 m2(.in(options),
					   .sel(out[4]),
					   .out(Z));	
						  
endmodule
