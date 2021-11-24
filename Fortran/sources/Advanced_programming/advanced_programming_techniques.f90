module advanced_programming_techniques  
    
     
    use scope_example, only         : scope_public_private_example
    use polymorphism, only          : polymorphism_example
    use vectors_and_matrices, only  : dot_product_examples, matmul_examples, greatest_difference
    use First_class_functions, only : function_examples  
    use functions, only             : derivative_examples  
    use mapping, only               : mapping_example    
    use map_filter_reduce, only     : test_map_filter_reduce
    use N_body_problem, only        : Integrate_NBP
    use Fourier, only               : Fourier_examples
    
    use Wrappers, only              : Wrapper_examples
    use Mandelbrot, only            : plot_Mandelbrot_example   
    use VonKoch, only               : plot_VonKoch
    use Sudoku, only                : sudoku_examples
    
    
contains 
 
subroutine menu_advanced_programming_techniques 
   
integer :: option 

option = 1     
do while (option>0) 
    
     write(*,*) 
     write(*,*) "Advanced programming techniques" 
     
     write(*,*) " select an option " 
     write(*,*) " 0. exit/quit  "
     write(*,*) " 1. main program, modules,scope, private and public " 
     write(*,*) " 3. Objects and polymorphism  "
     write(*,*) " 4. Vectors and matrices  " 
     write(*,*) " 5. First class functions. Integrals and moments   " 
     write(*,*) " 6. Functional programming: map, filter and reduce  " 
     write(*,*) " 7. Pointers and different views of data. N body problem "  
     write(*,*) " 8. Fourier series examples    "
     write(*,*) " 9. Wrappers  "
     write(*,*) " 10. Fractals  "
     write(*,*) " 11. Games  "

     read(*,*) option   
     
    select case(option)
     case(1) 
          call scope_public_private_example
            
     case(3) 
         call polymorphism_example
         
     case(4)      
          call dot_product_examples
          call matmul_examples
          call greatest_difference 
     
     case(5) 
         call Function_examples  
         call derivative_examples
         
         
     case(6) 
         call test_map_filter_reduce
         call mapping_example
         
     case(7) 
         call Integrate_NBP
         
     case(8)
         call Fourier_examples 
      
     case(9) 
         call Wrapper_examples
         
     case(10) 
         call plot_VonKoch
         call plot_Mandelbrot_example 
         
      case(11) 
         call sudoku_examples
      
          case default
           write(*,*) " option not implemented" 
              
     end select 
     
end do

end subroutine

    
end module 
    
    