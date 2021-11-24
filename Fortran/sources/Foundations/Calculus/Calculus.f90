module Calculus 
    
    implicit none 
    
  ! f: R --> R   
    interface 
     function f_R_R(x) result(f)
        real, intent(in) :: x 
        real :: f 
      end function 
    end interface 
   

    
contains 


function Derivative( f, x ) result(df)
 procedure (f_R_R) :: f 
 real, intent(in) :: x 
 real :: df 
 
    real :: h = 1e-5 
    
      df = ( f(x+h) - f(x) ) / h  ! lim h->0 ( f(x+h) - f(x) )/h 
   
end function 

function Integral( f, a, b ) result(I)
 procedure (f_R_R) :: f 
 real, intent(in) :: a, b 
 real :: I  
 
    integer :: k, M  
    real :: dx
     
      dx = 1e-3 
      M = abs(b-a)/dx 
      dx = (b-a)/M 
           
      I = dx * sum ( [( f(a+dx*k), k=0, M-1) ] ) 
   
end function 


end module
  