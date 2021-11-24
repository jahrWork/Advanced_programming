from scipy.optimize import newton

def Euler( U, dt, t, F): 

   return U + dt * F( U, t ) 

def RK4( U, dt, t, F): 

     k1 = F( U, t)
     k2 = F( U + dt * k1/2, t + dt/2 )
     k3 = F( U + dt * k2/2, t + dt/2 )
     k4 = F( U + dt * k3,   t + dt   )
 
     return U + dt * ( k1 + 2*k2 + 2*k3 + k4 )/6

def Inverse_Euler( U, dt, t, F): 

   def  Residual_IE(X):  

          return  X - U - dt * F(X, dt + t) 

   return  newton( Residual_IE, U )
    

def Crank_Nicolson(U, dt, t, F ): 

    def Residual_CN(X): 
         
         return  X - a - dt/2 *  F(X, t + dt)

    a = U  +  dt/2 * F( U, t)  
    return newton( Residual_CN, U )
      
