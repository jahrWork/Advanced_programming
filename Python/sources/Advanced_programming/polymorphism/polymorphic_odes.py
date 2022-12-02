from numpy import array, zeros, linspace 
import matplotlib.pyplot as plt 

def Euler(U1, t1, t2, F): 
    return U1 + (t2-t1) * F(U1, t1)

def oscillator(U, t):
    return array( [ U[1], -U[0] ] )

def complex_oscillator(Z, t):
    return -1j * Z

def simulation(U0, Nv, F):  

     N = 100
     U = zeros( (N+1, Nv), dtype=type(U0) ) 
     time = linspace(0, 10, N+1)
     U[0, :] =  U0
    
     for i in range(N): 
         U[i+1,:] = Euler( U[i,:], time[i], time[i+1], F )
     
     if Nv==1: 
        plt.plot( U[:].real, U[:].imag )
     else: 
        plt.plot( U[:,0], U[:,1] )

     plt.axis("equal")
     plt.show()


def complex_ODES(): 
    
   # Example of a system of two real equations 
   U0 = array( [1, 0] ) 
   simulation( U0, 2, oscillator )

   # Example of a complex equation sith the same function 
   Z0 = complex( 1, 0 ) 
   simulation( Z0, 1, complex_oscillator )

   # state vector to integrate is polymorphic 


if __name__ == "__main__": 

    complex_ODES() 
