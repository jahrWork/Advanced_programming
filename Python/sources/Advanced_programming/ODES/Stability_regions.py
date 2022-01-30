from numpy import array, zeros, linspace, abs, transpose
from Temporal_schemes import Euler, RK4, Inverse_Euler 
import matplotlib.pyplot as plt

def Stability_Region(Scheme, N, x0, xf, y0, yf): 

    x, y = linspace(x0, xf, N), linspace(y0, yf, N)
    rho =  array( zeros([N, N]) )

    for i in range(N): 
      for j in range(N):

          w = complex(x[i], y[j])
          r = Scheme( 1., 1., 0., lambda u, t: w*u )
          rho[i, j] = abs(r) 

    return rho, x, y  


def test_RK4(): 

    rho, x, y  = Stability_Region( RK4, 100, -4, 2, -4, 4)

    plt.contour( x, y, transpose(rho), linspace(0, 1, 11) )
    plt.axis('equal')
    plt.grid()
    plt.show()

def test_Inverse_Euler(): 

    
    rho, x, y  = Stability_Region( Inverse_Euler, 100, -4, 4, -4, 4) 

    plt.contour( x, y, transpose(rho), linspace(0, 1, 11) )
    plt.axis('equal')
    plt.grid()
    plt.show()


    
    
if __name__ == '__main__':  
    test_RK4()
    test_Inverse_Euler()