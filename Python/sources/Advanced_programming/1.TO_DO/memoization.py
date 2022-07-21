#  recursive Fibonacci more efficient by means of memoization
# dictionary to store Fibonacci numbers
F = {}  

def Fibonacci(n):

    if n <= 2:
        return 1

    if n in F.keys():
        return F[n]

    F[n] = Fibonacci(n-1) + Fibonacci(n-2)
    return F[n]



if __name__ == "__main__":

  print( " Fibonacci(10) = ",  Fibonacci(10) )
  print( " type F = ", type(F) )
  print( " F = ", F )

  G = {}
  H = {1, 2, 3 } 
  print( " dictionary  G = ", type(G) )
  print( " set H = ", type(H) )

