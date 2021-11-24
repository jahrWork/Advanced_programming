module First_class_functions 
    
    implicit none 
    
    abstract interface 
      elemental real function  f_R_R(x)
        real, intent(in) :: x 
      end function 
    end interface 
    
    
    contains 
    
    
    subroutine Function_examples 
    
       real :: R 
       
    ! Integral of f(x) from a to b 
      R = Integral(h, 0., 1.) 
      write(*,*) 
      write(*,*) " Integral of h(x) from 0 to 1  =", R 
      
    
    ! Integral of x**n f(x) from a to b based on Integral 
      R = Moment(h, 3, 0., 1.) 
      write(*,*) " Integral of x**3 * h(x) from 0 to 1  =", R  
      write(*,*) 
      
    end subroutine
    
    pure real function Integral(f, a, b) 
       procedure (f_R_R) :: f 
       real,intent(in) :: a, b 
      
       integer :: i, N 
       real :: S, dx 
       real, allocatable :: x(:) 
       
       
       N = 100 
       dx = (b-a)/N 
       allocate ( x(0:N) ) 
       
       x = [ ( a + dx * i, i=0, N) ] 
       S = dx * sum ( f(x) )   
       
       Integral = S 
       
    end function 
    
    pure real function Moment(f, n, a, b) 
       procedure (f_R_R) :: f 
       integer, intent(in) :: n 
       real, intent(in) :: a, b 
      
       Moment = Integral( g, a, b)  
       
     contains
     
     elemental real function g(x) 
          real, intent(in) :: x 
          
          g = x **n * f(x) 
          
       end function 
     
    end function 
    
    elemental real function h(x) 
       real, intent(in) :: x 
     
       h = x**2 + x + 1 
       
    end function 
    
    
    
end module 
    