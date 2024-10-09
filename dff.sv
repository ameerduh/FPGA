module dff(input logic clk,
		   input logic reset,
		   input logic d, 
		   output logic q);
		   
	always @ (posedge clk) 
	begin
		if(reset==1)
			q=0;
		else
			q=d;
	end
endmodule

