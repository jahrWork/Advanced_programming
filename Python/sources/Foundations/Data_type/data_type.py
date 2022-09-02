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
  print("\n") #temp

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
  print( "x <= y is ",  x <= y, " and then -x >= -y is also", -x >= -y )
  print( "( ( x <= y ) and ( 1/x >= 1/y ) ) == True = ",
                 ( ( x <= y ) and ( 1/x >= 1/y ) ) == True ) 
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
  print(real(w)); print(imag(w))

  # real and imaginary parts using objects
  print(w.real); print(w.imag)


