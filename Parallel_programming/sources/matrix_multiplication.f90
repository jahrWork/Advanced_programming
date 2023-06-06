module matrix_multiplication 
    
    implicit none 
    
    
    contains 
    
   
subroutine test_matmul  
        
integer, parameter :: N = 5000
integer, parameter :: M =  5000
integer, parameter ::  TIMES = 1000
integer :: i, j, k 
real  :: A(N, M), x(M), b(N)

    
    real :: t1, t2, s  
  
    do i=1, N
            do j=1, M 
               A(i,j)   = (i-1) * (j-1)  / real( N * M) 
            end do 
            x(i) = (i-1) * (i-1)  / real( N * M ) 
    end do  
    
    
    call CPU_TIME(t1)
    do k=0, TIMES 
        b =  matmul(A, x) 
        write(*,*) k 
    end do 
    call CPU_TIME(t2)
    write(*,*) " CPU = ", t2-t1 
    write(*,*) "b_1 = ", b(1) 
    write(*,*) "b_M = ", b(N) 
    
    call CPU_TIME(t1)
    do k=0, TIMES 
        do i=1, N
            s = 0 
             do j=1, M 
                s  = s +  x(j) * A(j,i)  
            end do 
            b(i) = s 
        end do  
    end do 
    call CPU_TIME(t2)
    write(*,*) " CPU = ", t2-t1 
    write(*,*) "b_1 = ", b(1) 
    write(*,*) "b_M = ", b(M) 
        
end subroutine 
        
    
    
    
!function  parallel_matmul(A, V) result(B) 
!      real, intent(in) :: A(:,:), V(:) 
!      real :: B( size(A, dim=1) ) 
!
!
!! this image and number of images 
!  integer :: image, j, Ni  
!  integer :: N, i1, i2   
!
!! Bi is a coarray of dimension  determined at runtime
!! Bi = A_ij V_j is the multiplication of row i of matrix A by vector V 
!! Every image calculates from i1 to i2 rows 
!  real (kind=8), allocatable :: Bi(:, :)[:]
!     
!! N is the dimension of matrix A
!! Nt is the number of rows for each image   
!  integer(kind=8) :: i,  Nt 
!
!   image = this_image()
!   Ni = num_images()
! 
!!  number of rows for each image    
!   Nt = N / Ni
!   allocate( Bi(Nt, N) ) 
! 
!!  Each image performs the matrix multiplication: B_ij = A_ij V_j from i1 to i2 
!  
!   i1 = (image-1)*Nt
!   do i =i1, N, Nt 
!      B = matmul( A(i1:i1+Nt, :), V )  
!   end do
!   
!!  partial result of each image    
!   write(*,*) " image =", image
!   
! ! Once image 1 finishes, it sums the contribution of each image
!   if (image .eq. 1) then
!      
!     write(*,*) "Contributions of different images  " 
!     do j = 1, Ni
!         
!       i1 = 1 + (j-1)*Nt
!       i2 = i1 + Nt 
!       B(i1:i2,:) = B[j] 
!     end do
!     
!              
!   end if
!
!
!
!end function

subroutine example_parallel_matmul


  real, allocatable :: A(:,:), V(:), B(:) 
  integer :: i, j, N 

  real (kind=8) :: t0, tf, pi = 4*atan(1.), xi  
  
! N is the dimension of matrix A
  N = 1000 
  allocate( A(N,N), V(N), B(N) ) 
  do i=1, N 
      xi = 2 * pi * i / N 
      V(i) = 1/real(N) 
      A(i,:) = 1/real(N) 
  end do 
     
  
  call cpu_time(t0) 
 
  do i=1, 1000
   B = matmul( A, V ) 
  !B = parallel_matmul( A, V ) 
  end do 
  
  
  write(*,*) "image = ", this_image()
  
  sync all 
  if (this_image() .eq. 1) then
   call cpu_time(tf)
   write (*,*) "CPU time:", tf-t0
   !write (*,*) "Matrix dimension =", N
   !write (*,*) "A=", A
   !write (*,*) "V=", V
   !write(*,*) "matmul = ", matmul(A,V)
   !write (*,*) "Calculated  B=", B
   write (*,*) "Calculated  B=", norm2(B)
  end if 
  
   


end subroutine    


end module 
    