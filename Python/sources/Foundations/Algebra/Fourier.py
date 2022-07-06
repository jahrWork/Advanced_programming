import matplotlib.pyplot as plt
from math  import  pi, sin  
from cmath  import exp  
from numpy import  array, conj  



def Fourier_example(): 
  
     print( " Fourier series examples    " ) 

     N = 24     # Fourier truncated series 
     M = 2000   # points to plot 

     x = array( [ 2*pi*i/M for i in range(M) ] ) 
     y = array( list( map( lambda x: Fourier_series( N, x ) , x) ) ) 

     plt.plot(x, y) 
     plt.show() 

     y = array( list( map( lambda x: sine_Fourier( N, x ) , x) ) ) 

     plt.plot(x, y) 
     plt.show() 

#--------------------------------------------------
# f(x) = sum from k= -N/2 to N/2 c_k exp( I k x ) 
#      
#         with  c_k = ( a_k - I * b_k ) / 2, k>0 
#               c_{-k} = conjugate( c_k ) 
#
#               a_k : cosine coefficients 
#               b_k : sine coefficients 
#--------------------------------------------------
def Fourier_series(N, x): 
   
     
    M = int(N/2)
   
#   complex :: c(-N/2:N/2), e(-N/2:N/2) 
#   real :: a(0:N/2), b(0:N/2) 
    a = array( [ 0. for k in range(M+1) ] )
    b = array( [ 0. for k in range(M+1) ] ) 
    # WARNING DOES NOT WORK  if array is initialized with 0 instead of 0. 
    c = array( [ complex(0., 0.)   for k in range(-M, M+1) ] )
    e = array( [ exp( 1j * k * x ) for k in range(-M, M+1) ] )

    for k in range(1, M+1): 
            b[k] = 2*(-1)**(k+1) / (pi*k) 

#   c(0:N/2)   =   ( ak - I * bk )/2 
#   c(-N/2:-1) = conjg( c(N/2:1:-1) )
#   WARNING in python c[0:3]= c[0], c[1], c[2] 
#   Python is a pain in the ass with indexes starting at 0. 
    for k in range(0, M+1): 
        c[M+k] = ( a[k] - b[k]* 1j )/2 
        
    for k in range(0, M+1): 
        c[k] = conj( c[N-k] )
   
    f = sum( c * e ).real 

    return f
    

def sine_Fourier(N, x): 


    M = int(N/2)

  # k goes from 0 to M-1
  # It obligues to modify k by k+1
    b = array( [ 2*(-1)**(k+2) / (pi*(k+1)) for k in range(M) ] ) 
    
    sink = array( [ sin( (k+1) * x ) for k in range(M) ] ) 
    
    f = sum( b * sink )  
    
    return f 