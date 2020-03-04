#include <stdlib.h>
#include <sys/alt_stdio.h>
#include <sys/alt_alarm.h>
#include <sys/times.h>
#include <alt_types.h>
#include <system.h>
#include <stdio.h>
#include <unistd.h>
#include <math.h>

// Test case 1
//#define step 5
//#define N 52

// Test case 2
#define step 1/8.0
#define N 2041

//Test case 3
//#define step 1/1024.0
//#define N 261121

// Generates the vector x and stores it in the memory
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
        k += x[i]*(0.5 + x[i]*cos(x[i]/128-1));
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
 // till here
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
