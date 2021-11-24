module VonKoch 

   use dislin 
   implicit none 
   real :: PI = 4 * atan(1.) 

contains 
    
recursive subroutine VonKoch_curve(xi, xf, n)
               real, intent(in) :: xi(:), xf(:) 
               integer, intent(in) :: n 
               
     real :: R(2), alpha, x1(2), x2(2), x3(2)  
               
    if (n == 0) then 
        
        call curve( [ xi(1), xf(1) ], [ xi(2), xf(2) ], 2)
        
    else 
        x1 = xi + (xf - xi) / 3.0
        x3 = xf - (xf - xi) / 3.0
       
        R = x3 - x1
        alpha = atan2( R(2), R(1) ) + PI / 3.0
        x2 = x1 + norm2(R) * [ cos(alpha), sin(alpha) ]

        call VonKoch_curve(xi, x1, n - 1)
        call VonKoch_curve(x1, x2, n - 1)
        call VonKoch_curve(x2, x3, n - 1)
        call VonKoch_curve(x3, xf, n - 1)
        
    end if 
    
end subroutine 

subroutine  plot_VonKoch

    real :: H = 1 
    integer ::  N  = 5 

    call scrmod("reverse")
    call metafl("xwin")
    call disini 
    call graf(0., 1., 0., 0.2, -0.1, 0.4, -0.1, 0.2)
    call VonKoch_curve([0.,0.], [H,0.], N)
    call disfin 
 

end subroutine     
    

end module 
