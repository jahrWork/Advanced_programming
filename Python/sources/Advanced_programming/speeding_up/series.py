from numba import njit, prange
from decorators import profiling 
from math import pi 



@profiling
@njit(parallel=True)
#@njit
def series(N):
    S = 0
   
    for i in prange(1, N+1):
        S = S + 1 / float(N-i+1)**2 

    return S


@profiling
def series_without_numba(N):
    S = 0
   
    for i in prange(1, N+1):
        S = S + 1 / float(N-i+1)**2 

    return S

N = 2**38
#N = 2**20
print("sum 1/n**2 with N=", N, " terms")
S = series(N) 
#print("S =", S)
#S = series(N) 
print("S =", S) 
print("Error =", S - pi**2/6) 
print("Error bound =", 1/N) 



#S = series_without_numba(N) 
