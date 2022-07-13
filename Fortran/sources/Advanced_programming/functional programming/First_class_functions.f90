module First_class_functions 
    
    implicit none 
    
    abstract interface 
      elemental real function  f_R_R(x)
        real, intent(in) :: x 
      end function 
    end interface 
    
    abstract interface 
      real function  g_R_R(x)
        real, intent(in) :: x 
      end function 
    end interface 
    
   type :: pointer_f
      procedure(g_R_R), pointer, nopass :: p
   end type     
     
     
   type :: compose
       procedure(g_R_R), pointer, nopass :: f, g
         
   contains
         procedure ::  hc 
   end type


   interface compose
     procedure :: compose_constructor
   end interface 


     
contains
    
 
    
    subroutine Function_examples 
    
       real :: R 
       
      write(*,*) " First class functions. Integrals and moments   " 
       
    ! Integral of f(x) from a to b 
      R = Integral(h, 0., 1.) 
      write(*,*) 
      write(*,*) " Integral of h(x) from 0 to 1  =", R 
      
    
    ! Integral of x**n f(x) from a to b based on Integral 
      R = Moment(h, 3, 0., 1.) 
      write(*,*) " Integral of x**3 * h(x) from 0 to 1  =", R  
      write(*,*) 
      
    end subroutine
    
    pure real function Integral(f, a, b) 
       procedure (f_R_R) :: f 
       real,intent(in) :: a, b 
      
       integer :: i, N 
       real :: S, dx, xi 
       
       N = 100 
       dx = (b-a)/N 
       
       S = 0 
       do i=1, N 
         xi =  a + dx * i
         S = S + f(xi) 
       end do 
       
       Integral = S 
       
    end function 
    
    pure real function Moment(f, n, a, b) 
       procedure (f_R_R) :: f 
       integer, intent(in) :: n 
       real, intent(in) :: a, b 
      
       Moment = Integral( g, a, b)  
       
     contains
     
     elemental real function g(x) 
          real, intent(in) :: x 
          
          g = x **n * f(x) 
          
       end function 
     
    end function 
    
    elemental real function h(x) 
       real, intent(in) :: x 
     
       h = x**2 + x + 1 
       
    end function 
    
 
    
   function  compose_constructor(f, g) result(c)
            procedure (g_R_R) :: f, g 
            type (compose) :: c
            
             c % f   => f
             c % g   => g
            
   end function 

   real function hc(this, x) 
        class (compose) :: this 
        real, intent(in) :: x 
        
         hc = this % g ( this % f(x) ) 
        
   end function 
    
  

   
    
    
  subroutine Functions_returning_functions
      
     type (compose) :: c(2) 
     type (pointer_f) :: f(2), f_inverse(2) 
     integer :: i 
     
     f(1) % p => sin
     f(2) % p => cos
     
     f_inverse(1) % p => asin
     f_inverse(2) % p => acos
     
     
     do i=1, 2 
       c(i) = compose( f(i) % p, f_inverse(i) % p ) 
     end do 
     
    
     do i=1, 2 
       write(*,*) "Compose f_inverse( f(x) ) =", c(i) % hc(0.2)
     end do 
  
     
    
  end subroutine 
  
  
 subroutine pure_functions
    
     real :: a = 1   
    
     write(*,*) "pure f(x) =", f_pure(1.), f_pure(1.)
     write(*,*) "impure f(x) =", f_impure(1.), f_impure(1.)
    
  contains 
  
  pure real function f_pure(x) 
 !  real, intent(inout) :: x ! Error, OUT or INOUT not allowed
    real, intent(in) :: x 
    
     !real :: b = 1   ! Error, Initilization is not permitted 
     !real, save :: b ! Error, save  is not permitted 
      real :: b 
      
   ! a = a + 1 ! Error: compiler trows an error
               ! Since f is pure, external variable can not be modified
     b = 1 
     b = b + 1 ! no problem,  b is local 
     
     f_pure = x**2 + a + b 
   ! write(*,*) " f = ", f ! Error, I/O not allowed 

  end function
  real function f_impure(x) result(f)
    real, intent(in) :: x 
    
      real :: b = 1   
      
       b = b + 1 
       f = x**2 + a + b 
 
  end function 
  end subroutine 
   
   subroutine Fibonacci_numbers 
    
     integer :: i 
   
    do i=3, 10 
     write(*,*) "Fibomacci numbers =", i, Fibonacci(i)
    end do 
    
  contains 
  
  pure recursive real function Fibonacci(n) 
        integer, intent(in) :: n 
    
        if (n==0) then 
                 Fibonacci = 1 
                  
        else if (n==1) then
                 Fibonacci = 1 
        else 
                 Fibonacci = Fibonacci(n-1) + Fibonacci(n-2) 
        end if 
  end function
  end subroutine   
  
  
  subroutine referential_transparency 
  
     real :: x=1, b=1  
      
     write(*,*) "Referential transparency"
     write(*,*) " Two expressions at x=1"
     write(*,*) "  g(x) is impure and h(x) is pure"
     write(*,*) "  g(x) + g(x)( h(x) - 1 ) =", g(x) + g(x)*( h(x)-1 )
     write(*,*) "  g(x) h(x) =", g(x)*h(x)
     
  contains 
  real function g(x) 
    real, intent(in) :: x 
      
       b = b + 1 
       g = x + b 
 
  end function 
   
  real function h(x) 
    real, intent(in) :: x 
    
       h = x 
 
  end function 
end subroutine 
  
 
end module 
    