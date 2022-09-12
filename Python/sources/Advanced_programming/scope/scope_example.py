  
from modB import functionB 

x = 444

def scope_public_private_example():  
 
     y = 333  
     
     print(" Example of global and local variables")
     print("")
     print("________________")
     print( " y is a local variable specified in a function" )
     print( " y = ", y) 
     
     print( "________________")
     print( " x is a global variable specified in a module" )
     print( " x = ", x )
     print( "________________" )
     
     print(" ")
     print( " Example of public functions")
     print( " FunctionB is public in module B")
     print( " FunctionB value =  ", functionB() ) 
     print( " " ) 
     print( " FunctionB uses moduleA which has a public FunctionA  " )
     print( " Inside modA and modB are different variables named x and y " )
     print( "________________") 
      


