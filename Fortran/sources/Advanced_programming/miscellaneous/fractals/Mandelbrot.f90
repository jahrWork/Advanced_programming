
module Mandelbrot

   use dislin 
   implicit none 
   
contains 
    
function Mandelbrot_set(x0, xf, y0, yf, N) result(R) 
               real, intent(in) :: x0, xf, y0, yf  
               integer, intent(in) :: N
               real :: R(N,N) 
               
    integer :: i, j, k 
    real :: x, y
    complex :: z, c 
         
    do i=1, N 
        do j= 1, N 
            x = x0 + (xf-x0)*i/real(N) 
            y = y0 + (yf-y0)*j/real(N) 
            c = cmplx(x, y) 
            z = 0 
            do k=1, 1000
                z = z**2 + c  
                if (abs(z)>2) exit 
            end do 
            R(i,j) = abs(z)
        end do 
    end do 
    
end function


subroutine plot_Mandelbrot_set(x0, xf, y0, yf)  
            real, intent(in) :: x0, xf, y0, yf 
            
    integer, parameter ::  N  = 500 
    real :: set(N,N) 
   
    set = Mandelbrot_set(x0, xf, y0, yf, N) 
    
    call scrmod("reverse")
    call metafl("xwin")
    call disini 
    call axslen(1500, 1500)
    call autres(N, N)
    call graf3(x0, xf, x0, (xf-x0)/5, y0, yf, y0, (yf-y0)/5, 0., 2., 0., 0.1)
    call crvmat(set, N, N, 1, 1)
    call disfin 
    
 

end subroutine     
    
subroutine  plot_Mandelbrot_example 

    call plot_Mandelbrot_set(x0 = -1.5, xf = 1., y0 = -1., yf = 1. ) 
    
    call plot_Mandelbrot_set(x0 = -0.15, xf = -0.05, y0 = 0.8, yf = 0.9 ) 
   

end subroutine    


end module 