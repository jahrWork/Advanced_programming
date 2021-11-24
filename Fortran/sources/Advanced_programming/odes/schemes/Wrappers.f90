module Wrappers 
    
    use Cauchy_Problem
    use Temporal_Schemes 
    use dislin 
    
    implicit none 
    contains 
    
    subroutine Wrapper_examples 
    
      ! original code: Arenstorf orbit 
        call  dr_dopri5
        call system( "tecplot ./results/orbit.lay" )
    
      ! wrapping dopri5 to integrate with Cauchy problem 
        call Test_Arenstorf_orbit 
       
    
    end subroutine
  
!---------------------------------------------
! Wrapper and simulation to test results 
!------------------------------------------------
subroutine Test_Arenstorf_orbit 
   
   integer, parameter :: N = 100 ! 100000
   real :: Time(0:N), U(0:N,4) 
   real :: t0 =0, tf=17.0652165601579625588917206249
   real :: mu = 0.012277471
   integer :: i
 
 ! integration time   
   Time = [ (t0 + (tf -t0 ) * i / (1d0 * N), i=0, N ) ]
   
 ! initial conditions 
   U(0,:) = [0.994, 0., 0.,-2.00158510637908252240537862224 ]
   
   call Cauchy_ProblemS( Time_Domain=Time,                      & 
                         Differential_operator=orbit_equations, & 
     !                   Scheme = Runge_Kutta4, Solution = U )
                         Scheme = WDOPRI5, Solution = U )
   call scrmod("reverse")
   write (*, *) 'Arenstorf orbit (press enter) '     
   read(*,*)
   call qplot(  U(0:N,1) , U(0:N,2) , N+1 ) 
      
contains

function orbit_equations(U, t) result(F)           
     real :: U(:),t
     real :: F(size(U))
     
     real :: x, y , vx, vy, dxdt, dydt, dvxdt, dvydt  
     real :: D1, D2 
      
     x = U(1); y = U(2); vx = U(3); vy = U(4)     
 
     D1 = sqrt( (x+mu)**2     + y**2 )**3
     D2 = sqrt( (x-(1-mu))**2 + y**2 )**3
     
     dxdt = vx  
     dydt = vy  
     dvxdt = x + 2 * vy - (1-mu)*( x + mu )/D1 - mu*(x-(1-mu))/D2
     dvydt = y - 2 * vx - (1-mu) * y/D1 - mu * y/D2
    
     F = [ dxdt, dydt, dvxdt, dvydt ] 
    
end function
    
end subroutine 
    
end module 
    