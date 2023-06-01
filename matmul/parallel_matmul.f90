 module parallel_matmul 
    
   implicit none 
   integer, parameter :: N = 5000
   real, save :: A(N, N), x(N), b(N)
   !integer, parameter :: M = 5000
  ! real, save, allocatable :: A(:, :), x(:), b(:)
   
   
 contains    
    
subroutine test_matmul_single_core( N_operations ) 
 integer(kind=8), intent(out) :: N_operations 
        
 !real, allocatable :: A(:, :), x(:), b(:)
 integer :: k
 real :: t1
  
    integer :: TIMES = 1000
   ! allocate( A(N,N), x(N), b(N) ) 
   
    N_operations = 2 * N * N * real(TIMES)
    
    
    call Initialization(N, N, A, x) 
 
    
    call cpu_time(t1)
    do k=0, TIMES  
            b = matmul(A, x) 
           !write(*,*) k
    end do 
    call final_cpu_time1("matmul", t1, b) 
   
        
    call cpu_time(t1) 
    do k=0, TIMES  
        b = my_matmul(A, x) 
    !   write(*,*) k
    end do 
   call final_cpu_time1("my_matmul", t1, b) 
    
   write(*,*) " Press enter" 
   read(*,*)

  
        
end subroutine

subroutine  Initialization(N, M, A, x)  
    integer, intent(in) :: N, M 
    real,intent(out) ::  A(:,:), x(:) 
  
 
    integer :: i, j 
  
    do i=1, N
            do j=1, M 
               A(i,j)   = (i-1) * (j+1)  / real( N * M) 
            end do 
            x(i) = (i-1) * (i-1)  / real( N * M ) 
    end do  

end subroutine 

function my_matmul(A, x) result(b) 
   real, intent(in) :: A(:,:), x(:) 
   real :: b(size(A, dim=1))
   
   
   integer N, M, i, j  
   
   N = size(A, dim=1) 
   M = size(A, dim=2) 
           
   b = 0 
   do j=1, M
      do i=1, N
              b(i) = b(i) + A(i,j) * x(j)
      end do 
   end do 

end function 



subroutine  final_cpu_time1(test, t1, b)
       character(len=*), intent(in) :: test 
       real, intent(in) :: t1, b(:) 
  
    real :: t2 
  
    call cpu_time(t2)
    
    write(*,'(A18, A)') "----- Testing... ", test 

    write(*,*) " CPU_time = ", t2-t1 
    write(*,*) "b_1 = ", b(1) 
    write(*,*) "b_M = ", b( size(b) ) 
    write(*,*) 
    
end subroutine     


end module 