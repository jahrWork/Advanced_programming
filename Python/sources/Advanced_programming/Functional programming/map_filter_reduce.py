
from numpy import array, max, zeros, cos, sin, matmul, pi, argmin, float64
from numpy.linalg import norm  
import random
import matplotlib.pyplot as plt

def str_to_number(str):

    return int(str)
   
def my_filter(a):

    return a > 200

def g(x):

    return x**2


def test_map_filter_reduce(): 

    print( " map, filter and reduce " ) 
    sp = ["123", "111", "444", "555"]  
#   MAP 
    m =  list( map(str_to_number, sp) )

#   FILTER
    f = list( filter(my_filter, m) )  

#   REDUCE 
    r =  max(m) 
    print(" array of strings = ", sp)
    print(" MAP: array of numbers = ", m)
    print(" FILTER: filtered array = ", f)
    print(" REDUCE: max value = ", r)



def Rotation(P, theta): 
      
      A = zeros((2,2), dtype=float64)  

      A[0,:] = [ cos(theta), -sin(theta) ] 
      A[1,:] = [ sin(theta),  cos(theta) ] 
      
      return matmul(A, P) 
    
def distance(P, P0):
    
   return norm( P - P0 )
     

def test_rotation(): 

     image = array([array([1., 1.]),array([-1., 1.]),array([-1., -1.]), \
             array([1., -1.]),array([1., 1.])  ])

     imageR = array( list( map(lambda P:Rotation(P, pi/4), image) ) ) 
     
     plt.plot( image[:,0], image[:,1] )
     plt.plot( imageR[:,0], imageR[:,1] )
     plt.show()
 
def filter_d(P, R1, R2):
      
        d = norm( P )
        return   d < R2 and d > R1  
     

def test_filter_reduce():  

     N = 10000
    
     set = zeros( (N, 2), dtype=float64)
     random.seed(1)

     for i in range(N):  
         r = [ random.uniform(-1, 1), random.uniform(-1, 1)]
         set[i,:] = r 
          
     subset = array(list( filter( lambda x: filter_d(x, 0.4, 0.7), set)))
     
     P0 = array( [0.5, 0.5] )
    
     v = array(list( map( lambda x: distance(x, P0), set) ))  
     i = v.argmin()
     P1 = set[i] 
     print( "Nearest point P =", P1 ) 
     
     plt.plot( set[:,0], set[:,1], ".")
     plt.plot( subset[:,0], subset[:,1], ".")
     plt.show() 
 

if __name__ == '__main__':  
   test_map_filter_reduce()
   #exit()
   test_rotation()
   test_filter_reduce() 