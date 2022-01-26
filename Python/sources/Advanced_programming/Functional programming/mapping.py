from numpy import array, matmul


def f(x): 
    return x**2 

def g(x,n): 
    return x**n 

class tensor(): 
    def __init__(self, L):
        self.x = L 

def square(A):
    B = tensor(A)
    B.x =  matmul( A.x, A.x ) 
    return B 

def mapping_example(): 

# mapping with lists 
  x = [ 1, 2, 3, 4 ]

  y1 = list( map(f, x) ) 
  

  y2 = list( map( lambda x : g(x, 2), x ) ) 

  print("y1=", y1) 
  print("y2=", y2) 

# mapping with arrays 
  x = array( [ 1, 2, 3, 4] )
  y = f ( x )
  print("y=", y) 

# mappings with tensors 
  A  = tensor( array([ [ 1, 2], [3,4] ]) )
  print("A=",A.x) 

  B = square(A)
  print(" A*A =", B.x[1,:] )  
  
# mapping of tensors elementwise operation  
  C = array( [ A, A, A] )
  print(" C =", C[2].x[1,:] ) 
  #D = square(C) ! it does not work 
  D = array( list( map(square, C)) ) 
  print( "A*A=", D[2].x[1, :] ) 

  A  = array([ [ 1, 2], [3,4] ])
  C = array( [A,A,A] )
  D = matmul( C, C ) 
  print( "C*C=", D[2, 1, :] ) 






