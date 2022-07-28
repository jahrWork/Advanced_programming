#Monads use: 
# 1) make function composition easier 
# 2) avoid repeating 
# 3) pipelining 
# 4) to reduce glue code between function invocations

       
def f1(x): return (2*x, str(x) + "*2")
def f2(x): return (3*x, str(x) + "*3")
def f3(x): return (x/2, str(x) + "/2") 
def f4(x): return (x/3, str(x) + "/3")


  
# Monad:  design pattern with two functions (unit and bind). 
# the bind function implements the glue code 
# the  unit implements the initialisation code
def unit(x):
    return (x, "Operations logging: ")

def bind(t, f):
    res = f(t[0])
    return (res[0], t[1] + res[1] + "; ")

def pipeline(e, *functions):
    for f in functions:
        e = bind(e, f)
    return e


if __name__ == "__main__":

# imperative programming 
 log = "Operations logging:"
 x = 2

 (res, log1) = f1(x)
 log += log1 + ";"

 (res, log2) = f2(res)
 log += log2 + ";"

 (res, log3) = f3(res)
 log += log3 + ";"

 (res, log4) = f4(res)
 log += log4 + ";"

 print("Imperative way")
 print(res, log)

 # monadic or functional programming 
 print("\n Monadic way")
 print( bind( bind(bind(bind(unit(x), f1), f2), f3), f4) )

# monadic or functional programming 
 print("\n Monadic way with pipelining")
 print( pipeline(unit(x), f1, f2, f3, f4) )

