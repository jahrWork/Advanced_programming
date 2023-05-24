
from numpy import zeros, matmul 
import time 


N = 5000
M =  5000
TIMES = 1000
A = zeros( [N,M]  )
x = zeros( [N]  )
b = zeros( [M]  )

for i in range(N):    
     for j in range(M): 
             A[i,j]   = (i * j )  / ( N * M) 
     x[i] = i * i / ( N * M ) 
    
    
t1 = time.time()
for k in range(TIMES):    
        b =  matmul(A, x) 
        #print(k) 
t2 = time.time()   

print(" CPU = ", t2-t1 )  
print("b_1 = ", b[0] )
print("b_M = ", b[M-1] ) 

   