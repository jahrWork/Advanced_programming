from numpy import array, reshape 

def print_pointers(text, a, pa):

  print(text)
  print(" type(a) = ", type(a), " type(pa) =", type(pa))
  print(" id(a)= ", id(a), " id(pa) =", id(pa) ) 
  print(" a = ", a, " pa = ", pa, "\n") 

def print_numpy_pointers(text, a, pa): 

  print(text)
  print(" type(a) = ", type(a), " type(pa) =", type(pa))
  print( " pointer a =", a.ctypes.data, " pointer pa =", pa.ctypes.data )
  print( " a = ", a, " pa= ", pa, "\n")


def pointer_examples(): 

 a = 3 
 pa = a 
 print_pointers(" Scalar and pointers a=3, pa=a ", a, pa) 
 a = 4 
 print_pointers(" Scalar and pointers a=4 ", a, pa) 

 a = array( [ 1, 2, 3, 4 ])
 pa = a # b points to a   
 a[0] = 2 
 print_pointers(" Vectors and pointers a = array() pa = a", a, pa)
 
 a[:] = a[:] + 1 
 print_pointers(" a[:] = a[:] + 1", a, pa) 
 a = a + 1 # it does not work as expected 
 print_pointers(" a = a + 1", a, pa) 

 pa = reshape( a, (2,2) ) # pa points to a 
 print_numpy_pointers(" Arrays of different ranks  ", a, pa) 
 a[:] = a[:] + 1 
 pa[0,0] = 1  
 print_numpy_pointers(" a[:] = a[:] + 1 ", a, pa)


def aliasing_and_cloning_examples(): 

    a = {1, 2, 3}     # sets
    pa = a 
    pa.add(4)
    print_pointers(" Sets, alias pa = a", a, pa)
    pa = a.copy()
    pa.remove(4)
    print_pointers(" Sets, cloning pa = a.copy() ", a, pa)    
    
    a = (1, 2, 3)     # tuples
    pa = a  
    print_pointers("Tuples: alias pa = a", a, pa) 
    del(a) 
    
    a = [1,2,3]       # lists
    pa = a
    print_pointers(" Lists, alias pa = a", a, pa)
    pa = a[:] 
    pa[0] = 0 
    print_pointers(" Lists, cloning pa = a[:]", a, pa)
      
    a = {1:1,2:2,3:3} # dictionaries
    pa = a 
    pa[1] = 0 
    print_pointers("Dictionaries, alias pa = a", a, pa)
    pa = dict(a) 
    pa[1] = -1 
    print_pointers("Dictionaries, cloning  pa = dict(a)", a, pa)
    
  
   
if __name__ == "__main__":

    pointer_examples()
    aliasing_and_cloning_examples()