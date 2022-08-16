from numpy import identity, random, array

    
#***********************************************************
#* First Example of Stack Overflow: large autoamtic arrays
#************************************************************  
def StackOverflow_LargeArrays():  

    n = 400

    R = StackOverflow_size( n )
  

def StackOverflow_size( n ):  

    R = array( zeros( [n,n,n] ) ) 
    
    return R




#********************************************************
# Second Example of Stack Overflow: infinite recursion
#********************************************************
def StackOverflow_InfiniteRecursion():  

    k = 3
    wrong_power(random.rand(100,100), k)
    

def wrong_power(A, k):    
  
    N = shape(A)[0] 
    
    #End condition incorrectly implemented
    if k >= 10: 
             return identity(N)
    else:                
             return matmul( wrong_power(A,k-1), A )      


