module Matrix_operations 
    
    implicit none 
    
contains
    
    
!*****************************************************************************
!* Examples of vectorial and matrix operations
!*****************************************************************************   
subroutine Matrix_operation_examples() 

   integer, parameter :: N = 10 
   real :: W(N), V(N), A(N,N), B(N,N)   
   integer :: i, j  

    V = [ ( 1./i**2, i=1, N ) ] 
    W = [ ( (-1)**(i+1)/(2*i+1.), i=1, N ) ] 
    A = reshape( [ ( ( (i/real(N))**(j-1), i=1, N ),  j=1, N) ], [N, N] )  
    
        
    write(*,*) " 1. Sum ( V ) = ", sum(V) 
    write(*,*) " 2. Sum ( A ) = ", sum(A)
    write(*,*) " 3. Sum ( V, V>0 ) = ", sum(V, V>0) 
    write(*,*) " 4. Sum ( A, A<0 ) = ", sum(A, A<0) 
    write(*,*) " 5. dot product  ( V, W ) = ", dot_product(V, W)   
    write(*,*) " 6. dot product V and A(:,N) = ", dot_product( V, A(:,N) ) 
    write(*,*) " 7. mat multiply A times V = ", matmul( A, V )
    
    write(*,*) " 8. my transpose (A) = " 
    B = transpose(A) 
    do i=1, N
        write(*,'(100f8.3)') (B(i, j), j=1, N) 
    enddo 
    
    write(*,*) " 9. maxval (A) = ", maxval(A)
    write(*,*)" 10. maxloc (A) = ", maxloc(A)
  
  

end subroutine    
!*****************************************************************************
! Dot product of two vectors of dimension N 
!    sum from i=1 to i=N ( u_i * v_i ) 
!*****************************************************************************   
real function my_dot_product( u, v ) 
     real, intent(in) :: u(:), v(:) 
     
     
    integer :: i       ! summation index 
    integer :: N       ! dimension of vectors u, v 
    real    :: S       ! summation 
    
    N = size(u) 
    
    S = 0 
    do i=1, N 
        S = S + u(i) * v(i)   
    end do 
    
    my_dot_product = S 
    
end function    

!*****************************************************************************
! Matrix multiplication  of two matrices A, B  of dimension NxM and MxL  
!    C_ij = A_ik * B_kj
!*****************************************************************************   
function my_matmult( A, B ) result(C) 
     real, intent(in) :: A(:,:), B(:,:) 
     real C( size(A, dim=1), size(B, dim=2) ) 
     
    integer :: i        ! row of matrix C 
    integer :: j        ! column of matrix C 
    integer :: k        ! summation index 
    integer :: N,M, L   ! dimension of A and B  
    real    :: S        ! summation 
    
    N = size(A, dim=1) 
    M = size(A, dim=2) 
    L = size(B, dim=2) 
    
    do i = 1, N 
        do j = 1, L 
            
            S = 0 
            do k = 1, M 
                S = S + A(i,k) * B(k,j) 
            end do  
            C(i,j) = S 
            
        end do 
    end do 
    
end function  


end module   