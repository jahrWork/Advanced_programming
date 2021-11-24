 module square_class    
    
    use polygon_class 
    implicit none
    private 
    public :: square
   
    type, extends(polygon) :: square
    end type 
    
    interface square
         procedure :: square_constructor
   end interface  
       
    contains 
    
    function  square_constructor(L) result(S) 
             real, intent(in) :: L
             type (square) :: S   
            
             S % N_sides = 4 
             S % length = [L, L, L, L]
            
    end function 
    
   
 end module 
    