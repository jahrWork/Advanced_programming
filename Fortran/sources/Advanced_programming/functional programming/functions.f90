 
module functions 
  
     implicit none
     
     interface 
       real function f_R_R(x) 
       real, intent(in) :: x 
       end function 
     end interface 
     
     integer :: n = 3 
     
    contains 
        
 subroutine derivative_examples 
 
 
   write(*,*) "FOR f1(2) = ", f1( 2.) 
   write(*,*) "FOR f2(2) = ", f2( 2.) 
   
 
end subroutine 
 
    
    
real function f1(x) 
    real, intent(in) :: x 
    
       f1 = derivative(p, x)    
end function 
    
real function f2(x) 
    real, intent(in) :: x 
    
       f2 = derivative(q, x)      
       
end function    
        
        
        
real function derivative(f, x) 
    procedure (f_R_R) :: f 
    real, intent(in) :: x 
    
     derivative = df(x)  
    
contains 
    real function df(x) 
      real, intent(in) :: x 
    
      real :: h = 1e-3 
      
      df = ( f(x+h) - f(x) )/h 
        
    end function 
    
end function 


real function p(x) 
    real , intent(in) :: x 
         p=  x**2
end function 
    
real function q(x) 
    real , intent(in) :: x 
         q =  x**3
end function

pure real function w(x) 
    real , intent(in) :: x 
    
     !  integer, save :: m ! not allowed in pure functions  
     !  read(*,*) n        ! not allowed input or output 
    
    ! n = 4                ! not allowed, modify global variables
     w =  n + x
         
         
end function 


end module 
    

   
  
