from scope_example import         scope_public_private_example
from polymorphism import          polymorphism_example
from vectors_and_matrices import  dot_product_examples, matmul_examples, greatest_difference
from First_class_functions import function_examples
from map_filter_reduce import     test_map_filter_reduce
from functions import             derivative_example
from mapping import               mapping_example
from n_body_problem import        Integrate_NBP
from main_ODES import             Kepler_schemes
from Fourier import               Fourier_example
from fortran_from_py import       fortran_example


def menu_advanced_programming_techniques(): 
    
 option = 1     
 while option > 0 :  
   
     print( "\n Welcome to Advanced programming concepts" ) 
     
     print( " select an option " )
     print( " 0. exit/quit  " ) 
     print( " 1. main program, modules,scope, private and public " ) 
     print( " 2. Objects and polymorphism  " ) 
     print( " 3. Vectors and matrices  " ) 
     print( " 4. First class functions. Integrals and moments   ") 
     print( " 5. Functional programming: map, filter and reduce " )  
     print( " 6. Pointers and different views of data. N body problem " )  
     print( " 7. Fourier series examples    " ) 
     print( " 8. Wrappers: Fortran from Python  ")     

     option = int ( input() ) 
     print(" option =", option)
  
     if option == 1 : 
         scope_public_private_example() 
   
     elif option == 2:  
         polymorphism_example()
         
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

     elif option == 6: 
          Integrate_NBP() 

     elif option == 7: 
          Fourier_example() 

     elif option == 8: 
          fortran_example() 

     else: 
          print( " option not implemented" ) 
  

