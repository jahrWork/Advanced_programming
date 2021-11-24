module Roots 
    implicit none 
    
    contains 
    
    
    
!*********************************************************************   
! Roots of a second grade equation    
! Complex numbers are defined in fortran as any other type
! No need to include external libraries 
! Pure attribute assures no side effects     
!**********************************************************************
pure subroutine roots_2th(a, b, c, x1, x2) 
       real (kind=4), intent(in) :: a, b, c 
       complex (kind=4), intent(out) :: x1, x2 

      complex (kind=4) :: d 
      
      d = b**2 - 4* a*c
      x1 = ( - b + sqrt( d ) )/(2*a)
      x2 = ( - b - sqrt( d ) )/(2*a)


end subroutine 

!*********************************************************************   
! Roots of a second grade equation quadruple precision 
!**********************************************************************
pure subroutine roots_2thq(a, b, c, x1, x2) 
       real (kind=16), intent(in) :: a, b, c 
       complex (kind=16), intent(out) :: x1, x2 

      complex (kind=16) :: d 
      
      d = b**2 - 4* a*c
      x1 = ( - b + sqrt( d ) )/(2*a)
      x2 = ( - b - sqrt( d ) )/(2*a)


end subroutine 



!*********************************************************************   
! It solves the problem when -b + sqrt( b**2 - 4 a c ) is close to zero      
!**********************************************************************
pure subroutine robust_roots_2th(a, b, c, x1, x2) 
       real (kind=4), intent(in) :: a, b, c 
       complex (kind=4), intent(out) :: x1, x2 

      complex :: d 
      
      d = b**2 - 4* a*c
      if ( abs(-b+sqrt(d)) <= 100*epsilon(b) ) then 
          x2 = ( - b - sqrt( d ) )/(2*a)
          x1 = c / x2
      else 
          x1 = ( - b + sqrt( d ) )/(2*a)
          x2 = c / x1 
      end if 
      

end subroutine



 subroutine roots_2th_example 
      
     complex (kind=4) :: x1, x2 
     real (kind=4) :: a, b, c 
     
     a = 1; b = -2 ; c = 1 
     call roots_2th(a, b, c, x1, x2) 
     
     write(*,*) " x1 = ", x1 
     write(*,*) " x2 = ", x2 

end subroutine 



  
end module 
    

