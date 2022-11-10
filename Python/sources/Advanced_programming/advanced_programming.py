from scope_example import         scope_public_private_example
from polymorphism import          polymorphism_example
from polymorphic_odes import      complex_ODES
from vectors_and_matrices import  dot_product_examples, matmul_examples, greatest_difference
from First_class_functions import function_examples
from map_filter_reduce import     test_map_filter_reduce, test_rotation, test_filter_reduce
from functions import             derivative_example
from mapping import               mapping_example
from n_body_problem import        Integrate_NBP
from pointers import              pointer_examples 
from main_ODES import             Kepler_schemes
from Fourier import               Fourier_example
from fortran_from_py import       fortran_example
from decorators import            decorator_example
from main_ODES  import            plotting_with_decorators 


def menu_advanced_programming(): 
    
     
 while True :  
   
     print( "\n Welcome to Advanced programming concepts" ) 
     
     print( " select an option " )
     print( " 0. exit/quit  " ) 
     print( " 1. Scope, private and public " )  
     print( " 2. Objects and polymorphism  " ) 
     print( " 3. Vector operations  " ) 
     print( " 4. Function examples" )  
     print( " 5. Functional programming: map, filter, reduce" ) 
     print( " 6. Pointers and different views of data. N body problem " )  
     print( " 7. Wrappers") 
     print( " 8. calling Fortran from Python  ")    
     option = int (input("\n Select an option = ") )  
       
     if option==0:
          break

     elif option == 1 : 
         scope_public_private_example() 
         #scope_id_example()
         exec(open("./sources/Advanced_programming/scope/scope_id_example.py").read())
   
     elif option == 2:  
         polymorphism_example()
         complex_ODES()
         
     elif option == 3: 
         dot_product_examples()
         matmul_examples()
         greatest_difference()

     elif option == 4:  
         function_examples()
         derivative_example()

     elif option == 5:  
         test_map_filter_reduce()
         mapping_example()
         test_rotation()
         test_filter_reduce()

     elif option == 6: 
          pointer_examples() 
          Integrate_NBP() 

     elif option == 7: 
          decorator_example()
          plotting_with_decorators()

     elif option == 8: 
          fortran_example() 

     else: 
          print( " option not implemented" ) 
  

if __name__ == "__main__":

    menu_advanced_programming_techniques()
