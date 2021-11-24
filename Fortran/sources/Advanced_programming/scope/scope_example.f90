module scope_example
    
    use modB, only :  functionB  
    implicit none 
    
    private 
    public :: scope_public_private_example
    
    real, parameter :: x = 444

    contains 
    
subroutine scope_public_private_example 
 
     real :: y = 333  
     
     
     write(*,*) " Example of global and local variables"
     write(*,*)
     write(*,*) "________________"
     write(*,*) " y is a local variable specified in a subroutine" 
     write(*,*) " y = ", y 
     
     write(*,*) "________________"
     write(*,*) " x is a global variable specified in a module" 
     write(*,*) " x = ", x 
     write(*,*) "________________" 
     
    ! x = 1234
      write(*,*) " x = ", x 
     
     
     write(*,*)
     write(*,*) " Example of public functions"
     write(*,*) " FunctionB is public in module B" 
     write(*,*) " FunctionB value =  ", FunctionB() 
     write(*,*) 
     write(*,*) " FunctionB uses moduleA which has a public FunctionA  " 
     write(*,*) " Inside modA and modB are different variables named x and y " 
     write(*,*) "________________"
    
     
 
end subroutine 

end module 