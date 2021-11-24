module circle_class
    
    use polygon_class 
    implicit none
    private 
    public :: circle
        
    
    type, extends(polygon) :: circle
       real :: R 
    contains 
    
         procedure :: perimeter
         
   end type
    
    interface circle 
         procedure ::  circle_constructor
   end interface  
       
    contains 
    
     function  circle_constructor(R) result(C) 
            real, intent(in) :: R  
            type(circle) :: C  
         
            C % R = R  
            
     end function     
       
     real function  perimeter(this) 
           class(circle) :: this 
         
           real, parameter :: PI = 4 * atan(1.) 
           
            perimeter = 2 * PI * this % R  
                
     end function 
    
    
    end module 
    