!
program main
   
    use CPU_specifications  
    use matmul_benchmark
    use vectorized_and_parallelized_series
   
    implicit none
     
    integer :: option 
    integer (kind=8) :: N 
    
    N = 2.**34 
     
    
do 
     write(*,'(/, A)') "Welcome to High Performing Computing" 
     
     write(*,*) " select an option " 
     write(*,*) " 0. exit/quit  "
     write(*,*) " 1. CPU characteristics" 
     write(*,*) " 2. Sum of series  " 
     write(*,*) " 3. matmul benchmark "
     read(*,*) option   
     
    select case(option)
        
     case(0) 
          exit
          
     case(1) 
          call CPU_specifications_and_compiler
         
     case(2)  
         call test_series(N)
            
     case(3) 
         call test_matmul 
         
         case default
           write(*,*) " option not implemented" 
              
     end select 
     
end do
    



end program

