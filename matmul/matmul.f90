!  
    program tests_matmul

    use ISO_C_BINDING
    use ISO_FORTRAN_ENV
  
    implicit none
   
   
call test_matmul 
 
contains 
    
       
    
subroutine test_matmul  
        
integer, parameter :: N = 5000
integer, parameter :: M = 5000
integer, parameter ::  TIMES = 1000
integer :: i, j, k, l, Nl, l1, l2, p    
real :: A(N, M), x(N), b(M)

integer, parameter :: bitness = bit_size(0_C_INTPTR_T)
!type(T_SYSTEM_INFO)  :: si
   
integer*8 :: N_operations
real :: t1, t2
  
    
   
   
   write(*,'(*(g0))') 'This is a ',bitness,'-bit system.'
   write(*,'(*(g0))') COMPILER_VERSION()
 
   
   do i=1, N
            do j=1, M 
               A(i,j)   = (i-1) * (j+1)  / real( N * M) 
            end do 
            x(i) = (i-1) * (i-1)  / real( N * M ) 
    end do  
    
    call CPU_TIME(t1)
    do k=0, TIMES  
            b = matmul(A, x) 
      !     write(*,*) k
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
        
    !    write(*,*) k
    end do 
    call CPU_TIME(t2)
    write(*,*) " CPU = ", t2-t1 
    write(*,*) "b_1 = ", b(1) 
    write(*,*) "b_M = ", b(M) 
    
    N_operations = 2 * N * M * real(TIMES)
    
    write(*,*) "----Memory speed ----"
    call system("wmic memorychip get devicelocator, speed, capacity")
    write(*,*) "----CPU speed ----"
    call system("wmic cpu get name, maxclockspeed, currentclockspeed")
   
    write(*,*) "----------Theoretical CPU time ---------" 
    write(*,*) "CPU_time = (N_operations/16)/ 4GhZ * 4cycles,vectorization 512 bits"
    write(*,*) "CPU_time (seconds)=  " , N_operations / ( 4e9*16  )  * 4 
    
    
    read(*,*)
        
end subroutine

end program

