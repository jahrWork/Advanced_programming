
from Hello_world import Hello_world
from data_type import data_types, iterators, Operators, input_Complex, structures, Flow_structures
from roots import Roots_2th
from Sum_series import Summation_n2_examples, Summation_examples, Summation_functional_examples 
from Matrix_operations import Matrix_operation_examples, basic_arrays
from Stack_Overflow import StackOverflow_LargeArrays, StackOverflow_InfiniteRecursion
from Dynamic_allocation import Matrices_allocation
from Integrals_derivatives import Integral_and_derivative_examples
from Series_expansion import Taylor_expansion_examples
from Fourier import Fourier_example
from Read_files import Test_load_matrix
   
def menu_Foundations(): 

    
 while True: 
     
     print( "\n Welcome to basic programming concepts") 
     print( " 0. exit/quit  " ) 
     print( " 1. Hello world" )  
     print( " 2. Data types and basic operations" )  
     print( " 3. Sum of series ") 
     print( " 4. Vectors and matrices ") 
     print( " 5. Memory allocation ") 
     print( " 6. Integrals and derivatives ") 
     print( " 7. Taylor and Fourier expansions ") 
     print( " 8. Read/write data from external files ") 
     option = int (input("\n Select an option = ") )  
     
     if option==0:
          break

     elif option==1: 
           Hello_world()
          
     elif option == 2: 
           data_types(); Operators(); Flow_structures();
           structures(); iterators()
           Roots_2th(); input_Complex();
         
     elif option == 3: 
        Summation_n2_examples()
        Summation_examples()
        Summation_functional_examples()
         
     elif option == 4:      
        basic_arrays(); Matrix_operation_examples() 
        ElementWise_operation_examples()
     
     elif option == 5: 
        Matrices_allocation() 
        #StackOverflow_LargeArrays()
        StackOverflow_InfiniteRecursion()
                 
     elif option == 6: 
        Integral_and_derivative_examples()
         
     elif option ==  7: 
         Taylor_expansion_examples() 
         Fourier_example()
         
     elif option ==  8:
        Test_load_matrix()
    
     else : 
           print( " option not implemented" )


if __name__ == "__main__":

    menu_Foundations()

