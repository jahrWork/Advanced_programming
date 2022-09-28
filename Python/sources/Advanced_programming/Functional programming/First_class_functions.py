from math import sqrt   

def function_examples():  

      print( "First class functions. Integrals and moments   ") 
     
    # Integral of f(x) from a to b 
      R = Integral(h, 0., 1.) 
      print("\n Integral of h(x) from 0 to 1  =", R )
    
    # Integral of x**n f(x) from a to b based on Integral 
      R = Moment(h, 3, 0., 1.) 
      print(" \n Integral of x**3 * h(x) from 0 to 1  =", R )  

    # Integral of x**n f(x) from a to b with lambda function 
      R = Moment2(h, 3, 0., 1.) 
      print(" \n Integral of x**3 * h(x) with lambda f  =", R )  
    
def Integral(f, a, b):  

      N = 100  
      dx = (b-a)/N
      S = 0
      for i in range(1, N+1):
          xi = a + dx * i 
          S = S + dx * f(xi)
          
      return S
    
def Moment(f, n, a, b):  

    def g(x): 
        return x**n * f(x) 

    return Integral( g, a, b)  

def  Moment2(f, n, a, b):  

    return Integral( lambda x: x**n *f(x), a, b)
    
def h(x): 
   
    return x**2 + x + 1 

def compose(f, g): 

     def h(x): 
          return f( g(x) )

     return h

h = compose(lambda x: x**2, lambda x:sqrt(x) ) 

def Fibonacci_numbers():

    def Fibonacci(n): 
        
         if n==0:
                 Fibonacci = 1 
                  
         elif n==1:
                 Fibonacci = 1 
         else:
                 Fibonacci = Fibonacci(n-1) + Fibonacci(n-2) 

    for i in range(3, 11):  
       print("Fibomacci numbers =", i, Fibonacci(i)) 