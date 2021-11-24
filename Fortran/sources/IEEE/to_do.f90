

module tailrec
use iso_fortran_env

implicit none

interface 
   real function f_R_R(x) 
      real, intent(in) :: x 
   end function 
 
end interface 

integer(kind=8) :: acc, x, acc2

    contains
    
recursive subroutine my_sum(n, S)
    integer, intent(inout) :: n
    real, intent(inout) :: S

    if (n == 0)  return
    
    S = S + 1/real(n**2)
    n = n - 1  
    
    call my_sum(n, S)
    
end subroutine     
    

recursive subroutine tailrecsum (x, running_total)
    integer(kind=8), intent(inout) :: x
    integer(kind=8), intent(inout) :: running_total

    if (x == 0)  return
    
    running_total = running_total + x
    x = x - 1
    call tailrecsum (x, running_total)
    
end subroutine 

recursive real function my_sum2(n, S) bind(C)
    integer, value :: n
    real, value :: S

    if (n == 0) then
        my_sum2 = S
        return
    else 
        my_sum2 = my_sum2(n-1, S + 1/real(n**2) )
    end if
    
    
end function 




integer function sum_odd_numbersI(N) result(S) 
    integer, intent(in) :: N

    integer :: i 
    
    S = 0 
    do i=1, N 
        S = S + 2 * i + 1 
    end do 
    
end function 


real function sum_n2(eps) result(S) 
    real, intent(in) :: eps 

    integer :: i 
    
    S = 0 
    i = 1 
    do while( 1/real(i**2) > eps ) 
            
         S = S + 1 / real( i**2 )  
         i = i + 1 
    end do 
    
end function 



pure integer function sum_odd_numbersD(N) result(S) 
    integer, intent(in) :: N

    integer :: i 
    
    S = sum( [ ( 2 * i + 1, i=1, N ) ] ) 
      
end function 

























! Vladimir F
! It becomes simpler for the compiler to optimize tail calls if you pass the arguments by value. 
! In that case there is no temporary to which the receiving procedure needs to have a pointer (address).

recursive real function S(n) bind(C) 
        integer, value :: n
    
    if (n == 0) then
        return 
    else 
        S = S(n-1) + 1/real(n**2)
    end if
    
    
end function 


recursive real function Newton_solution(x, f) result(xn) 
    procedure (f_R_R) :: f 
    real, value :: x 
    
    real :: eps = 1d-5 
    
    if (abs(f(x)) < eps) then
        
        xn = x 
        return 
        
    else 
        xn = Newton_solution(  Iteration(x), f ) 
    end if
    
contains 
real function Iteration(x) result(x1)  
    real, value ::  x 
    
        real :: h = 1d-4 
    
        x1  = x -  f(x) * 2 * h / ( f(x+h) - f(x-h) )  
    
end function
 
    
end function 











recursive real function Fixed_point_iteration(x, a)  bind(C) 
    real, value :: a, x 
    
    real :: eps = 1d-5 
    
    if (Error(x,a) < eps) then
        
        Fixed_point_iteration = x 
        return 
        
    else 
        Fixed_point_iteration = Fixed_point_iteration( iteration(x, a), a ) 
    end if
    
    
end function 

real function Error(x, a)   bind(C) 
    real, value :: x, a 
    
    
        Error = abs( x**2 - a ) 
    
end function 



 real function iteration(x, a) result(xn)  bind(C) 
    real, value :: a, x 
    
    
        xn  = ( x + a / x ) / 2    
    
 end function 




 
 
 
 
 
real function g(x) 
   real, intent(in) :: x 
  
    g = x**2 - 2
   
   
end function 

real function h(x) 
   real, intent(in) :: x 
  
    h = sqrt( x**2 - 1 ) 
   
   
end function 





end module 
   
    
 subroutine Console8
    
    use tailrec
    USE, INTRINSIC :: IEEE_ARITHMETIC, ONLY: IEEE_IS_FINITE  
    implicit none
 
    integer, parameter :: N = 50000  
    real :: S1, S2, S3 
    integer :: i 
    real :: a(N), b, y, z    
   
    a = [ ( 1/real(i**2) , i = 1, N ) ] 

  
!    
!    S1 = sum( a, a > 0.05 ) 
!    S2 = sum( a, a > 0.001 )
!    S3 = sum( a )
!    write(*,*) " S1 = ", S1 
!    
!    write(*,*) " S2 = ", S2 
!    write(*,*) " S3 = ", S3 
!    
!    
!   
!acc = 0
!acc2 = 0 
!
!x = 500000000
!x = 3
!
!!call tailrecsum(x, acc)
!
!x = 3 
!x = 500000000
!S3 = 0 
!i = 50000
!!call my_sum(i, S3)
!
!
!print *, acc
!write(*,*) S3
!
!i = 50000
!S3 = 0 
!!S3 = my_sum2(i, S3)  
!write(*,*) S3    
!
!
!i = 50000
!S3 = S(i)  
!write(*,*) S3 
!    
!b = 2. 
!S3 = 1.
!!S3 = Fixed_point_iteration( S3, b) 
!write(*,*) S3, sqrt(b) 
!    
!    
!y = 0.9 
!!y = Newton_solution( y, g) 
!write(*,*)" y = ", y  
!


write(*,*) " h(0.5) = ", h(0.5) 
write(*,*)  " g = ", g ( h(0.5) ) 

z = g ( h(0.5) ) 
if  (IEEE_IS_FINITE(z)) then 
    write(*,*) " Result =", z 
else 
    write(*,*) " z is NaN  "
end if 


end subroutine 
