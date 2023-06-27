module vectorized_and_parallelized_series 
     
    use omp_lib
    use CPU_specifications 
    implicit none
   
    
    
contains 

subroutine test_series(N) 
   integer(kind=8), intent(in) ::  N    
    
   integer :: option 

do 
    
     
     write(*,*) " select an option " 
     write(*,*) " 0. exit/quit  "
     write(*,*) " 1. Sum of series in single core  " 
     write(*,*) " 2. Sum of series with different number of cores "
     read(*,*) option   
     
    select case(option)
        
     case(0) 
          exit
          
   
         
     case(1)  
         call sum_real8_single_core( N  ) 
            
     case(2) 
         call test_vectorized_and_parallelized_series(N)  
         
         case default
           write(*,*) " option not implemented" 
              
     end select 
     
end do  
    
    
end subroutine 


  
    
    
    
subroutine test_vectorized_and_parallelized_series(N)   
                 integer(kind=8) , intent(in) ::  N 
    
    integer :: N_threads_max, i, imax, Nt  
     
   
    
  N_threads_max = omp_get_max_threads()
  write(*,*) "*********************************************************"
  write(*,*) "Note that sum a numerical series is easily parallelized" 
  write(*,*) "However, vectorization is not completely achieved "
  write(*,*) "Max number of threads =", N_threads_max 
  write(*,*) "*********************************************************"

  imax = log10( real(N_threads_max) ) / log10 (2.) 
  
! sumation with diffeent number of threads Nt  
  do i = imax, 0, - 1 
      Nt = 2 ** i 
      call sum_real8(N = N, N_threads = Nt)
      call sum_real4(N = N, N_threads = Nt)
   end do 
  
  
end subroutine 


subroutine sum_real8_single_core(N) 
     integer(kind=8), intent(in) :: N
  
  integer(kind=8) :: i
 
  real(kind=8), parameter :: pi = 4*atan(1d0) 
  real(kind=8) :: S, an 
  integer :: t0

  write(*,*) " Adding ...  N terms =", N
  call system_clock(t0)
 
   S = 0
   do i = N, 1, -1 
       an = i 
       S = S + 1/an**2
   end do


  call print_CPU_time(single_precision = .false., start_time = t0, N_operations = 3*N, N_threads = 1) 
  write(*,*) " S = ", S, " Error = ", 1d0/N, pi**2/6 - S 
  
end subroutine    
 




subroutine sum_real8(N, N_threads) 
 integer(kind=8), intent(in)  :: N
 integer, intent(in)  :: N_threads
    
  
  integer(kind=8) :: i, N_operations 
  real(kind=8) :: S, an 
  integer :: t0

 call system_clock(t0)
 

  call omp_set_num_threads(N_threads)
  
 
   S = 0
  !$omp parallel do private(i) reduction(+:S)
   do i = N, 1, -1 
       an = i 
       S = S + 1/(an*an) 
   end do
  !$omp end parallel do

  
  call print_CPU_time(single_precision = .false., start_time = t0, N_operations = 3*N, N_threads = N_threads)
  
end subroutine



subroutine sum_real4(N, N_threads) 
 integer(kind=8), intent(in)  :: N
 integer, intent(in)  :: N_threads
    
  
  integer(kind=8) :: i, N_operations 
  real(kind=4) :: S, an 
  integer :: t0

  call system_clock(t0)
 
  call omp_set_num_threads(N_threads)
  
   S = 0
  !$omp parallel do private(i) reduction(+:S)
   do i = N, 1, -1 
       an = i 
       S = S + 1/(an*an) 
   end do
  !$omp end parallel do

  
  call print_CPU_time(single_precision = .true., start_time = t0, N_operations = 3*N, N_threads = N_threads)
  
end subroutine


   
    
 
    
    
    






    
    
!    
!subroutine sum_series_single_core( N ) 
!   integer(kind=8), intent(in) :: N 
!    
!  integer(kind=8) :: i
!  real (kind=8) :: S_t, an 
!  integer :: it1 
!  
! 
!  call system_clock(it1)
!  
!  S_t = 0 
!  do i=N, 1, -1
!       an = i 
!       S_t = S_t + 1/an**2
!       
!   end do 
!   
!   call final_cpu_time("sum series single core", it1, S_t, N)
!  
!   
! 
!end subroutine
!    
!    
!subroutine sum_series_with_different_threads( N ) 
!   use OMP_LIB 
!   integer(kind=8), intent(in) :: N 
!   
!  integer :: N_threads, i_thread
!  integer(kind=8) :: i
!  real (kind=8) :: S, S_t
!  integer :: it1 
!  
! 
!  call system_clock(it1)
! 
!  S_t = 0 
!  !$omp parallel private(i_thread, i, S) 
! 
!   N_threads = OMP_GET_NUM_THREADS()
!   i_thread = OMP_GET_THREAD_NUM()
! 
!   S = 0 
!   !$omp do 
!   do i=N, 1, -1
!     
!       S = S + 1/real(i, kind=8)**2
!       
!       !if (i_thread==7 ) then 
!       !      write(*,*) "From thread =", i_thread, i, S, 1d0 /i**2 
!       !end if 
!       
!   end do 
!   
!   write(*,*) i_thread, " S = ", S 
!   S_t = S_t + S 
!   
!   !$omp end parallel
!   
!   call final_cpu_time("sum series multicore", it1, S_t, N)
!  
! 
!end subroutine
!
! 
!subroutine  final_cpu_time(test, it1, S_t, N)
!       character(len=*), intent(in) :: test 
!       integer, intent(in) :: it1  
!       real(kind=8), intent(in) :: S_t  
!       integer(kind=8), intent(in) :: N 
!       
!        real (kind=8) ::  Error, PI = 4*atan(1d0)
!   
!  
!    integer  :: it2, rate 
!    
!    call system_clock(count_rate=rate)
!    call system_clock(it2)
!    
!    write(*,*) 
!    write(*,'(A18, A)') "----- Testing... ", test 
!
!    write(*,*) " CPU_time = ", real(it2-it1)/rate 
!    write(*,*) "S_t = ", S_t
!    Error = PI**2/6 - S_t 
!    write (*,*) "Error=         ", Error 
!    write (*,*) "Error bound =         ", 1d0/N  
!    write(*,*) 
!    
!       
!end subroutine     
!    
!    
    
    
end module 
    