Program parallel_examples
    
    use matrix_multiplication
    use Series_with_coarrays
    implicit none 
    
    !if (this_image() == 1) write(*,*) " Hello " 
    !stop 
    
    call example_Series_with_coarrays
    stop
    
    call test_matmul
    stop 
    
    
    
    
    call example_parallel_matmul
    
end program 