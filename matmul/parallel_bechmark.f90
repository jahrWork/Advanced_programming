!
program parallel_benchmark
   
    
    use parallel_matmul
    use parallel_series
    use CPU_specifications  
    implicit none
    
    integer(kind=8) ::  Nop, Ms   
    
   
  call test_matmul_single_core(Nop)  
   
  call CPU_specifications_and_compiler(N_operations = Nop, single_precission =.true., parallel = .false.) 
 
   
   Ms = 2.**38 
   Nop = 3 * M 
   
   call sum_series_with_different_threads(Ms) 
   call CPU_specifications_and_compiler(N_operations = Nop, single_precission =.false., parallel = .true. ) 

   call sum_series_single_core(M) 
   call CPU_specifications_and_compiler(N_operations = Nop, single_precission =.false., parallel = .false. ) 
  
   write(*,*) "Press enter"
   read(*,*) 

end program

