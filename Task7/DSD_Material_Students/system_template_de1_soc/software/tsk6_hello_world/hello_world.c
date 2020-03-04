#include <system.h>
#include <stdio.h>

#define ALT_CI_FP32MULT_0(A,B) __builtin_custom_fnff(ALT_CI_FP32MULT_0_N,(A),(B))

int main()
{
	 printf("Hello from Nios II!\n");
	 float a, b, c, d;
	 a = 2.5;
	 b = 4.5;
	 c = a*b;
	 printf("Multiplication result: %f\n", c);
	 d = ALT_CI_FP32MULT_0(a,b);
	 printf("Multiplication result from custom instr: %f", d);
	 return 0;
}
