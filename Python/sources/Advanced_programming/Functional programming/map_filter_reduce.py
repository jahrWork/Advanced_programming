
from numpy import array, max, zeros, cos, sin, matmul, pi 
import matplotlib.pyplot as plt

def str_to_number(str):

    return int(str)
   
def my_filter(a):

    return a > 200

def g(x):

    return x**2


def test_map_filter_reduce(): 

    print( " map, filter and reduce " ) 
    sp = array( ["123", "111", "444", "555"] ) 
    m = array( [1, 2, 3, 4] )
#   MAP 
    m =  array( list( map(str_to_number, sp) ) ) 
    #m[:] = str_to_number( sp[:] ) # it does not work 
    #N = len( sp )
    #for i in range(N) : 
    #    m[i] = str_to_number( sp[i] )
    m = g( m ) # it works with functions 
   

#   FILTER
    f =  array( list( filter(my_filter, m) ) ) 
    f = f [ f > 200 ] # similar filter 

#   REDUCE 
    r =  max(m) 
    print(" array of strings = ", sp)
    print(" MAP: array of numbers = ", m)
    print(" FILTER: filtered array = ", f)
    print(" REDUCE: max value = ", r)



def Rotation(P, theta): 
      
      A = array( zeros([2,2]) )

      A[0,:] = [ cos(theta), -sin(theta) ] 
      A[1,:] = [ sin(theta),  cos(theta) ] 
      
      return matmul(A, P) 
    


def test_rotation(): 

     image = array([array([1., 1.]),array([-1., 1.]),array([-1., -1.]), \
             array([1., -1.]),array([1., 1.])  ])

     imageR = array( list( map(lambda P:Rotation(P, pi/4), image) ) ) 
     
     plt.plot( image[:,0], image[:,1] )
     plt.plot( imageR[:,0], imageR[:,1] )
     plt.show()
   

if __name__ == '__main__':  
   test_map_filter_reduce()
   test_rotation()