module Roots
    
    implicit none  ! no implicit specifications of variables
                   ! real, integer of any variable type must be given 
    
contains     
!*****************************************************************************
!* Roots a second grade equation:
!       a x**2 + b x + c = 0,    with real numbers a,b,c 
!*****************************************************************************
 subroutine Roots_2th()
 
    real :: a, b, c       ! coefficients 
    complex :: x1, x2, d  ! roots and discriminant 
    
    a = 1.;  b = 1;  c = 1
      
    if (abs(a)==0) then 
         if (abs(b)==0) then 
             write(*,*) "There is no solution " 
         else
             write(*,*) "There is only one solution x1 =", -c/b  
         end if 
    else
            d =  b**2 - 4*a*c  
            x1 = ( -b + sqrt(d) )/( 2*a ) 
            x2 = ( -b - sqrt(d) )/( 2*a )
            
            write(*,*) "There are two solutions " 
            write(*,*) " x1 = ", x1 
            write(*,*) " x2 = ", x2 
    end if 
     
 end subroutine 
 
 end module 
