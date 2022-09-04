from numpy import array, zeros, conjugate, real, imag, sqrt, exp, pi
from re import split

def data_types(): 

  integer = 1 
  real = 1.8 
  complex = 1 + 1j
  bool = True
  string = "data types"


def arrays():

    N = 10 
  
    V = array( [  1./i**2 for i in range(1, N+1) ] )
    W = array( [ (-1)**(i+1)/(2*i+1.) for i in range(1, N+1) ] ) 
    A = array( [ [ (i/float(N))**(j-1) for j in range(1,N+1) ] for i in range(1, N+1) ] )
    X = array( [ 1.3, 2.4, 3., 4.5, 5.3, 7. ] )  
    Y = A[1,2:5]
    Z = array( [ [ 1.1, 2.2, 3.3 ], [ 4., 5.6, 6.2 ] ] )

    #Slices
    C = zeros((5,4))
    C[:,1] = X[0:5]
    C[1:3,2:4] = [ [1.,2.], [3.,4.] ] # enter by rows!

def structures():

    # Set
    P = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47}

    # List, sequence
    print( "Sum sqrt(n/(n**4+1)) = ", sum( [sqrt(n/(n**4+1)) for n in range(10000+1)] ) )

    # Set of tuples
    print( { (i**2 - 1, 2*i, i**2 + 1) for i in range(2,10) } )

    # Dictionary
    D = { "set":{1,3}, "list":[1,3], "tuple":(1,3), "dict":{"one":1,"three":3} }



def data_structures():

  sets = "unordered set with distinct elements" 
  S = {"car", 5, 6.7, 1 + 1j} 
   
  print("\n type=", type(S)) 
  for s in S:    # print order is unpredictable
     print(" element =", s)

  lists = "ordered set allowing equal elements" 
  S = ["one", 5, 3.5, 5] 
   
  S[3] = 8
  print("\n type=", type(S))   
  for i in range(len(S)):    # lists are ordered 
     print(" element =", S[i]) 
     
  tuples ="inmutable ordered set" 
  S = ("one", 5, 3.5, 5)  
  
  print("\n type=", type(S))
  for i in range(len(S)):     # tuples are inmutable 
     print(" element =", S[i])   
  print("\n") 
  
  for i, s in enumerate(S):
      print(" index =", i, " element =", s)   
  print("\n")

  dictionaries = "ordered data values in key:value pairs"
  D = {"set":sets, "list":lists, "tuple":tuples, "dict":dictionaries} 
  
  for k in D:     # mutable and do not allow duplicates
     print("{:6} {} {}".format(k, ":", D[k]) )
  print("\n")

  for k in D.keys():     
     print("{:6} {} {}".format(k, ":", D[k]) )
  print("\n")

  for v in D.values():  
     print("{}".format(v) )
  print("\n")

  ite = iter( ("one", 5, 3.5, 5) )
  print( next(ite) )
  print( next(ite) ) #returns StopIteration when no more elements. 


def Operators(): 

  x = 2.; y = 7.
  P = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29}
  E = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30}
  e = exp(1.)
  a = 2
     
  print( "e^(i pi) + 1 = ", e**(1j*pi) + 1 )
  print( "x <= y and then -x >= -y",  x <= y and -x >= -y )
  print( "(1 in P) and (5 in P) = ", (1 in P) and (5 in P) )
  print( not(a in P or a in E), "implies", not(a in P) and not(a in E) )



def input_Complex():
  
  # read real and imaginary parts using function split()
  x, y = [float(i) for i  in split( "\s", input("Enter x, y: ") ) ] 
  print("Values x, y: ", x, y) 
  z = complex(x, y)

  # read real and imaginary parts using objects and .split() method
  x, y =  input("Enter x, y: ").split()
  x, y = [float(x), float(y)]  
  z = complex(x, y)
  
  w = sqrt(z); print("sqrt(z) = ", w)

  # real and imaginary parts using functions
  # print(real(w)); print(imag(w))

  # real and imaginary parts using objects
  # print(w.real); print(w.imag)



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
  