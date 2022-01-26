module fortran

     implicit none 
     
     
     contains
     
     
     function my_sum( V ) result(S) 
       real, intent(in) :: V(:) 
       real :: S
       
       
       S = sum(V) 
       
     end function 
     
     
 end module 
       
