
# Prototype to integrate a Kepler orbit 
from  numpy import array, split, concatenate, append, zeros, reshape, linspace 
from numpy.linalg import    norm
import matplotlib.pyplot as plt
from Cauchy_problem import Cauchy_problem
from Temporal_schemes import Euler, Inverse_Euler, Crank_Nicolson, RK4
from Orbits import F_Kepler
from Temporal_error import Error_Cauchy_Problem, Temporal_convergence_rate
from decorators import debugging, profiling 


# Decorator to plot simulations 
def plot_simulation(Simulation): 

    def plot(*args,  **kwargs):

         U = Simulation(*args,  **kwargs)
         plt.plot(U[:,0], U[:,1] )
         plt.axis('equal')
         plt.grid()
         plt.show()

    return plot

# Decorators to plot, debug and profile at the same time
def plotting_with_decorators(): 

    @plot_simulation
    @debugging
    @profiling
    def Simulation(problem, method): 

       Cauchy_problem, scheme = method[0], method[1]
       F, t, U0  = problem[0], problem[1], problem[2] 

       U =  Cauchy_problem( F, t, U0, scheme )
       return U 

    Kepler = [ F_Kepler, linspace(0, 10, 5000), array([1, 0, 0, 1 ]) ] 
    method = [ Cauchy_problem, Euler ]
            
    Simulation( Kepler, [ Cauchy_problem, Euler ] ) 
    Simulation( Kepler, [ Cauchy_problem, Inverse_Euler ] )
    Simulation( Kepler, [ Cauchy_problem, Crank_Nicolson ] ) 
    Simulation( Kepler, [ Cauchy_problem, RK4 ] ) 



# Kepler orbit 
def Kepler_scipy(): 

 U0 = array( [1, 0, 0, 1] ) 
 t0 = 0.; tf = 10.; 

 t = linspace(t0, tf, 101)

 U = odeint(F_Kepler, U0, t) # it uses LSODA wrapper 

 V = solve_ivp(lambda t, y: F_Kepler(y, t),  [t0, tf] , U0, method="RK45", t_eval = t )

 plt.plot(U[:,0], U[:, 1])
 plt.plot( V.y[0], V.y[1] )
 plt.axis('equal')
 plt.grid()
 plt.show()

 def Kepler_Euler(): 

   U0 = array( [1, 0, 0, 1] ) 
   t0 = 0.; tf = 10.; 

   t = linspace(t0, tf, 101)
   U[0,:] = U0
   for n in range(N-1):
      U[n+1,:] = U[n, :] + ( t[n+1] - t[n] )  * F_Kepler( U[n,:], t[n] )


   plt.plot(U[:,0], U[:, 1])
   plt.axis('equal')
   plt.grid()
   plt.show()


def Kepler_orbit(scheme): 

 N = 5000
 t = linspace(0, 10, N) 
 U0 = array( [1, 0, 0, 1 ] )

 print("Kepler orbit ") 
 U = Cauchy_problem( F_Kepler, t, U0, scheme )

 plt.plot(U[:,0], U[:,1] )
 plt.axis('equal')
 plt.grid()
 plt.show()


def Kepler_schemes(): 


    Kepler_orbit(Euler)
    Kepler_orbit(Inverse_Euler)
    Kepler_orbit(Crank_Nicolson)
    Kepler_orbit(RK4)



def Test_Error_Cauchy_Problem(): 

 N = 5000
 t = linspace(0, 10, N) 
 U0 = array( [1, 0, 0, 1 ] )
 order = 1 

 print("Error Kepler orbit ") 
 Error, U = Error_Cauchy_Problem( t, F_Kepler,  Euler, order, U0 )

 plt.plot(t, Error[:,0] )
 plt.axis('equal')
 plt.grid()
 plt.show()


def Test_Temporal_convergence_rate():

 
   N = 2000
   t = linspace(0, 10, N) 
   U0 = array( [1, 0, 0, 1 ] )
   m = 5

   print("Order Euler ") 
   order, log_e, log_n = Temporal_convergence_rate( t, F_Kepler, U0, Euler, m )

   print( "order =", order)
   plt.plot(log_n, log_e )
   plt.axis('equal')
   plt.grid()
   plt.show()



if __name__ == '__main__':  

    plotting_with_decorators()
    exit()
    #Kepler_schemes()
    #Test_Error_Cauchy_Problem()
    Test_Temporal_convergence_rate()