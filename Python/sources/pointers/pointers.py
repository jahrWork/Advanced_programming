from numpy import array, reshape 

def test_pointer(): 
 print(" Scalar and pointers ") 
 a = 3 
 pa = a 
 print(" a is pa = ", a is pa) 
 a = 4 
 print(" a is pa = ", a is pa) 
 print(" pa = ", pa) 

 print(" Vectors and pointers ") 
 a = array( [ 1, 2, 3 ])
 b = a # b points to a   
 a[0] = 2 
 print( " a = ", a)
 print( " b = ", b)

 a[:] = a[:] + 1 
 print( " a = ", a)
 print( " b = ", b)

 print(" a is b = ", a is b) 
 a = a + 1 # it does not work as expected 
 print(" a is b = ", a is b) 
 print( " a = ", a)
 print( " b = ", b)

 print(" Arrays of different ranks  ") 
 a = complex( 1, 1)
 U = array( [ 1, 2, 3, 4 ], dtype = type(a) )
 pU = reshape( U, (2,2) ) 
 U[:] = 0  # U = 0 creates another instance 
 print( " pU = ", pU)
 pU[0,0] = 1 
 print( " U = ", U)
 print(" pU is U = ", U is pU) 

if __name__ == '__main__':  
    test_pointer()


