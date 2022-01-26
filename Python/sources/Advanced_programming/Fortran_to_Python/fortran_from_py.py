import sys 
#sys.path.append('Dropbox/Software_codes/Simulation/Advanced_programming/Python')
#sys.path.append("c:\Dropbox\Software_codes\Simulation\Advanced_programming\Python")

import fortran as f
import os
from numpy import array


def fortran_example(): 
  
  V = array( [ 1, 2, 3, 4 ] )    
  S = f.fortran.my_sum( V ) 
  print( " Array from numpy V =", V)
  print("\n Fortran sum(V) =", S) 


if __name__ == '__main__':  

     fortran_example()