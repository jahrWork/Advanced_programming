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

N = 2**38

S = series(N) 
print("S =", S) 

S = series(N) 
print("Error =", S - pi**2/6) 
print("Error bound =", 1/N) 
