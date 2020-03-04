// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"
// CREATED		"Wed Mar 04 15:49:27 2020"

module sincos_cordic(
	areset,
	clk,
	a,
	c,
	s
);


input wire	areset;
input wire	clk;
input wire	[34:0] a;
output wire	[33:0] c;
output wire	[33:0] s;






cordic_block	b2v_inst(
	.areset(areset),
	.clk(clk),
	.a(a),
	.c(c),
	.s(s));


endmodule
