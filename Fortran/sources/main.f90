  
Program main 
    
    use Foundations, only                     : menu_foundations  
    use integers_and_reals, only              : menu_Integers_and_reals
    use advanced_programming_techniques, only : menu_advanced_programming_techniques
    
     use N_body_problem, only        : Integrate_NBP
       
    implicit none 
    integer :: option 
      
  
    
option = 1     
do while (option>0) 
    
     write(*,*) 
     write(*,*) "Welcome to Advanced Programming" 
     write(*,*) "for Numerical Calculations" 
     
     write(*,*) " select an option " 
     write(*,*) " 0. exit/quit  "
     write(*,*) " 1. Foundations" 
     write(*,*) " 2. Integer overflow and floating point arithmetic  " 
     write(*,*) " 3. Advanced programming techniques "
     read(*,*) option   
     
    select case(option)
     case(1) 
          call menu_Foundations
         
     case(2) 
           call menu_Integers_and_reals
         
     case(3) 
         call menu_advanced_programming_techniques
         
         case default
           write(*,*) " option not implemented" 
              
     end select 
     
end do
    
    
end program 