 module modA
 
    implicit none
 
    real :: x = -5  
    
    private 
    public :: functionA  

contains     
    
real function functionA() result(F) 

   F =  x 

end function    
        
end module 
 
