module vectors_and_matrices 
    
    implicit none 
    
    
    contains 
    


    
subroutine dot_product_examples() 

   real :: a(4) = [1, 2, 3, 4]
   real :: b(4) = [5, 6, 7, 8]
   real :: S 
   integer :: i, N 
   character (len=40) :: f = '(a40, f8.4)' 
   

   S = dot_product(a,b) 
   write(*,f) " dot product = ", S
   
   
!  von Neumann program 
   N = size(a) 
   S = 0 
   do i=1, N 
       s = S + a(i)*b(i) 
   end do 
   write(*,f) " von Neumann dot product = ", S
   
!  functional program 
   S = sum( a * b ) 
   write(*,f) " functional program, dot product = ", S 
   
   write(*,*) 
   
   
end subroutine 

subroutine matmul_examples() 

   real :: A(2,2), B(2,2), C(2,2)   
   integer :: i, j, k, N 
   character (len=40) :: f = '(10(2f8.4,/) )' 
   real :: S 
   
   N = size(A, dim=1)  
   A = reshape( [((i, i=1, N), j=1, N)], [2,2])
   B = reshape( [((i+1, i=1, N), j=1, N)], [2,2])
  
   write(*,*) " A = "
   write(*,f) transpose(A)
   
   write(*,*) " B = "
   write(*,f) transpose(B)
   
   C = matmul( A, B ) 
   write(*,*) " matmul C = A B  = "
   write(*,f)  transpose(C)
   
   
!  von Neumann program 
   N = size(A, dim=1) 
   do i=1, N 
       do j=1, N 
           S = 0
           do k=1, N 
              S = S + A(i,k) * B(k,j) 
           end do 
           C(i, j) = S
       end do 
   end do 
   write(*,*) " von Neumann mal mul = "
   write(*,f)  transpose(C)
   
!  functional program 
  ! forall (i=1:N,j=1:N) C(i,j) = dot_product( A(i,:), B(:,j) ) 
   C = reshape ( [((dot_product( A(i,:), B(:,j) ), i=1, N), j=1,   N)], [N,N] ) 
   write(*,*) " functional program, mat mul = "
   write(*,f)  transpose(C)
   
   write(*,*) 
   
   
end subroutine 


!------------------------------------------------
! Lower triangular matrix 
!------------------------------------------------
function tril( A ) result(A_l) 
   real, intent(in) :: A(:,:) 
   real :: A_l( size(A, dim=1), size(A, dim=2) )
   
   integer :: N, M, i, j   
   
   N = size(A, dim=1);  M = size(A, dim=2) 
   
   A_l = 0 
   do i=1, N 
       do j=1, i-1 
           A_l(i,j) = A(i,j) 
       end do 
   end do 
   
   
end function    
   
!-----------------------------------------------------------------
! Given an array find the maximum difference between two elements 
! in it such that the smaller element appear before the larger
!-----------------------------------------------------------------
subroutine greatest_difference 

    integer, parameter :: N = 4 
    real :: x(N) = [7, 1 , 5, 4], x_min(N)
    real :: D(N,N)
    real :: xmin, e 
    integer :: i, j
     
    ! algorithm  O(N**2) 
    D = reshape( [( ( x(i)-x(j), i=1, N), j=1, N )], [N,N] )
    write(*,*) "max =",  maxval( tril( D ) ) 
  
    ! algorithm O(N) 
    x_min = [ (minval(x(1:i)), i=1, N) ]  
    write(*,*) " max = ", maxval( x - x_min ) 
    
    ! imperative programming 
    xmin = x(1) 
    e = -1
    do i=1, N 
        if (x(i)-xmin >e)  e = x(i) - xmin  
        if (x(i) < xmin)   xmin = x(i) 
    end do 
    write(*,*) " max = ", e
    
end subroutine 



end module    