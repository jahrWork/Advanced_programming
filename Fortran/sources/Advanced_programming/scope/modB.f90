 module modB 
 
    use modA, only : functionA 
    implicit none 
 
    real :: y = -6
    
    private 
    public :: functionB  
 
contains   
 
real function functionB() result(F) 

   F = y + functionA() 

end function 
 
end module
 
 