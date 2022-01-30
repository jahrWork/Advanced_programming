from numpy import array, dot, matmul, max, tril   


def dot_product_examples(): 

   a = array( [1, 2, 3, 4] ) 
   b = array( [5, 6, 7, 8] ) 
 
   S = dot(a,b) 
   print( " dot product = ", S) 
   
#  von Neumann program (imperative) 
   N = len(a) 
   S = 0 
   for i in range(len(a)):  
       S = S + a[i]*b[i] 
   print(" von Neumann dot product = ", S) 
   
#  functional program (declarative)
   S = sum( a * b ) 
   print(" functional program, dot product = ", S)  
   print("  ")  

 
def matmul_examples(): 

   N = 2
   A = array( [ [ i+1 for i in range(N) ] for j in range(N) ] ) 
   B = array( [ [ i+2 for i in range(N) ] for j in range(N) ] ) 
  
   print(" A = \n", A) 
   print(" B = \n", B) 
  
   C = matmul( A, B ) 
   print(" matmul C = A B  = \n", C) 
   
   
#  von Neumann program 
   N = len(A[:,1]) 
   for i in range(N):  
       for j in range(N):  
           S = 0
           for k in range(N):  
              S = S + A[i,k] * B[k,j] 
           C[i, j] = S
   print(" von Neumann mal mul = \n", C) 
   
# functional program 
   C = array( [ [ dot( A[i,:], B[:,j] ) for j in range(N) ] for i in range(N) ] ) 
   print( " functional program, mat mul = \n ", C)


def greatest_difference():  

   
    x = array( [7, 1 , 5, 4] ) 
    N = 4 
      
  # algorithm  O(N**2) 
    D =  array ( [ [  x[i]-x[j] for j in range(N) ] for i in range(N) ] ) 
 
    print("D =",   D  )
    print("max =",  max( tril( D ) ) )
  
#   algorithm O(N) 
    x_min = array( [ min(x[0:i+1])for i in range(N) ]  ) 
    print(  " max = ", max( x - x_min ) ) 
    
#   imperative programming 
    xmin = x[0] 
    e = -1 
    for i in range(0,N): 
        if x[i]-xmin > e: e = x[i] - xmin  
        if x[i] < xmin:   xmin = x[i] 
    print(" max = ", e) 


if __name__ == '__main__':  
    greatest_difference()