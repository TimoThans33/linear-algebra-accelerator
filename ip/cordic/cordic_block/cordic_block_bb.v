
module cordic_block (
	a,
	areset,
	c,
	clk,
	s);	

	input	[34:0]	a;
	input		areset;
	output	[33:0]	c;
	input		clk;
	output	[33:0]	s;
endmodule
