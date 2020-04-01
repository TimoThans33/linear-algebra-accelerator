/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */
#include <stdlib.h>
#include <sys/alt_stdio.h>
#include <sys/alt_alarm.h>
#include <sys/times.h>
#include <alt_types.h>
#include <system.h>
#include <stdio.h>
#include <unistd.h>
#include <math.h>


#define ALT_CI_FP32ADD_0(A,B) __builtin_custom_fnff(ALT_CI_FP32ADD_0_N,(A),(B))
#define ALT_CI_FP32MULT_0(A,B) __builtin_custom_fnff(ALT_CI_FP32MULT_0_N,(A),(B))
//Test case 3
#define step 1/1024.0
#define N 261121

float e = 1/128;
#define TABLE_SIZE 8192
#define PI 3.14159265359f
#define HALF_PI 1.57079632679f
#define TWO_PI 6.28318530718f

float lookupTable[TABLE_SIZE];
// Generates the vector x and stores it in the memory

void initLookup()
{
	for (unsigned int i = 0; i < TABLE_SIZE; ++i)
		lookupTable[i] = cos(HALF_PI * (float)i / (float)TABLE_SIZE);
}

float cosine(float x)
{
	x = fmod(fabs(x), TWO_PI);
	if (x > PI)
		x = PI - x;
	if (x < HALF_PI)
		return lookupTable[(int)(x * (float)TABLE_SIZE / HALF_PI)];
	else
		return -lookupTable[(int)((HALF_PI - x) * (float)TABLE_SIZE / HALF_PI)];
}

void generateVector(float *x, int length, float STEP)
{
	for (unsigned int i = 0; i < length; ++i)
	{
		x[i] = i*STEP;
	}
}

float sumVector(float x[], int M)
{
    float k = 0;
    for (int i=0; i<M; i++){
    	float a = cosine(x[i]/128-1);
    	float b = ALT_CI_FP32ADD_0(0.5, ALT_CI_FP32MULT_0(x[i], a));
        k += ALT_CI_FP32MULT_0(x[i],b);  //x[i]*(0.5 + x[i]*cos(x[i]/128-1));
    }
    return(k);
}
int main()
{
	 printf("Task 2!\n");
	 // Define input vector
	 float x[N];
	 // Returned result
	 float y;
	 generateVector(x, N, step);
	 // The following is used for timing
	 char buf[50];
	 clock_t exec_t1, exec_t2;
	 exec_t1 = times(NULL); // get system time before starting the process

	// The code that you want to time goes here
	 y = sumVector(x, N);
	 // till her
	 exec_t2 = times(NULL); // get system time after finishing the process

	 gcvt((exec_t2 - exec_t1), 10, buf);
	 alt_putstr(" proc time = "); alt_putstr(buf); alt_putstr(" ticks \n");
	 // printf could be used if there was enough memory
	 int i;
	 for (i=0; i<10; i++)
	 y = y/2.0;
	 gcvt(((int) y), 10, buf);

	 alt_putstr(" Result (divided by 1024) = "); alt_putstr(buf);
	 // printf could be used if there was enough memory
	 return 0;
}
