  
Program main 
    
    use Foundations, only               : menu_foundations  
    use integers_and_reals, only        : menu_Integers_and_reals
    use advanced_programming, only      : menu_advanced_programming
         
    implicit none 
    integer :: option 
   
do 
     write(*,'(/, A)') "Welcome to Advanced Programming" 
     write(*,*) "for Numerical Calculations (Fortran project)" 
     
     write(*,*) " select an option " 
     write(*,*) " 0. exit/quit  "
     write(*,*) " 1. Foundations" 
     write(*,*) " 2. Integer overflow and floating point arithmetic  " 
     write(*,*) " 3. Advanced programming techniques "
     read(*,*) option   
     
    select case(option)
        
     case(0) 
          exit
          
     case(1) 
          call menu_Foundations
         
     case(2) 
           call menu_Integers_and_reals
         
     case(3) 
         call menu_advanced_programming
         
         case default
           write(*,*) " option not implemented" 
              
     end select 
     
end do

end program 