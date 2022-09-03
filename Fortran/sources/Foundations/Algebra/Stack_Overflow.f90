module Stack_Overflow
    
    use Dynamic_allocation,      only : Identity
    
    implicit none 
    
    contains
    
!*****************************************************************************
!* First Example of Stack Overflow: large autoamtic arrays
!*****************************************************************************     
subroutine StackOverflow_LargeArrays() 
    real, allocatable :: R(:,:,:)
    integer :: n

    n = 400
    allocate( R(n, n, n) )

    R = StackOverflow_size( n ) 

end subroutine  


function StackOverflow_size( n ) result(R)
    integer, intent(in) :: n
    real :: R(n, n, n)    

    R(:, :, :) = 1.

end function    
    
    
!*****************************************************************************
!* Second Example of Stack Overflow: infinite recursion
!*****************************************************************************   
subroutine StackOverflow_InfiniteRecursion() 
    real, dimension(100,100) :: matrix    
    integer :: k                     ! index k of power 
    
    call RANDOM_NUMBER( matrix )
    
    k = 3
    write(*,*) wrong_power( matrix, k ) 
 
    
end subroutine 


recursive function wrong_power(A, k) result(B) 
    real, intent(in) :: A(:, :)  
    integer, intent(in) :: k  ! kth power 
    real :: B( size(A,dim=1), size(A,dim=1) )  
    
     integer :: i, N  
  
    N = size( A, dim=1 )
    
    !End condition incorrectly implemented
    if (k >= 10) then 
               B = Identity(N)
    else                
               B = matmul( wrong_power(A,k-1), A )  
    end if 
    
end function




!recursive function factorial(n)  result(f)
!  integer :: f
!  integer, intent(in) :: n
!  
!  if(n == 0) then
!    f = 1
!  else
!    f = n * f(n-1)
!  end if
!  
!end function 
!  
!
!recursive function fibonacci(term) result(fibo)
!  integer, intent(in) :: term
!  integer :: fibo
!
!  if (term <= 1) then
!    fibo = 1
!  else
!    fibo = fibonacci(term-1) + fibonacci(term-2)
!  end if
!  
!end function
!
!
!recursive subroutine recurse(i)
! 
!    integer, intent (in) :: i
! 
!    write (*, '(i0)') i
!    call recurse(i + 1)
! 
!end subroutine

end module   