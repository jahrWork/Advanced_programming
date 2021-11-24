 module plotting 
    
    use dislin 
    implicit none 
    
    interface 
     function f_R_R(x) result(f)
        real, intent(in) :: x 
        real :: f 
      end function 
    end interface 
    
    real :: xmin, xmax,  ymin, ymax 
    
    
contains 
    
 subroutine plot( f ) 
 procedure (f_R_R) :: f 
  
    integer, parameter :: M = 200  
    integer :: i 
    real :: x(0:M), y(0:M)    
    
      x = [ ( xmin + (xmax-xmin)*i/real(M), i=0, M) ] 
      y = [ ( f( x(i) ), i=0, M ) ] 
      
      call curve(x, y, M+1) 
    
end subroutine  
    
subroutine plot_ini( xmin_, xmax_,  ymin_, ymax_ ) 
    real, intent(in) ::  xmin_, xmax_, ymin_, ymax_ 

    xmin = xmin_ 
    xmax = xmax_ 
    ymin = ymin_ 
    ymax = ymax_ 
    
    call metafl("xwin")
    CALL PAGE (4000, 4000)
    call scrmod("reverse")
    call disini  
    call graf(xmin, xmax, xmin, (xmax-xmin)/10, ymin, ymax, ymin, (ymax-ymin)/10) 
   
   
    
end subroutine    
    
subroutine plot_show(  ) 


    call disfin 
    
    call metafl("xwin")
    CALL PAGE (4000, 4000)
    call scrmod("reverse")
    call disini  
    call graf(xmin, xmax, xmin, (xmax-xmin)/10, ymin, ymax, ymin, (ymax-ymin)/10) 
   
   
    
end subroutine    

end module 