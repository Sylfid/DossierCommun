/*
 **  PROGRAM: Hello World
 **
 **  PURPOSE: Standard Hello World program in C
 **
 **  COMPILATION: gcc hello.c -o hello
 **
 **  USAGE: ./hello
 **
 */

#include <stdio.h>
#include <omp.h>
int main ()
{
    int th_id;
#pragma omp parallel private (th_id)
{
    th_id = omp_get_thread_num();
    printf("Hello World from %d thread!\n", th_id);
}
}
