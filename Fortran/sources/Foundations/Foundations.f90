 module Foundations 
  
    
  use Roots, only : Roots_2th  
  use Sum_series, only : Summation_n2_examples, Summation_examples, Summation_functional_examples 
  use Matrix_operations, only : Matrix_operation_examples
  use Dynamic_allocation, only : Matrices_allocation
  use Integrals_derivatives, only : Integral_and_derivative_examples
  use Series_expansion, only : Taylor_expansion_examples
  use Read_files, only : Test_load_matrix
 
  implicit none 
    
  
  
contains 
    
subroutine menu_Foundations 

   integer :: option 


option = 1     
do while (option>0) 
    
     write(*,*) 
     write(*,*) "Welcome to basic programming concepts" 
     
     write(*,*) " select an option " 
     write(*,*) " 0. exit/quit  "
     write(*,*) " 1. Hello world" 
     write(*,*) " 2. Roots of second grade equation" 
     write(*,*) " 3. Sum of series "
     write(*,*) " 4. Vectors and matrices "
     write(*,*) " 5. Memory allocation "
     write(*,*) " 6. Integrals and derivatives "
     write(*,*) " 7. Taylor expansion "
     write(*,*) " 8. Read/write data from external files "

     read(*,*) option   
     
    select case(option)
     case(1) 
          call Hello_world()
          
     case(2) 
         call Roots_2th()
         
     case(3) 
        call Summation_n2_examples()
        call Summation_examples()
        call Summation_functional_examples()
         
     case(4)      
       call  Matrix_operation_examples() 
     
     case(5) 
          call Matrices_allocation()
         
     case(6) 
           call Integral_and_derivative_examples()
         
     case(7) 
           call Taylor_expansion_examples()
         
     case(8)
         call Test_load_matrix()
    
         case default
           write(*,*) " option not implemented" 
              
     end select 
     
end do


end subroutine 

end module 