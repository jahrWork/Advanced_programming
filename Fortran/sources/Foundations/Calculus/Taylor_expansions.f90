module Taylor_expansions
    
    
    use Series, only : Sigma, Sigma_N, factorial  
    implicit none 
    
       
!   f: R x N --> R  
    interface 
    
     function f_RxN_R(x, k) result(f)
        real, intent(in) :: x 
        integer, intent(in) :: k 
        real :: f 
     end function 
     
    end interface 
    
    interface Taylor  
       module procedure TaylorN, TaylorE 
    end interface  
    
 contains

  
!******************************************************************** 
!   Taylor expansion =  sum _{k=0} ^{infinity} f_k(x0) (x-x0)**k / k! 
!       Inputs:
!          df   : kth derivative of f(x) 
!          x0   : origin of Taylor expansion 
!           x   : point where Taylor is evaluated 
!           eps : error of Taylor approximation
!********************************************************************
real function TaylorE( df, x0, x, eps)  
       procedure (f_RxN_R) :: df  
       real, intent(in) :: x0, x, eps  
    
    TaylorE = Sigma( a, 0, eps) 
    
contains 

real function a(k)
   integer, intent(in) :: k 
 
   a = df(x0, k) * ( x - x0 )**k / factorial(k)  

end function   
 
end function 

!******************************************************************** 
!   Taylor expansion =  sum _{k=0} ^N f_k(x0) (x-x0)**k / k! 
!       Inputs:
!          df   : kth derivative of f(x) 
!          x0   : origin of Taylor expansion 
!           x   : point where Taylor is evaluated 
!           N   : last term of Taylor expansion 
!********************************************************************
real function TaylorN( df, x0, x, N)  
       procedure (f_RxN_R) :: df  
       real, intent(in) :: x0, x
       integer, intent(in) :: N   
    
    TaylorN = Sigma_N( a, 0, N) 
    
contains 

real function a(k)
   integer, intent(in) :: k 
 
   a = df(x0, k) * ( x - x0 )**k / factorial(k)  

end function   
 
end function 


end module   