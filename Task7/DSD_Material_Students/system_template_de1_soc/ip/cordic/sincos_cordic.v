`timescale 1 ns/100 ps

// The idea is:
// X_n = K_i[X_o - Y_o * d_i * 2^-i]
// Y_n = K_i[Y_o + X_o * d_i * 2^-i]
//
// With K_i being cos(angle) = 1/sqrt(1+(2^-i)^2)
//
// But to get the desired angle of roation we have to perform a series of succesively smaller elementary rotations:
// We start with the desired angloe of rotation "angle" for each iteration if "angle" > 0 then we subtract
// the current iteration angle from Z_i, otherwise we add the current iteratioin angle to Z_i and also make our
// appropriate X and Y calculations




// Note: 1. Input angle is a modulo of 2*PI scaled to fit in a 32 bit register. The user must translate
// this angle to a value from 0 - (2^32 - 1). 0 deg = 32'h0, 359.99999.... = 32'hFF_FF_FF_FF
// to translate from degrees to a 32 bit value, multiply 2^32 by the angle (in degrees),
// then divide by 360
// 2. Size of Xout, Yout is 1 bit larger due to a system gain of 1.647 (which is < 2)


module CORDIC(clock, deg, Xout);

	parameter XY_SZ = 32; //

	localparam STG = XY_SZ;

	input								clock;
	input signed		  [31:0] deg;
	output signed	  [XY_SZ:0] Xout;

	reg [XY_SZ-1:0] Xin, Yin;
	wire [31:0] angle;

	localparam VALUE = 32000/1.647;
	initial
	begin
		Xin = VALUE;
		Yin = 1'd0;
	end
	assign angle = ((1 << 32) * deg) / 360;


	//
	// arctan table
	//


	// Note: The atan_table was chosen to be 31 bits wide giving resolution up to atan(2^-30)
   wire signed [31:0] atan_table [0:30];

   // upper 2 bits = 2'b00 which represents 0 - PI/2 range
   // upper 2 bits = 2'b01 which represents PI/2 to PI range
   // upper 2 bits = 2'b10 which represents PI to 3*PI/2 range (i.e. -PI/2 to -PI)
   // upper 2 bits = 2'b11 which represents 3*PI/2 to 2*PI range (i.e. 0 to -PI/2)
   // The upper 2 bits therefore tell us which quadrant we are in.
   assign atan_table[00] = 32'b00100000000000000000000000000000; // 45.000 degrees -> atan(2^0)
   assign atan_table[01] = 32'b00010010111001000000010100011101; // 26.565 degrees -> atan(2^-1)
   assign atan_table[02] = 32'b00001001111110110011100001011011; // 14.036 degrees -> atan(2^-2)
   assign atan_table[03] = 32'b00000101000100010001000111010100; // atan(2^-3)
   assign atan_table[04] = 32'b00000010100010110000110101000011;
   assign atan_table[05] = 32'b00000001010001011101011111100001;
   assign atan_table[06] = 32'b00000000101000101111011000011110;
   assign atan_table[07] = 32'b00000000010100010111110001010101;
   assign atan_table[08] = 32'b00000000001010001011111001010011;
   assign atan_table[09] = 32'b00000000000101000101111100101110;
   assign atan_table[10] = 32'b00000000000010100010111110011000;
   assign atan_table[11] = 32'b00000000000001010001011111001100;
   assign atan_table[12] = 32'b00000000000000101000101111100110;
   assign atan_table[13] = 32'b00000000000000010100010111110011;
   assign atan_table[14] = 32'b00000000000000001010001011111001;
   assign atan_table[15] = 32'b00000000000000000101000101111101;
   assign atan_table[16] = 32'b00000000000000000010100010111110;
   assign atan_table[17] = 32'b00000000000000000001010001011111;
   assign atan_table[18] = 32'b00000000000000000000101000101111;
   assign atan_table[19] = 32'b00000000000000000000010100011000;
   assign atan_table[20] = 32'b00000000000000000000001010001100;
   assign atan_table[21] = 32'b00000000000000000000000101000110;
   assign atan_table[22] = 32'b00000000000000000000000010100011;
   assign atan_table[23] = 32'b00000000000000000000000001010001;
   assign atan_table[24] = 32'b00000000000000000000000000101000;
   assign atan_table[25] = 32'b00000000000000000000000000010100;
   assign atan_table[26] = 32'b00000000000000000000000000001010;
   assign atan_table[27] = 32'b00000000000000000000000000000101;
   assign atan_table[28] = 32'b00000000000000000000000000000010;
   assign atan_table[29] = 32'b00000000000000000000000000000001; // atan(2^-29)
   assign atan_table[30] = 32'b00000000000000000000000000000000;

	//
	// registered
	//

	// stage outputs
	reg signed [XY_SZ:0] X [0:STG-1];
	reg signed [XY_SZ:0] Y [0:STG-1];
	reg signed 		[31:0] Z [0:STG-1];

	//
	// stage 0
	// This portion of the code determines if a pre rotation of the
	// inputs needs to be done and saves the values of xin, yin and
	// the angle in the x_sz, y_sz, z_sz registers
	//
	// with the upper two bits we can determine which quadrant
	// the initial rotation angle is in
	wire				[1:0] quadrant;
	assign	quadrant = angle[31:30];

	always @(posedge clock)
	begin
		case (quadrant)
			2'b00, //0 to pi/2 quadrant >> no rotation is necessary
			2'b11: // 0 to -pi/2 quadrant >> no pre-rotation necessary
			begin
				X[0] <= Xin;
				Y[0] <= Yin;
				Z[0] <= angle;
			end

			2'b01: //pi/2 to pi quadrant so pre rotation is needed
			begin
				X[0] <= -Yin;
				Y[0] <= Xin;
				Z[0] <= {2'b00, angle[29:0]}; // subtract pi/2 from angle
			end

			2'b10: //pi to 3/2 pi quadrant so pre rotation is needed
			begin
				X[0] <= Yin;
				Y[0] <= -Xin;
				Z[0] <= {2'b11,angle[29:0]}; // add pi/2 from angle
			end

		endcase
	end

	//
	// generate stages 1 to STG-1
	//
	genvar i;

	// here we are going to replicate logic 15 times

	generate
	for (i=0; i < (STG-1); i=i+1)
	begin: XYZ
		//here the logic is defined
		//You can think of each stage as a block of code that is connected
		//to the next stage in certain manner
		wire							Z_sign; //1 bit wide variable
		wire signed [XY_SZ:0] X_shr, Y_shr;

		assign X_shr = X[i] >>> i; // signed shift right
		assign Y_shr = Y[i] >>> i; //number of bits shifted right depends on the stage

		//the sign of the current rotation angle is determined
		//by the most significant bit
		assign Z_sign = Z[i][31]; // Z_sign = 1 if Z[i] < 0

		always @(posedge clock)
		begin
			// add/subtract shifted data
			// pipeline stages of the X, Y and Z variables
			X[i+1] <= Z_sign ? X[i] + Y_shr		: X[i] - Y_shr;
			Y[i+1] <= Z_sign ? Y[i] - X_shr		: Y[i] + X_shr;
			Z[i+1] <= Z_sign ? Z[i] + atan_table[i] : Z[i] - atan_table[i];
		end
	end
	endgenerate

	//
	// output
	//
	assign Xout = X[STG-1];

endmodule
