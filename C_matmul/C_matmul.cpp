
#include <iostream>

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <iostream>

#define N 5000
#define M 5000
#define TIMES 1000



// Para TIMES = 1000 -> ~ 120 segundos
// BLAS: Basic Linear Algebra Subroutines (MATLAB y NumPy)
// cuBLAS for CUDA
// LAPACK



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
            s = (N * M);
            A[i][j] = (i * j) / s; //(float)rand() / (float)(RAND_MAX / 10.0);

        }
        x[i] = i * i / s;  //  (float)rand() / (float)(RAND_MAX / 10.0);
    }



    // Perform A-x multiplication TIMES times and measure CPU time
    start = clock();
    for (k = 0; k < TIMES; k++) {

        for (i = 0; i < N; i++)
        {
            //s = 0.0;
            b[i] = 0.0;
            for (j = 0; j < M; j++)
            {
                b[i] += A[i][j] * x[j];
                //   s = s + k * A[i][j] * x[j];
                 //  s = s +  x[j] * x[j];
            }
            // = s;
            //   printf("%f10.8 ", s);
        }
       printf("C++ %d\n ", k);
    }

    end = clock();
    cpu_time_used = difftime(end, start) / CLOCKS_PER_SEC;
    printf("CPU time used: %f seconds\n", cpu_time_used);
    printf(" b_0 = %15.10f \n", b[0]);
    printf(" b_M = %15.10f \n", b[M - 1]);

}