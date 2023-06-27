module CPU_specifications 
    
    implicit none 
    
    contains 
    
 

subroutine CPU_specifications_and_compiler
    
    use ISO_C_BINDING
    use ISO_FORTRAN_ENV
   
   
    integer, parameter :: bitness = bit_size(0_C_INTPTR_T)
    real :: time 
    integer :: N_cores, N_threads   
  
   
    write(*,*) "-------------Compiler and OS ---------------"
    write(*,'(*(g0))') 'This is a ',bitness,'-bit system.'
    write(*,'(*(g0))') COMPILER_VERSION()
    write(*,*) "--------------------------------------------"
    write(*,*) 
   
    
    write(*,*) "--------------Memory speed -----------------"
    call system("wmic memorychip get devicelocator, speed, capacity")
    write(*,*) "--------------CPU speed --------------------"
    call system("wmic cpu get name, maxclockspeed, currentclockspeed")
   
    write(*,*) "---------------Number of cores-----------------"
    N_threads = Number_of_threads() 
    write(*,*) "Number of threads: ", N_threads 
    write(*,*) "----------------------------------------------"

   
end subroutine  

function Number_of_threads() result(N_threads)  
     
  use OMP_LIB
  integer :: N_threads
  
      !$omp parallel 
        N_threads = OMP_GET_NUM_THREADS()
      !$omp end parallel 
      

end function



!subroutine Theoretical_CPU_time(N_threads, N_operations, single_precission) 
!    
!    use ISO_C_BINDING
!    use ISO_FORTRAN_ENV
!    integer(kind=8), intent(in) :: N_operations, N_threads
!    logical, intent(in) :: single_precission
!   
!   
!    real :: time 
!    integer :: N_cores  
!  
!    
!    write(*,*) "---------------Theoretical CPU time ----------------" 
!    write(*,*) "CPU_time = Max Operations per cycle / CPU speed (4GhZ) * 4 cycles per operation"
!    
!   
!    write(*,*) "Operations are done in parallel"  
!    N_cores = N_threads / 2 
!    write(*,*) "Number of threads: ", N_threads 
!       
!    
!    
!    
!    if (single_precission) then  
!        write(*,*) "Operations are done in single precission: 4 bytes" 
!        write(*,*) "A 512 bits vector channel performs 16 operations per clock cycle"
!        time = (N_operations/16) / ( 4e9 ) * 4  / N_cores 
!    else 
!        write(*,*) "Operations are done in double precission: 8 bytes" 
!        write(*,*) "A 512 bits vector channel performs  8 operations per clock cycle"
!        time = (N_operations/8) / ( 4e9 ) * 4  / N_cores
!    end if 
!    
!    
!    write(*,*) "CPU_time (seconds)=  " , time  
!    write(*,*) "----------------------------------------------------" 
!    write(*,*)
!   
!end subroutine  



subroutine  print_CPU_time(single_precision, start_time, N_operations, N_threads)
    logical, intent(in) :: single_precision 
    integer, intent(in) :: start_time 
    integer(kind=8), intent(in) :: N_operations
    integer, intent(in) ::  N_threads 

    integer :: max_vector  
    character(len=60) :: title
    integer :: end_time, rate 
    
  call system_clock(count_rate=rate)
  call system_clock(end_time)
  
  
  if (single_precision) then 
      
               title =  "Single precision calculations "
               max_vector = 512 / 32 
  else 
               title =  "Double precision calculations "
               max_vector = 512 / 64 
  end if 
  
  
  write(*,*) "_________________________________________________________________"
  write(*,*)  title 
  write(*,*)  "Execution time:", (end_time - start_time)/real(rate), "seconds"
  write(*,*)  "Minimum theoretical CPU time:", 4 * N_operations / ( 4e9 * max_vector * N_threads) , "seconds"
  write(*,*)  "Number of threads:", N_threads 
  write(*,*) "_________________________________________________________________"

end subroutine    

    
end module 
    