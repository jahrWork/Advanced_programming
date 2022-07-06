
def Integral1D(a, b, f):

    N = 100
    h = (b-a)/N 
    
    S = 0
    for i in range(1, N+1):
        xi = a + h *i 
        S = S + h * f(xi)

    return S 

def Integral2D(a, b, c, d, f):

   def I1(x):
        
      def g(y):
         return f(x,y)

      return Integral1D(c, d, g)

   return Integral1D( a, b, I1 ) 

def Integral (*a):

    N = len(a)

    if N==3: 
         return Integral1D( *a )

    elif N==5:
         return Integral2D( *a )

    else: 
        print(" Integral with", N," arguments not implemented")
        return None 

def test_Integral(): 
 
  print( " Integral 1D = ", Integral(0., 1., lambda x : x ) )
  print( " Integral 2D = ", Integral(0., 1., 0., 1., lambda x, y : x+y ) )

