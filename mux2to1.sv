module mux2to1(input logic [1:0] in,
			   input logic sel,
			   output logic out);
			   
always_comb begin
	case(sel)
		1'b0 : out = in[0];
		1'b1 : out = in[1];
	endcase
end	

endmodule
