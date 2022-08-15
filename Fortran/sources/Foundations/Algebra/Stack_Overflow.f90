module Stack_Overflow
    
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


!*****************************************************************************
! Automatic arrays are stored in the Stack
!*****************************************************************************   
function StackOverflow_size( n ) result(R)
    integer, intent(in) :: n
    real :: R(n, n, n)    

    R(:, :, :) = 1.

end function    
    
    
!*****************************************************************************
!* Second Example of Stack Overflow: infinite recursion
!*****************************************************************************   
recursive function fact(i) result (f)
    integer, intent(in) :: i
    integer :: f
    
    if (i <= 0) then
       f = 1
    else
       f = fact(i+1) * i
    end if
    
end function 
    

end module   