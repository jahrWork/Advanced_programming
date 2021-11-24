module ODE_Interface

abstract interface 

  function ODES( U, t) 
    
         real :: U(:), t 
         real :: ODES( size(U) ) 
      
  end function 
    
end interface  

end module 
    