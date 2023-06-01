module CPU_specifications 
    
    implicit none 
    
    contains 
    
 

subroutine CPU_specifications_and_compiler(N_operations) 
    
    use ISO_C_BINDING
    use ISO_FORTRAN_ENV
    integer(kind=8), intent(in) :: N_operations
   
    integer, parameter :: bitness = bit_size(0_C_INTPTR_T)
  
   
    write(*,*) "----Compiler and OS ----"
    write(*,'(*(g0))') 'This is a ',bitness,'-bit system.'
    write(*,'(*(g0))') COMPILER_VERSION()
    write(*,*) 
   
   
    
    write(*,*) "----Memory speed ----"
    call system("wmic memorychip get devicelocator, speed, capacity")
    write(*,*) "----CPU speed ----"
    call system("wmic cpu get name, maxclockspeed, currentclockspeed")
   
    write(*,*) "----------Theoretical CPU time ---------" 
    write(*,*) "CPU_time = (N_operations/16)/ 4GhZ * 4cycles,vectorization 512 bits"
    write(*,*) "CPU_time (seconds)=  " , N_operations / ( 4e9*16  )  * 4 
    write(*,*)
   
end subroutine    


    
end module 
    