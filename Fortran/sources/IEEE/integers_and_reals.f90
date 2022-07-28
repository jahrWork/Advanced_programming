
module integers_and_reals

    use Integer_representation
    use Round_off
    use summation_errors 
    use IEEE_representation
    use IEEE_operations
    implicit none

    
contains    
    


subroutine menu_Integers_and_reals 

    integer :: option 
    real (kind=4) :: x      ! single precision  
    real (kind=8) :: xd     ! double precision 
    real (kind=16) :: xdd   ! quaduple precision 
    integer (kind=8) :: i8      ! 8-byte size
    
  
 do
     
    write(*,*) " select an option  "
    write(*,*) " 0. Exit " 
    write(*,*) " 1. Integer overflow  "
    write(*,*) " 2. Understanding integer overflows  "
    write(*,*) " 3. Overflow by incorrect assignment  "
    write(*,*) " 4. Two's complement converter  "
    write(*,*) " 5. IEEE reals representation  "
    write(*,*) " 6. Round off errors in operations  "
    write(*,*) " 7. Loss of precision "
    write(*,*) " 8. Catastrophic cancellation "
    write(*,*) " 9. Summation errors "
    write(*,*) " 10. IEEE exceptions "
    read(*,*) option 

    select case(option) 
        
    case(0) 
        exit 
    
    case(1) ! INTEGERS CHAPTER 
        call Integer_overflow  
        call Factorial_overflow
       
    case(2) 
      i8 =  130;  call Integer_representation_twos_complement("kind=1", i8)
      i8 =  130;  call Integer_representation_twos_complement("kind=2", i8) 
      i8 =  130;  call Integer_representation_twos_complement("kind=4", i8)
      i8 =  130;  call Integer_representation_twos_complement("kind=8", i8) 
      
      i8 =  -130;  call Integer_representation_twos_complement("kind=1", i8)
      i8 =  -130;  call Integer_representation_twos_complement("kind=2", i8) 
      i8 =  -130;  call Integer_representation_twos_complement("kind=4", i8)
      i8 =  -130;  call Integer_representation_twos_complement("kind=8", i8) 
      
    case(3)
        call Assignment_overflow
        
    case(4)
        call TwosCompl_int_converter
        
     
    case(5)  ! REALS CHAPTER 
      ! Extend precison of single-precision constants : Compiler YES /fpconstant 
        x = 0.1;      call IEEE_real_representation(x)  
        xd = 0.1;     call IEEE_real_representation(xd) 
        xdd = 0.1Q0;  call IEEE_real_representation(xdd)
        
    case(6)
         call errors_in_operations
        
    case(7)
       
        call loss_of_precision
        
    case(8)
        call catastrophic_cancellation      
    
    case(9)
        call summation_example 
        
    case(10)
        call IEEE_exception_examples
        
    case default
        write(*,*) "Option not implemented" 
        
    end select
    
 end do 
 
 
end subroutine     
    
end module 

