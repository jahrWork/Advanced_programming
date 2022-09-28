from numpy import array, zeros, conjugate, real, imag, sqrt, exp, pi
from re import split


def data_types(): 

  integer = 1 
  real = 1.8 
  complex = 1 + 1j
  bool = True
  string = "data types"


def Operators(): 

  x = 2.; y = 7.
  e = exp(1.)
     
  print( "e^(i pi) + 1 = ", e**(1j*pi) + 1 )
  print( "x <= y and -x >= -y is ",  x <= y and -x >= -y )
  print( "(abc+def) < abcdeg = ", ("abc"+"def") < "abcdeg" )


def Flow_structures():

  f = 1; n = 6
     
  # for loop
  for i in range(n,1,-1): # ranges between n and 2 jumping backwards (-1)
    f = f*i
     
  print( "The factorial of n = ", n, "is n! = ", f )
     
  # while loop
  x1 = 3.; x0 = 0.
  while abs(x1-x0) > 1e-5:
      x0 = x1
      x1 = x0 - (3*x0**3 - x0**2)/(9*x0**2 - 2*x0)
     
  print( "One root of 3x^3 - x^2 is at x = ", x1 )

  # if - else conditional
  x = -75.2
  if x >= 0:
    abso = x
  else:
    abso = -x
     
  print( "The absolute value of x = ", x, "is ", abso )

  # if - elif - else conditional
  a = 43; b = 34
  print( "a = ", b, "b = ", b )
  if a > b:
      print( "a is greater than b" )
  elif (a < b):
      print( "a is less than b" )
  elif (a == b):
      print( "a is equal to b" )   
  else:
      print( "Error: not valid comparison" )



def structures():

    # Set
    X = {1, 2, 3}
    Y = {1, 2, 3, 4}

    print( "X union Y:", X | Y )
    print( "X intersection Y:", X & Y ) 
    print( "3 in X =", 3 in X )
    print( "6 not in X =", 6 not in X )
    print( "X strict subset Y =", X < Y ) 
    print( "X strict superset Y =", X > Y ) 
    print( "X subset Y =", X <= Y ) 
    print( "X superset Y =", X >= Y )
    X.add(0)
    print( "add 0 to X =", X )
    X.remove(0)
    print( "remove 0 from X =", X )

    # List, Tuple
    X = [1, 2, 3]
    Y = [4, 5]

    print( "X cocatenate Y:", X + Y )
    print( "3 in X =", 3 in X)
    print( "3 not in Y =", 3 not in Y)
    X.append(0)
    print( "add 0 to X =", X )
    X.remove(0)
    print( "remove 0 from X =", X )

    X = (1, 2, 3)
    Y = (4, 5)

    print( "X cocatenate Y:", X + Y )
    print( "3 in X =", 3 in X )
    print( "4 not in Y =", 4 not in Y ) #false

    # Range
    X = range(6, 14, 2)
    print( "14 in X =", 14 in X )   #Stops in 12!

    # Array
    V = array( [1, 2, 3] )
    print( V )

    # Dictionary
    D = {"a":[1, 2], "b":[3]}
    F = {"b":[3], "a":[1, 2]}
    print( "D equals F =", D == F )
    print( "a in D =", "a" in D )
    print( "a not in F =", "a" not in F )

    




def iterators():

    S = {"car", 4.5, 3, 1+1j}
    for s in S:    # Iterates in the element
        print( "Element =", s )

    L = [1, 2, 3, 4]  
    for i in range(len(L)):    # Iterates in the index 
        print( "Element =", L[i] )
    
    T = (1, 2, 3, 4)
    for i, t in enumerate(T):  # Iterates in both: index and element 
      print( "Index =", i, "Element =", t )  
      
    D = {"a":[1, 2], "b":[3]}
    for k in D.keys():      # Iterates in the keys of a dictionary 
        print( "{:2} {} {}".format(k, ":", D[k]) )

    for v in D.values():  
        print( "{}".format(v) )  # Iterates in the values of a dict 

    Pyt = { (i**2 - 1, 2*i, i**2 + 1) for i in range(2,10) }
    print( Pyt )

    print( L[2] )  # Third element, index starts in 0
    print( T[2] )
    print( D["a"] )  # Element with key "a"



def input_Complex():
  
  # read real and imaginary parts using function split()
  x, y = [float(i) for i  in split( "\s", input("Enter real and imaginary part x, y: ") ) ] 
  print("Values x, y: ", x, y) 
  z = complex(x, y)

  # read real and imaginary parts using objects and .split() method
  x, y =  input("Enter real and imaginary part x, y: ").split()
  x, y = [float(x), float(y)]  
  z = complex(x, y)
  
  w = sqrt(z); print("sqrt(z) = ", w)

  # real and imaginary parts using functions
  # print(real(w)); print(imag(w))

  # real and imaginary parts using objects
  # print(w.real); print(w.imag)



    
  