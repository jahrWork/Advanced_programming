!
program parallel_benchmark
   
    
    use parallel_matmul
    use parallel_series
    use CPU_specifications  
    implicit none
    
    integer(kind=8) ::  N_operations, M   
    
   
  call test_matmul_single_core(N_operations)  
   
  call CPU_specifications_and_compiler(N_operations) 
 
   
   M = 2.**38
   call sum_series_with_different_threads(M) 
   call sum_series_single_core(M) 



end program

