
from Hello_world import Hello_world
from roots import Roots_2th
from Sum_series import Summation_n2_examples, Summation_examples, Summation_functional_examples 
from Matrix_operations import Matrix_operation_examples
from Dynamic_allocation import Matrices_allocation
from Integrals_derivatives import Integral_and_derivative_examples
from Series_expansion import Taylor_expansion_examples
from Read_files import Test_load_matrix
 
 
  
  
def menu_Foundations(): 

 option = 1     
 while option>0: 
    
     
     print( "\n Welcome to basic programming concepts") 
     
     print( " select an option " )
     print( " 0. exit/quit  " ) 
     print( " 1. Hello world" )  
     print( " 2. Roots of second grade equation" )  
     print( " 3. Sum of series ") 
     print( " 4. Vectors and matrices ") 
     print( " 5. Memory allocation ") 
     print( " 6. Integrals and derivatives ") 
     print( " 7. Taylor expansion ") 
     print( " 8. Read/write data from external files ") 

    
     option = int (input("\n Select an option = ") )  
     print("\n")
     
     if option==1: 
           Hello_world()
          
     elif option == 2: 
           Roots_2th()
         
     elif option == 3: 
        Summation_n2_examples()
        Summation_examples()
        Summation_functional_examples()
         
     elif option == 4:      
        Matrix_operation_examples() 
     
     elif option == 5: 
        Matrices_allocation()
         
     elif option == 6: 
        Integral_and_derivative_examples()
         
     elif option ==  7: 
         Taylor_expansion_examples()
         
     elif option ==  8:
        Test_load_matrix()
    
     elif option> 0: 
           print( " option not implemented" )


if __name__ == "__main__":

    menu_Foundations()

