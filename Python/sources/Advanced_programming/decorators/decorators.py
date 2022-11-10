from math import sqrt
import tracemalloc
from time import perf_counter 



def simple_decorator(f):

    def wrapped_function(x):
        print("Function " + f.__name__ + ", input x=", x)
        r = f(x)
        print("Function " + f.__name__ + ", output=", r )
        return r 

    return wrapped_function


# Decorator to debug any number of arguments 
def debugging(f):

    def debug_f(*args, **kwargs):

        print("Input arguments of function: " + f.__name__)
        for i in range(len(args)):
            print(" i ", i, "value =", args[i], "  ")
        for key, value in kwargs.items():
            print(key, "=", value, " ")

        r = f(*args, **kwargs)

        print("Return type:", type(r), "value=", r )
        return r 
        
    return debug_f


# Decorator to measure CPU time and consumed memory 
def profiling(f):

    def profile_f(*args, **kwargs):

        tracemalloc.start()
        start_time = perf_counter()
        r = f(*args, **kwargs)
        current, peak = tracemalloc.get_traced_memory()
        finish_time = perf_counter()
        print("_"*60)
        print("Function: " + f.__name__)
        print("Memory usage: ", current/10**6, "MB") 
        print("Peak memory usage: ", peak/10**6, "MB") 
        print("Time elapsed = ", finish_time - start_time, "seconds")
        print("_"*60)
        tracemalloc.stop()
        return r 

    return profile_f 

# Decorator to treat exceptions 
def exceptions(f):

    def exception_treatment(*args, **kwargs):

        try:
            return f(*args, **kwargs)

        except: 
            print("Exception occurred: " + f.__name__ )
            return None

    return exception_treatment 


def decorator_example(): 

    def f(x): 
      return x**2

    print( "f(x) =", f(3))

    @simple_decorator 
    def fd(x): 
      return x**2

    print( "decorated fd(x) =", fd(3), "\n")

    g = simple_decorator(f)
    print( "decorated f(x) =", g(4))
   

    @debugging
    @profiling
    @exceptions
    def f(x, y): 
      z = x**2 + y
      return z 

    print( "arg f = ", f( 1, 5 ), "\n", "*"*50 ) 
    print( "key-value f = ", f( y=13, x=55 ), "\n", "*"*50 ) 
    print( "exception f = ", f( "2", 5 ) ) 



if __name__ == "__main__":

    decorator_example()
