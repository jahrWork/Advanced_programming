module Fourier 
    
    use dislin 
    implicit none 
    
    real, parameter :: PI = 4 * atan(1d0) 
    complex, parameter :: I = (0, 1)
    
    contains
    
subroutine Fourier_example 
    
    integer :: N = 24   ! Fourier truncated series 
    integer, parameter :: M = 2000 ! points to plot 
    real ::  x(0:M), y(0:M)
    integer :: i
   
    x = [ ( 2 * PI * i /M, i=0, M) ] 
   
    call scrmod("reverse")
    y = Fourier_series( N, x ) 
    call qplot(x, y, M+1) 
    
    y = sine_Fourier( N, x ) 
    call qplot(x, y, M+1) 
    
end subroutine

!--------------------------------------------------
! f(x) = sum from k= -N/2 to N/2 c_k exp( I k x ) 
!      
!         with  c_k = ( a_k - I * b_k ) / 2, k>0 
!               c_{-k} = conjugate( c_k ) 
!
!               a_k : cosine coefficients 
!               b_k : sine coefficients 
!--------------------------------------------------
elemental function Fourier_series(N, x) result(f) 
    integer, intent(in) :: N 
    real, intent(in) :: x 
    real :: f 
   
    complex :: c(-N/2:N/2), e(-N/2:N/2) 
    real :: a(0:N/2), b(0:N/2) 
    integer :: k 
    
    a = 0 
    b(0) = 0 
    b(1:N/2) = [ (2*(-1)**(k+1) / (PI*k), k=1, N/2 ) ] 
    
    c(0:N/2)   =   ( a - I * b )/2 
    c(-N/2:-1) = conjg( c(N/2:1:-1) )
    
    e = [ ( exp( I * k * x ), k=-N/2, N/2 ) ] 
      
    f = real ( sum( c * e ) )
    
    
end function 

elemental function sine_Fourier(N, x) result(f) 
    integer, intent(in) :: N 
    real, intent(in) :: x 
    real :: f 
   
    real :: b(1:N/2), sink(1:N/2)  
    integer :: k 
    
    b = [ (2*(-1)**(k+1) / (PI*k), k=1, N/2 ) ] 
    
    sink = [ ( sin( k * x ), k=1, N/2 ) ] 
    
    f = sum( b * sink ) 
    
end function 


    
end module 
    
