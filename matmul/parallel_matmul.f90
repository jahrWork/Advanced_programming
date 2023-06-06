 module parallel_matmul 
    
   implicit none 
   integer, parameter :: N = 500000, M= 50
   real, save :: A(N, M), x(M), b(N)
   !integer, parameter :: M = 5000
  ! real, save, allocatable :: A(:, :), x(:), b(:)
   
   
 contains    
    
subroutine test_matmul_single_core( N_operations ) 
 integer(kind=8), intent(out) :: N_operations 
        
 !real, allocatable :: A(:, :), x(:), b(:)
 integer :: k
 integer :: it1
  
    integer :: TIMES = 1000
   ! allocate( A(N,N), x(N), b(N) ) 
   
    N_operations = 2 * N * M * real(TIMES)
    
    
    call Initialization(N, M, A, x) 
 
   
    call system_clock(it1)
    do k=0, TIMES  
            b = matmul(A, x) 
           !write(*,*) k
    end do 
    call final_cpu_time1("matmul", it1, b) 
   
        
    call system_clock(it1)
    do k=0, TIMES  
        b = my_matmul(A, x) 
    !   write(*,*) k
    end do 
   call final_cpu_time1("my_matmul", it1, b) 
    
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



subroutine  final_cpu_time1(test, it1, b)
       character(len=*), intent(in) :: test 
       integer, intent(in) :: it1
       real, intent(in) :: b(:) 
  
    integer :: it2, rate  
  
   
    call system_clock(count_rate=rate)
    call system_clock(it2)
    
    write(*,'(A18, A)') "----- Testing... ", test 

    write(*,*) " CPU_time = ", real(it2-it1)/rate 
    write(*,*) "b_1 = ", b(1) 
    write(*,*) "b_M = ", b( size(b) ) 
    write(*,*) 
    
end subroutine     


end module 