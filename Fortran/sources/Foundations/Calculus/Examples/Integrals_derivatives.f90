module Integrals_Derivatives
    
       use calculus, only: Derivative, Integral 
       use plotting, only : plot, plot_ini, plot_show, disfin 
       implicit none            
    
       real, parameter :: PI = 4 * atan(1d0) ! PI definition 
   
    
contains


subroutine Integral_and_derivative_examples()

         
     call plot_ini( -2*PI, 2*PI, -2.5, +2.5 )  
     
     call plot( sine )                    ! plot sine function 
     call plot_show() 
         
     call plot( Piecewise_f )   ! plot piecewise function 
     call plot_show() 
     
     call plot( Derivative_f )  ! plot derivative of piecewise function 
     call plot_show() 
     
     call plot( Integral_f )    ! plot integral of piecewise function 
     call disfin 
     
contains  
 
function Derivative_f(x) result(Df) 
      real, intent(in) :: x 
      real :: Df
      
        Df = Derivative( Piecewise_f, x ) 
      
end function 
     
function Integral_f(x) result(I_f)
      real, intent(in) :: x 
      real :: I_f
      
        I_f = Integral( Piecewise_f, a = -1., b = x ) 
      
end function 

end subroutine 




function sine(x) result(f) 
      real, intent(in) :: x 
      real :: f 
      
        f = sin( x) 
        
end function


function Piecewise_f(x) result(f) 
      real, intent(in) :: x 
      real :: f 
      
       if ( x < -PI/2 ) then 
           
            f = 0 
            
       else if ( x < PI/2 ) then 
           
            f = cos(x) 
            
       else 
           
            f = 0 
            
       end if 
      
end function







 
end module   
    
    
    
    
    
    
    
    
    !!*****************************************************************************
!! It plots  piecewise functions 
!!*****************************************************************************   
!subroutine Function_examples 
!
!  real, allocatable :: x(:)  ! domain point 
!  real, allocatable :: y(:)  ! image point 
!  integer :: i               ! index of domain point 
!  integer :: N               ! number of points 
!  real :: a=-5, b=5          ! domain interval  x in [a, b]  
!  real ::  dx                ! step between domain points 
!    
!  N = 10 
!  dx = (b-a)/N 
!  
!  ! automatic allocation 
!  x = [ (a + i * dx , i=0, N) ] 
!  
!  ! vectorial operation (note: elemental real function f(x)) 
!  y = f(x)
!  
!  write(*,'(2(a,f5.1))') " a =", a, " b= ", b 
!  write(*,*) "      Definition of a piecewise function f(x)      "
!  write(*,*) " Hit enter key to plot the piecewise function " 
!  read(*,*) 
!  call scrmod("reverse")
!  call qplot(x, y, N+1) 
!
!end subroutine 