Program parallel_examples
    
    use matrix_multiplication
    use Series_with_coarrays
    implicit none 
    
    
    call test_matmul
    stop 
    
    call example_Series_with_coarrays
    stop 
    
    
    call example_parallel_matmul
    
end program 