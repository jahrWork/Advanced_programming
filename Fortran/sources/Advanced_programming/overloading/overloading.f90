module overloading 
    
   abstract interface 
   
      pure function f_R_R(x) result(f) 
       real, intent(in) :: x 
       real :: f 
     end function 
     
     pure function f_R2_R(x, y) result(f) 
       real, intent(in) :: x, y  
       real :: f 
     end function 
     
   end interface 
   
   interface Integral 
       module procedure Integral1D, Integral2D 
   end interface 
   
   
    
contains 
    
pure function Integral1D(a, b, f) result(I1D) 
  real, intent(in) :: a, b 
  procedure (f_R_R) :: f 
  real :: I1D 
  
    integer :: i 
    integer, parameter :: N = 100 
    real :: h, x(0:N) 
    
    h = (b-a)/N
    x = [ ( a + h*i, i=0, N ) ]  
    
    I1D = 0 
    do i=1, N  
        I1D = I1D + h * f( x(i) )  
    end do 
 
  
end function 

pure function Integral2D(a, b, c, d, f) result(I2D) 
  real, intent(in) :: a, b, c, d  
  procedure (f_R2_R) :: f 
  real :: I2D 
  
  real :: xi 
  
  I2D = Integral1D(a, b, I1) 
   
contains

pure real function I1(x)
  real, intent(in) :: x 
  
    I1 = Parametric_I1D(x, c, d, f) 
      
end function 
end function 

pure function Parametric_I1D(x, c, d, f) result(Ip) 
  real, intent(in) :: x,  c, d  
  procedure (f_R2_R) :: f 
  real :: Ip 
  
  Ip = Integral1D(c, d, g) 
   
contains

pure real function g(y)
  real, intent(in) :: y 
  
    g = f(x, y) 
      
end function
end function 


subroutine test_Integral

   write(*,*) " Integral 1D = ", Integral(0., 1., f1) 
   write(*,*) " Integral 2D = ", Integral(0., 1., 0., 1., f2) 
    
contains 
    
real elemental function f1(x) 
     real, intent(in) :: x 
          
     f1 = x 
     
end function 

real elemental function f2(x, y) 
     real, intent(in) :: x, y 
     
     f2 = x + y 
     
end function 
end subroutine 



end module 
    