 module Foundations 
    
  use Basic_operations,      only : Data_types, Data_structures, Operators, Flow_structures
  use Roots,                 only : Roots_2th  
  use Sum_series,            only : Summation_n2_examples, Summation_examples, Summation_functional_examples 
  use Matrix_operations,     only : Basic_arrays, Matrix_operation_examples, ElementWise_operation_examples
  use Dynamic_allocation,    only : Matrices_allocation
  use Stack_Overflow,        only : StackOverflow_LargeArrays, StackOverflow_InfiniteRecursion
  use vectors_and_matrices,  only : dot_product_examples, matmul_examples, greatest_difference
  use Fourier,               only : Fourier_example
  use Integrals_derivatives, only : Integral_and_derivative_examples
  use Series_expansion,      only : Taylor_expansion_examples
  use Read_files,            only : Test_load_matrix
 
  implicit none 
  
contains 
    
subroutine menu_Foundations 

   integer :: option 

do ! Basic programming examples     
     write(*,'(/,A)') "Welcome to basic programming concepts" 
     write(*,*) " select an option " 
     write(*,*) " 0. exit/quit  "
     write(*,*) " 1. Hello world" 
     write(*,*) " 2. Data types and basic operations" 
     write(*,*) " 3. Sum of series "
     write(*,*) " 4. Vectors and matrices "
     write(*,*) " 5. Memory allocation "
     write(*,*) " 6. Integrals and derivatives "
     write(*,*) " 7. Taylor and Fourier expansions"
     write(*,*) " 8. Read/write data from external files "
     read(*,*) option   
     
    select case(option)
     case(0) 
         exit 
          
     case(1) 
         call Hello_world()
          
     case(2) 
         call Data_types(); call Data_structures()
         call Operators(); call Flow_structures; call Roots_2th()
         
     case(3) 
         call Summation_n2_examples()
         call Summation_examples()
         call Summation_functional_examples()
         
     case(4)      
         call  Basic_arrays(); call Matrix_operation_examples()
         call  ElementWise_operation_examples()
     
     case(5) 
         call Matrices_allocation()
         call dot_product_examples()
         call matmul_examples()
         call greatest_difference()    
         !call StackOverflow_LargeArrays()
         !call StackOverflow_InfiniteRecursion()
         
     case(6) 
         call Integral_and_derivative_examples()
         
     case(7) 
         call Taylor_expansion_examples()
         call Fourier_example()
         
     case(8)
         call Test_load_matrix()
    
     case default;  write(*,*) " option not implemented" 
    end select 
     
end do


end subroutine 

end module 