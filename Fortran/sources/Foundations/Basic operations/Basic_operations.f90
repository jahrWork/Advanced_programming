module Basic_operations 
    
    implicit none  
    
contains     

 subroutine Data_types()
 
     integer :: int = 1
     real :: x = 1.8
     complex :: com = (1,1)
     logical :: bool = .true.
     character (len=10,kind=1) :: string = 'data types'
         
 end subroutine 
 
 subroutine Operators()
 
     real :: x = 2., y = 7.
     real :: pi = 4*atan(1.), e = exp(1.)
     
     write(*,*) "e^(i pi) + 1 = ",  e**( (0,1)*pi ) + 1
     write(*,*) "x <= y and -x >= -y is ",  x <= y .and. -x >= -y
     write(*,*) "(abc//def) < abcdeg = ", ("abc"//"def") < "abcdeg" 
         
 end subroutine 
 
 subroutine Flow_structures()
 
     integer :: n = 6, i, f, a, b
     real :: x1, x0, x, abso
     
     f = 1
     
     ! do loop
     do i = n, 2, -1  !goes from n to 2 jumping backwards (-1)
         f = f*i
     end do
     
     write(*,*) "The factorial of n = ", n, "is n! = ", f
     
     ! do while loop
     x1 = 3.; x0 = 0.
     do while ( abs(x1-x0) > 1e-5 )
         x0 = x1
         x1 = x0 - (3*x0**3 - x0**2)/(9*x0**2 - 2*x0)
     end do
     
     write(*,*) "One root of 3x^3 - x^2 is at x = ", x1
     
     ! if - then - else conditional
     x = -75.2
     if ( x >= 0 ) then
         abso = x
     else
         abso = -x
     end if
     
     write(*,*) "The absolute value of x = ", x, "is ", abso
     
     ! if - elseif - else conditional
     a = 43; b = 34
     write(*,*) "a = ", b, "b = ", b
     if ( a > b ) then
         write(*,*) "a is greater than b"
     elseif (a < b) then
         write(*,*) "a is less than b"
     elseif (a == b) then
         write(*,*) "a is equal to b"    
     else
         write(*,*) "Error: not valid comparison"
     end if
         
 end subroutine 
 
 
 
 subroutine Data_structures()
 
    real :: V(3)
    
    V = [1, 2, 3]
         
 end subroutine 

 
 end module 
