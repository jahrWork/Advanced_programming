module polygon_class
    
    implicit none
    private 
    public :: polygon
    
    type polygon 
        
       integer :: color 
       integer :: N_sides 
       real, allocatable :: length(:)  
    contains 
     
     procedure :: perimeter 
     
    end type 
    
!   constructor
    interface polygon   
        procedure :: polygon_constructor
    end interface
    
    contains 
    
    function  polygon_constructor(sides) result(P)
            real, intent(in) :: sides(:)  
            type (polygon) :: P
            
             integer :: N 
             
             N = size( sides ) 
             write(*,*) " N = ", N 
            
             P % N_sides   = N 
             allocate ( P % length(N) ) 
             
             P % length = sides 
                  
     end function 
     
    real function  perimeter(this) 
        class(polygon) :: this 
         
               perimeter = sum ( this % length )   
    end function
    

end module 
    
   