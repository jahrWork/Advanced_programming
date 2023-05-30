
#include <iostream>

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <iostream>

#define N 5000
#define M 5000
#define TIMES 1000



void block_matmul( float **A,  float **B, float **C, int n, int b)
{
     int i, j, k, kk, jj;
     double sum;
     int en = b * (n / b); /* Amount that fits evenly into blocks */
    
         for (i = 0; i < n; i++)
         for (j = 0; j < n; j++)
         C[i][j] = 0.0;
    
         for (kk = 0; kk < en; kk += b) 
          for (jj = 0; jj < en; jj += b) 
             for (i = 0; i < n; i++) 
                 for (j = jj; j < jj + b; j++) 
                 {
                     sum = C[i][j];
                     for (k = kk; k < kk + b; k++) 
                     {
                         sum += A[i][k] * B[k][j];
                        
                     }
                     C[i][j] = sum;
                 }
                
 }

void matmul(float** A, float** B, float** C, int n)
{
    int i, j, k;
   
        
      for (i = 0; i < n; i++)
          for (j = 0; j < n; j++)
          {
              C[i][j] = 0.0;
              for (k = 0; k < n; k++)
              {
                  C[i][j] += A[i][k] * B[k][j];

              }
          }

}







int main() {



    float** A;
    float* x;
    float* b;
    clock_t start, end;
    double cpu_time_used;
    float s;
    int i, j, k;


    // Allocate memory for A, x and b using malloc
    A = (float**)malloc(N * sizeof(float*));
    for (int i = 0; i < N; i++) {
        A[i] = (float*)calloc(M, sizeof(float));
    }
    x = (float*)calloc(N, sizeof(float));
    b = (float*)calloc(M, sizeof(float));



    // Initialize A and x with random values
    srand(time(NULL));
    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++)
        {
            s = N * M;
            A[i][j] = (i * (j+2) ) / s; 

        }
        x[i] = i * i / s;  
    }


      

    // Perform A-x multiplication TIMES times and measure CPU time
    start = clock();
    //#pragma vector novecremainder
    for (k = 0; k < TIMES; k++) {

        //#pragma vector novecremainder
        for (i = 0; i < N; i++)
        {
            b[i] = 0.0;

            //#pragma vector novecremainder
            for (j = 0; j < M; j++)
            {
                b[i] += A[i][j] * x[j];
            }
           
        }
      // printf("C++ %d\n ", k);
    }

    end = clock();
    cpu_time_used = difftime(end, start) / CLOCKS_PER_SEC;
    printf("CPU time used: %f seconds\n", cpu_time_used);
    printf(" b_0 = %15.10f \n", b[0]);
    printf(" b_M = %15.10f \n", b[M - 1]);

}