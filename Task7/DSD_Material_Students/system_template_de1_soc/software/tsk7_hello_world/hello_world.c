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

#include <stdio.h>
#include <system.h>
#include <math.h>

int main()
{
  printf("Hello from Nios II!\n");
  short int x = 1;
  int angle = 3;
  //int32_t  i32 = (int32_t)( (uint32_t)s1<<16 | (uint32_t)s2 ); store two numbers in one variable
  double x_mh = cos(3);
  int x_ci = ALT_CI_SINCOS_CORDIC_0(x,angle);
  printf("%f \n", x_mh);
  printf("%d \n", x_ci);
  return 0;
}
