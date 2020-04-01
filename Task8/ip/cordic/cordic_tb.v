`timescale 1 ps / 1 ps

module cordic_tb ();

reg		clk;
reg		reset;
reg	[31:0]	theta;
wire	[31:0]	result;

cordic cord (
	.clk(clk),
	.reset(reset),
	.theta(theta),
	.result(result)
);

always #100 clk = ~clk;

initial
begin
	$display($time, " << Starting Simulation >> ");
	clk = 0;
	//theta = 32'h00000000;
	#10000;
	theta = 32'h3f000000;
	#10000;
	$display($time, " << Simulation Complete>> ");
	$display($time, " << Simulation Complete>> ");

	$stop;
end

endmodule