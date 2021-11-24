module Huge_factorial 

    implicit none 
    
    
contains 

!**************************************************************************
!*
!**************************************************************************
 function factorial_high_precision(n) 
     integer, intent(in) :: n
      integer, allocatable ::   factorial_high_precision(:)

  integer :: i
  integer :: f(0:1000) 
  integer :: a(0:10) 


 

  f = 0 
  f(0) = 1 

  do i=1, n 
   a = convert_high_precision(i) 
   f = multiply_high_precision(f,a)
 !  write(*,'(a6,100i1)') ' fac=', f(70:0:-1) 
 !  read(*,*) 
  enddo 

   allocate ( factorial_high_precision(0:1000) ) 
   factorial_high_precision(:) = f(:)  


end function 

!**************************************************************************
!*
!**************************************************************************
 function convert_high_precision(n) 
     integer, intent(in) :: n
      integer ::   convert_high_precision(0:10)

  integer :: i 
  integer :: f(0:100) 
  integer :: a(0:10), m 

  m = n
 
  do i = 10, 0, -1
   
    a(i) = m / 10**i 
    m = m - a(i) * 10**i 
    
  end do

  convert_high_precision(:) = a(:) 


end function 


!**************************************************************************
!*
!**************************************************************************
 function multiply_high_precision(a,b) 
     integer, intent(in) :: a(0:), b(0:) 
      integer ::   multiply_high_precision(0:size(a)+size(b)-1)

  integer :: i, j, k,n, m  
  integer, allocatable :: c(:) 
  n = size(a)-1; m = size(b)-1 

  allocate( c(0:n+m+1) ) 
  c = 0 

  do i = 0, n 
     do j = 0, m 
         c(i+j)   = c(i+j) + a(i)*b(j)   
   enddo 
enddo 


do k=0, n + m 
     c(k+1)  = c(k+1) + c(k) / 10 
     c(k) = mod( c(k), 10 ) 
enddo 

multiply_high_precision(:) = c(:) 

end function 



!**********************************************************
!*
!**********************************************************
subroutine Test_factorial 

  integer :: factorial(0:1000) 
  integer :: n = 4
  integer :: m 
  
  
 do while(n>0)  
     
    factorial = factorial_high_precision(n)
    
    write(*,*) "******** n = ", n, "****************" 
    write(*,'(1001i1)') factorial(1000:0:-1)
    write(*,*) " new n (if n < 0 then quit)? " 
    read(*,*) n 
    write(*,*) 
    
 end do 
 
 

end subroutine 

end module 


