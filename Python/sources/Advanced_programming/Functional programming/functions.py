def p(x): 
    return x**2

def q(x): 
    return x**3

def derivative(f): 

    def df(x): 
        h = 1e-3 
        return ( f(x+h) - f(x) )/h 
    return df 

def derivative_example():

   f1 = derivative(p)
   f2 = derivative(q)

   print("\n PY f1(2) =", f1(2.) )
   print("\n PY f2(2) =", f2(2.) )

