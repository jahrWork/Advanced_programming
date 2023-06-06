module CPU_specifications 
    
    implicit none 
    
    contains 
    
 

subroutine CPU_specifications_and_compiler(N_operations, single_precission, parallel) 
    
    use ISO_C_BINDING
    use ISO_FORTRAN_ENV
    integer(kind=8), intent(in) :: N_operations
    logical, intent(in) :: single_precission, parallel  
   
    integer, parameter :: bitness = bit_size(0_C_INTPTR_T)
    real :: time 
    integer :: N_threads, N_cores  
  
   
    write(*,*) "----Compiler and OS ----"
    write(*,'(*(g0))') 'This is a ',bitness,'-bit system.'
    write(*,'(*(g0))') COMPILER_VERSION()
    write(*,*) 
   
   
    
    write(*,*) "----Memory speed ----"
    call system("wmic memorychip get devicelocator, speed, capacity")
    write(*,*) "----CPU speed ----"
    call system("wmic cpu get name, maxclockspeed, currentclockspeed")
   
    write(*,*) "----------Theoretical CPU time ---------" 
    write(*,*) "CPU_time = Max Operations per cycle / CPU speed (4GhZ) * 4 cycles per operation"
    
    if (parallel) then 
        write(*,*) "Operations are done in parallel"  
        N_threads = Number_of_threads()
        N_cores = N_threads / 2 
        write(*,*) "Number of threads: ", N_threads 
       
        
    else 
        write(*,*) "Operations are done in a single core" 
        N_threads = 1 
        N_cores = 1 
        write(*,*) "Number of threads: ", N_threads 
        
    end if 
    
        
    
    
    if (single_precission) then  
        write(*,*) "Operations are done in single precission: 4 bytes" 
        write(*,*) "A 512 bits vector channel performs 16 operations per clock cycle"
        time = (N_operations/16) / ( 4e9 ) * 4  / N_cores 
    else 
        write(*,*) "Operations are done in double precission: 8 bytes" 
        write(*,*) "A 512 bits vector channel performs  8 operations per clock cycle"
        time = (N_operations/8) / ( 4e9 ) * 4  / N_cores
    end if 
    
    
    write(*,*) "CPU_time (seconds)=  " , time  
    write(*,*)
   
end subroutine  

function Number_of_threads() result(N_threads)  
     
  use OMP_LIB
  integer :: N_threads
  
      !$omp parallel 
        N_threads = OMP_GET_NUM_THREADS()
      !$omp end parallel 
      

end function





    
end module 
    