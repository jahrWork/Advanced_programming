module advanced_programming 
    
     
    use scope_example, only         : scope_public_private_example
    use polymorphism, only          : polymorphism_example
    use polymorphic_ODES, only      : complex_ODES
    use First_class_functions, only : function_examples, referential_transparency  
    use functions, only             : derivative_examples  
    use mapping, only               : mapping_example    
    use map_filter_reduce, only     : test_map_filter_reduce, test_rotation, test_filter_reduce
    use overloading, only           : test_integral 
    use pointers, only              : pointer_examples
    use N_body_problem, only        : Integrate_NBP

    
    use Wrappers, only              : Wrapper_examples
    use Mandelbrot, only            : plot_Mandelbrot_example   
    use VonKoch, only               : plot_VonKoch
    use Sudoku, only                : sudoku_examples
    
    
contains 
 
subroutine menu_advanced_programming 
   
integer :: option 

do ! Advanced programming menu
    
     write(*,'(/,A)') "Advanced programming techniques" 
     write(*,*) " select an option " 
     write(*,*) " 0. exit/quit  "
     write(*,*) " 1. Scope, private and public " 
     write(*,*) " 2. Functional programming " 
     write(*,*) " 3. Overloading " 
     write(*,*) " 4. Object Oriented Programming"
     write(*,*) " 5. Pointers and different views of data. N body problem "  
     write(*,*) " 6. Wrappers  "
     write(*,*) " 7. Calling Python from Fortran " 
     write(*,*) " 8. Examples: fractals, games   "

     read(*,*) option   
     
    select case(option)
     case(0) 
          exit
        
     case(1) 
          call scope_public_private_example
   
     case(2) 
         call Function_examples  
         call derivative_examples
         call test_map_filter_reduce
         call mapping_example
         call test_rotation
         call test_filter_reduce 
         call referential_transparency
         
         
     case(3)  
         call test_Integral 
                 
     case(4)
         call polymorphism_example
         call complex_ODES
         
     case(5) 
         call pointer_examples
         call Integrate_NBP
         
      
     case(6) 
         call Wrapper_examples
         
      case(7) 
     !    call calling_Python_from_Fortran_examples    
         
     case(8) 
         call plot_VonKoch
         call plot_Mandelbrot_example 
         call sudoku_examples
         
     case(11) 
         
          case default
           write(*,*) " option not implemented" 
              
     end select 
     
end do

end subroutine

    
end module 
    
    