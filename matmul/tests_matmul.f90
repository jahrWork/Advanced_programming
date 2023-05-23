!  
    program tests_matmul

    implicit none
  
   
call test_matmul 
 
contains 
    
subroutine test_matmul  
        
integer, parameter :: N = 5000
integer, parameter :: M =  5000
integer, parameter ::  TIMES = 1000
integer :: i, j, k, l, Nl, l1, l2, p    
real, target  :: A(N, M), AT(M,N), x(N), b(M), v(M), s(N)  
real, pointer :: pA(:) 

    
    real :: t1, t2
    !real ::  s  
  
    pA(1:N*M) => A(1:N, 1:M) 
    
    
    
    do i=1, N
            do j=1, M 
               A(i,j)   = (i-1) * (j+1)  / real( N * M) 
            end do 
            x(i) = (i-1) * (i-1)  / real( N * M ) 
    end do  
    
    !
    !call CPU_TIME(t1)
    !do k=0, TIMES 
    !    b =  matmul(A, x) 
    !end do 
    !call CPU_TIME(t2)
    !write(*,*) " matmul CPU = ", t2-t1 
    !write(*,*) "b_1 = ", b(1) 
    !write(*,*) "b_M = ", b(M) 
    !
    !call CPU_TIME(t1)
    !
    !call CPU_TIME(t1)
    !do k=0, TIMES 
    !    b(1:N/2) =  matmul(A(1:N/2, :),  x) 
    !    b(N/2+1:N) =  matmul(A(N/2+1:N, :),  x) 
    !end do 
    !call CPU_TIME(t2)
    !write(*,*) " 2 matmul CPU = ", t2-t1 
    !write(*,*) "b_1 = ", b(1) 
    !write(*,*) "b_M = ", b(M) 
    !
    !call CPU_TIME(t1)
    !Nl = 20 
    !p = N / Nl 
    !do k=0, TIMES
    !     l1 = 1
    !     l2 = p 
    !    do l=1, Nl 
    !    !  write(*,*) l, l1, l2    
    !      b(l1:l2) =  matmul(A(l1:l2, :),  x) 
    !      l1 = l1 + p
    !      l2 = l1 + p - 1 
    !    end do 
    !end do 
    !call CPU_TIME(t2)
    !write(*,*) " Nl matmul CPU = ", t2-t1 
    !write(*,*) "b_1 = ", b(1) 
    !write(*,*) "b_M = ", b(M) 
    !
    !stop 
    
    !call CPU_TIME(t1)
    !Nl = 10 
    !do k=0, TIMES 
    !    do i=1, N
    !      b(i) =  dot_product(A(i, :),  x) 
    !    end do 
    !    write(*,*) k
    !end do 
    !call CPU_TIME(t2)
    !write(*,*) " dot_product CPU = ", t2-t1 
    !write(*,*) "b_1 = ", b(1) 
    !write(*,*) "b_M = ", b(M) 
    !
    !stop 
    
    call CPU_TIME(t1)
    do k=0, TIMES  
            b = matmul(A, x) 
            write(*,*) k
    end do 
    call CPU_TIME(t2)
    write(*,*) " CPU = ", t2-t1 
    write(*,*) "b_1 = ", b(1) 
    write(*,*) "b_M = ", b(M) 
    
    
    call CPU_TIME(t1) 
    do k=0, TIMES  
        
        b = 0 
        do j=1, M
            
          do i=1, N
              b(i) = b(i) + A(i,j) * x(j)
          end do 
          
        end do 
        
        write(*,*) k
    end do 
    call CPU_TIME(t2)
    write(*,*) " CPU = ", t2-t1 
    write(*,*) "b_1 = ", b(1) 
    write(*,*) "b_M = ", b(M) 
    
    
        
end subroutine

end program

