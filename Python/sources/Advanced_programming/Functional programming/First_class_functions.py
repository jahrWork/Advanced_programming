from numpy import array 
    
def function_examples():  
       
    # Integral of f(x) from a to b 
      R = Integral(h, 0., 1.) 
      print("\n  Integral of h(x) from 0 to 1  =", R )
    
    # Integral of x**n f(x) from a to b based on Integral 
      R = Moment(h, 3, 0., 1.) 
      print(" \n Integral of x**3 * h(x) from 0 to 1  =", R )  

    # Integral of x**n f(x) from a to b with lambda function 
      R = Moment2(h, 3, 0., 1.) 
      print(" \n Integral of x**3 * h(x) with lambda f  =", R )  
    
def Integral(f, a, b):  

      N = 100  
      dx = (b-a)/N; 
      x = array( [ a + dx*i for i in range(N+1) ] ) 
      return dx * sum( f(x) ) 
    
def  Moment(f, n, a, b):  

    def g(x): 
        return x**n * f(x) 

    return Integral( g, a, b)  

def  Moment2(f, n, a, b):  

    return Integral( lambda x: x**n *f(x), a, b)
    
def   h(x): 
   
    return x**2 + x + 1 
