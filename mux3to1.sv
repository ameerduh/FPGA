module mux3to1(input logic [2:0] in,
			   input logic [1:0] sel,
			   output logic out);
	  
always_comb begin
	case(sel)
		2'b00 : out = in[0];
		2'b01 : out = in[1];	
		2'b10 : out = in[2]; 
	endcase
end		
		
endmodule
