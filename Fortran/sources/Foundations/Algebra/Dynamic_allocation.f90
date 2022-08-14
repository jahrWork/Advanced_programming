module Dynamic_allocation 
    
    implicit none 
  
contains
  
subroutine Matrices_allocation()   
   
    real :: S                        ! sum 
    integer :: M                     ! Vandermonde dimension 
    real, allocatable :: Ak(:, :, :) ! rows, columns, kth power
    integer :: k                     ! index k of power 
    
        
    S = sum( [ ( trace( Vandermonde(M) ), M=1, 10)  ] )
    write(*,*) "1. sum from M=1 to 10 of  trace ( A_M ) =   ", S 
      
    S = sum( [( trace(matmul(Vandermonde(M), Vandermonde(M))), M=1, 5) ])
    write(*,*) "2. sum from M=1 to 5 of traces ( A_M **2 ) = ", S 
    
    allocate( Ak(8, 8, 0:5) ) 
    do k=0, 5 
     Ak(:, :, k) = power( Vandermonde(8), k) 
    end do 
    
    S = trace( sum( Ak, dim=3) )  ! trace( I + Ak + Ak**2 +... Ak**5 ) 
    write(*,*) "3. trace ( sum from k=0 to 10 of A_5**k )=", S

end subroutine    





! Initialization of Vandermonde matrix A of dimension MxM  
function Vandermonde(N) result(A) 
  integer, intent(in) :: N 
  real, allocatable :: A(:,:) 

  integer :: i, j 
 
   A = reshape( [ ( ( (i/real(N))**(j-1), i=1, N ),  j=1, N) ], [N, N] )  
   

end function 

! Trace of a matrix A of dimension NxN  
real function trace( A ) 
     real, intent(in) :: A(:, :)
     
    integer :: i           ! row of matrix A 
    integer :: N           ! dimension of matrix A 
    
    N = size(A, dim=1) 
    trace = sum( [ (A(i,i), i=1, N) ] ) 
       
end function     


! It calculates the kth power of matrix A 
recursive function power(A, k) result(B) 
    real, intent(in) :: A(:, :)  
    integer, intent(in) :: k  ! kth power 
    real :: B( size(A,dim=1), size(A,dim=1) )  
    
     integer :: i, N  
  
    N = size( A, dim=1) 
    
    if (k==0) then 
               B = Identity(N)
    else                
               B = matmul( power(A,k-1), A )  
    end if 
    
end function 


function Identity(N) result(A) 
    integer, intent(in) :: N  ! Identity dimension 
    real :: A( N, N )  
    
    integer :: i, j  ! row, column 
    
    A = 0
    do i=1, N 
                A(i,i) = 1 
    end do
    
    
end function  



end module   