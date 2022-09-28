from numpy import array, zeros


#***********************************************************************
#*  If gives the linearized operator F(U,t) in some point U0 
#***********************************************************************
def System_matrix( F, U0, t ): 
   
     eps = 1e-6 
     N = len(U0) 
     A =  zeros( (N, N), dtype=float64)
     delta = zeros(N) 
     
     for j in range(N):  
         
         delta[:] = 0 
         delta[j] = eps 
         A[:, j] = ( F( U0 + delta, t ) - F( U0 - delta, t ) )/(2*eps)
  
     return A 

def Oscillator(U,t): 

   return array( [ U[1], -U[0] ] ) 

def test_system_matrix(): 

    U0 = array( [ 0., 0. ] ) 
    t = 0. 
    A = System_matrix(Oscillator,  U0, t)
    print("A=", A)


if __name__ == '__main__':  
      test_system_matrix()