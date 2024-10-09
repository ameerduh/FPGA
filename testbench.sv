module testbench();

logic clk;
logic reset;
logic [115:0] prog_in;
logic A;
logic B;
logic C;
logic D;
logic Z;

always
#1 clk=~clk;


fpga f(
.clk(clk),
.reset(reset),
.prog_in(prog_in),
.A(A),
.B(B),
.C(C),
.D(D),
.Z(Z)
);

initial begin
	clk = 0;
	reset = 1;
	#1 prog_in = 116'bxxxxxxxxxxxx00xx_0101xxxxxxxx00xx_xxxxxxxxxx00xxxx_00xxxxxxxx01xxxx_00100xxx_01110xxx_xxxxxxxx_1001xx0x_01000_01000_xxxxx_01110;
	#123 reset = 0;
	
	A=1;
	B=1;
	C=0;
	D=0;
	
	#100;
	
	A=1;
	B=0;
	C=0;
	D=1;
	
end

endmodule