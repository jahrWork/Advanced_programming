module Series 
    
    implicit none 
    
    interface 
      real function f_N_R(x) 
        integer, intent(in) :: x 
     end function 
    end interface 
    
    
contains 
 
!--------------------------------------
! S = sum from i=i0 to infinity ( a_i ) 
! The error should be < eps
!--------------------------------------
real function Sigma(a, i0, eps) result(S) 
    procedure (f_N_R) :: a 
    integer, intent(in) :: i0
    real, intent(in) :: eps
 
     integer ::  N 
    
     N = Tail(a, eps) 
     
     S = Sigma_N(a, i0, N)
  
end function 


!--------------------------------------
! S = sum form i=1 to N ( a_i ) 
!--------------------------------------
real function Sigma_N(a, i0, N) result(S) 
    procedure (f_N_R) :: a 
    integer, intent(in) :: i0, N
    
    integer :: i 
    
    S = sum( [ (a(i), i=i0, N ) ] ) 
  
end function 



!--------------------------------------
! It calculates the number of terms N
! which gives rise to an error < eps
!--------------------------------------
integer function Tail(a, eps) result(N) 
    procedure (f_N_R) :: a 
    real, intent(in) :: eps

    integer :: i, Nmax = 100000 
    
  ! Obtain N such as:
  ! integral from i=N+1 to infinity a_i = eps 
    i = 1 
    do while( abs( a(i) + a(i+1) )  > 2*eps   & 
              .and. i < Nmax ) 
        
        i = i + 1
        
    end do 
    N = i 
   
end function 


real function factorial(n) 
    integer, intent(in) :: n 

     factorial = gamma(real(n+1))  
  
 end function 


  
end module   
