module parallel_series 
     
    implicit none 
    
    
contains 
    

subroutine sum_series_with_different_threads( N ) 
   use OMP_LIB 
   integer(kind=8), intent(in) :: N 
   
  integer :: N_threads, i_thread
  integer(kind=8) :: i
  real (kind=8) :: S, S_t
  integer :: it1 
  
 
  call system_clock(it1)
 
  S_t = 0 
  !$omp parallel private(i_thread, i, S) 
 
   N_threads = OMP_GET_NUM_THREADS()
   i_thread = OMP_GET_THREAD_NUM()
 
   S = 0 
   !$omp do 
   do i=N, 1, -1
     
       S = S + 1/real(i, kind=8)**2
       
       !if (i_thread==7 ) then 
       !      write(*,*) "From thread =", i_thread, i, S, 1d0 /i**2 
       !end if 
       
   end do 
   
   write(*,*) i_thread, " S = ", S 
   S_t = S_t + S 
   
   !$omp end parallel
   
   call final_cpu_time("sum series multicore", it1, S_t, N)
  
 
end subroutine

subroutine sum_series_single_core( N ) 
   integer(kind=8), intent(in) :: N 
    
  integer(kind=8) :: i
  real (kind=8) :: S_t
  integer :: it1 
  
 
  call system_clock(it1)
  
  S_t = 0 
  do i=N, 1, -1
     
       S_t = S_t + 1/real(i, kind=8)**2
       
   end do 
   
   call final_cpu_time("sum series single core", it1, S_t, N)
  
   
 
end subroutine
 
subroutine  final_cpu_time(test, it1, S_t, N)
       character(len=*), intent(in) :: test 
       integer, intent(in) :: it1  
       real(kind=8), intent(in) :: S_t  
       integer(kind=8), intent(in) :: N 
       
        real (kind=8) ::  Error, PI = 4*atan(1d0)
   
  
    integer  :: it2, rate 
    
    call system_clock(count_rate=rate)
    call system_clock(it2)
    
    write(*,*) 
    write(*,'(A18, A)') "----- Testing... ", test 

    write(*,*) " CPU_time = ", real(it2-it1)/rate 
    write(*,*) "S_t = ", S_t
    Error = PI**2/6 - S_t 
    write (*,*) "Error=         ", Error 
    write (*,*) "Error bound =         ", 1d0/N  
    write(*,*) 
    
       
end subroutine     
    
    
    
    
end module 
    