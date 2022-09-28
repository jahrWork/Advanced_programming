from Cauchy_problem import Cauchy_problem
from numpy import array, zeros, log10, ones, vstack  
from numpy.linalg import norm, lstsq
 


def Error_Cauchy_Problem( Time_Domain, Differential_operator,  
                          Scheme, order, U0 ):  
          
       N = len(Time_Domain)-1;  Nv = len(U0) 
       t1 = Time_Domain
       t2 = zeros(2*N+1)
       Error = zeros(N+1, Nv)
       
       for i in range(N):  
           t2[2*i]   = t1[i] 
           t2[2*i+1] = ( t1[i] + t1[i+1] )/2
       t2[2*N] = t1[N]
      
       
       U1 =   Cauchy_problem( Differential_operator, t1, U0, Scheme) 
       U2 =   Cauchy_problem( Differential_operator, t2, U0, Scheme)    
       
       for i in range(N+1):  
            Error[i,:] = ( U2[2*i, :]- U1[i, :] )/( 1 - 1./2**order ) 
        
       Solution = U1 + Error 
       
       return Error, Solution 
             
       
def Temporal_convergence_rate( Time_Domain, Differential_operator,
                               U0, Scheme, m ): 
     
      log_E = zeros(m) 
      log_N = zeros(m)
      N = len(Time_Domain)-1
      t1 = Time_Domain
      U1 = Cauchy_problem( Differential_operator, t1, U0, Scheme) 
     

      for i in range(m): 
         N =  2 * N 
         t2 = array( zeros(N+1) )
         t2[0:N+1:2] =  t1; t2[1:N:2] = ( t1[1:int(N/2)+1]  + t1[0:int(N/2)] )/ 2 
         U2 = Cauchy_problem( Differential_operator, t2, U0, Scheme)           
        
         error = norm( U2[N, :] - U1[int(N/2), :] ) 
         log_E[i] = log10( error );  log_N[i] = log10( N )
         t1 = t2;  U1 = U2;   

     
      for j in range(m): 
         if abs(log_E[j]) > 12 :  break 
      j = min(j, m-1) 
      x = log_N[0:j+1];  y = log_E[0:j+1]
      A = vstack( [ x, ones(len(x)) ] ).T
      m, c = lstsq(A, y, rcond=None)[0]
      order = abs(m) 
      log_E = log_E - log10( 1 - 1./2**order) 

      return order, log_E, log_N

