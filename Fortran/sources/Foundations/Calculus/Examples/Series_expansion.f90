module Series_expansion 
    
    use Series, only : factorial
    use Taylor_expansions, only : Taylor 
    use plotting, only : plot, plot_ini, plot_show, disfin, color 
    implicit none
    
    real, parameter :: PI = 4 * atan(1.) 
    
  
    
    
contains

subroutine Taylor_expansion_examples()

     integer :: i, M ! last term of Taylor expansion 
     character (len=20) :: colors(7) = [ 'BLACK', 'RED', 'GREEN', 'BLUE', 'CYAN', 'ORANGE', 'MAGENTA' ]
      
  !  Association: N is dummy argument, 4 is actual argument 
     write(*,*) " Taylor exp(1.) x0=0   :", Taylor( df = dkexp, x0 = 0., x = 1., N = 1) 
     write(*,*) " Taylor exp(1.) x0=0   :", Taylor( df = dkexp, x0 = 0., x = 1., N = 4) 
     write(*,*) " Taylor exp(1.) x0=0   :", Taylor( df = dkexp, x0 = 0., x = 1., eps = 1d-7 )
     
     
     call plot_ini(0., 2*PI, -2., 2.) 
     call plot( cosine ) 
     call color("red")
     M = 10 
     call plot( Taylor_cosine )
     call disfin                  
     
     call plot_ini(-0.9, 0.9, 0., 5.) 
     call plot( fractional )  
     call color("red") 
     call plot( Taylor_fractional ) 
     call disfin 
     
     call plot_ini(0., 2*PI, -2., 2.) 
     call plot( cosine )  
     do i=1, 26, 4  
        call color( colors(i/4+1)) 
        M = i
        call plot( Taylor_cosine ) 
     end do 
     call disfin 
     
contains 

function Taylor_cosine(x) result(f) 
      real, intent(in) :: x 
      real :: f 
      
        f = Taylor( df = d_cosine, x0 = 0., x = x, N = M ) 
        
end function    
     
end subroutine     
      
    
 function d_cosine(x, k) result(dk) 
      real, intent(in) :: x 
      integer, intent(in) :: k 
      real :: dk  
      
        complex :: I = (0., 1.) 
        
        ! Z = exp( I * x)             = cos(x) + I sin(x) 
        ! Zk = (I)**k * exp( I * x )  = dk( cos(x) )/dxk + I dk( sin(x) ) /dxk 
        ! Z'= I * exp( I * x) 
        ! Zk = (I)**k * exp( I * x ) 
      
        dk = real ( I**k * exp( I * x) ) ! cosine 
        
end function   

function cosine(x) result(h) 
      real, intent(in) :: x 
      real :: h 
      
        h = cos( x) 
        
end function

function Taylor_fractional(x) result(f) 
      real, intent(in) :: x 
      real :: f
      
        f = Taylor( df = d_fractional, x0 = 0., x = x, N = 5 ) 
        
end function    
    
 function d_fractional(x, k) result(dk) 
      real, intent(in) :: x 
      integer, intent(in) :: k 
      real :: dk  
            
     ! f(x) = 1/ ( 1 - x) 
     ! f' = + 1 / ( 1 - x ) **2 
     ! fk = k! (1-x)**(-k-1)  
     ! k! = gamma(k+1) 
       dk =  gamma( real(k+1) ) * ( 1 - x ) **(-k-1) 
        
end function   

function fractional(x) result(h) 
      real, intent(in) :: x 
      real :: h 
      
        h = 1 / ( 1 - x ) 
        
end function

function exponential(x) result(h) 
      real, intent(in) :: x 
      real :: h 
      
        h = exp( x) 
        
end function
  
function dkexp(x, k) result(dk) 
      real, intent(in) :: x 
      integer, intent(in) :: k 
      real :: dk  
      
        dk = exp( x) 
        
end function

function dksinh(x, k) result(dk) 
      real, intent(in) :: x 
      integer, intent(in) :: k 
      real :: dk  
      
      if ( mod(k, 2) == 0 ) then 
          dk = sinh(x) 
      else 
          dk = cosh(x) 
      end if  
        
end function
  

end module   