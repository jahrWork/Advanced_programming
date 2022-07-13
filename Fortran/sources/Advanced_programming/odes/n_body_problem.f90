module n_body_problem 
    
    use Cauchy_Problem
    use Temporal_Schemes
    use dislin 
    implicit none 
    
    
    contains
!------------------------------------------------------------------
! Orbits of N bodies 
!      U : state vector
!      r, v: position and velocity points to U     
!------------------------------------------------------------------    
 subroutine Integrate_NBP 
   
   integer, parameter :: N =  1000   ! time steps 
   integer, parameter :: Nb = 4      ! # of bodies 
   integer, parameter :: Nc = 3      ! # of coordinates 
   real :: Time(0:N) 
   real :: t0 = 0, tf =   4*3.14
   integer :: i 
   
   real, target ::  U(0:N, 2*Nc*Nb)   ! Cauchy problem: State vector: 6 degrees of freedom per body at every instant 
   real, pointer :: x(:, :), y(:, :)  ! Plot orbits: x cordinate, y coordinate ( time, body) 
   real, pointer :: Us(:, :, :, :)    ! Write equations: Solution( time, body, coordinate, position-velocity ) 
   
   Us(0:N, 1:Nb, 1:Nc, 1:2) => U   ! Us solution points to U 
   x => Us(0:N, 1:Nb, 1, 1)        ! x points to the first coordinate 
   y => Us(0:N, 1:Nb, 2, 1)        ! y points to the second coordinate 
   
 ! integration time   
   Time = [ (t0 + (tf -t0 ) * i / (1d0 * N), i=0, N ) ]
   
 ! initial conditions 
   call Initial_positions_and_velocities( Nb, Nc, Us(0,:,:,1), Us(0,:,:,2) ) 
   
   call Cauchy_ProblemS( Time, NBodyP, Runge_kutta4, U )  
   
   call plot( N+1, Nb,  x, y ) 
      
 contains

 function NBodyP(U, t) result(F)           
     real :: U(:), t, F(size(U))
    
     F = F_NBody(U, t) 
     
end function
!-----------------------------------------------------------------
! dvi/dt = - G m sum_j (ri- rj) / | ri -rj |**3, dridt = vi 
!-----------------------------------------------------------------
function F_NBody(U, t) result(F)           
     real, target :: U(:), t 
     real, target :: F(size(U))
     
    real, pointer :: r(:,:), v(:,:), drdt(:,:), dvdt(:,:)   
    real, pointer :: Us(:, :, :), dUs(:, :, :)  
    real ::  d(Nc)  
    integer :: i, j 
    
     Us(1:Nb, 1:Nc, 1:2)  => U;  dUs(1:Nb, 1:Nc, 1:2)  => F
     
     r => Us(1:Nb, 1:Nc, 1);  drdt => dUs(1:Nb, 1:Nc, 1)
     v => Us(1:Nb, 1:Nc, 2);  dvdt => dUs(1:Nb, 1:Nc, 2)
     
     dvdt = 0  
     do i=1, Nb 
       do j=1, Nb
         if (j/=i) then  
           d = r(j,:) - r(i,:)
           dvdt(i,:) = dvdt(i,:) +  d / norm2(d)**3 
         end if  
       end do 
     end do 
    
     drdt = v
     
end function
end subroutine 

!-------------------------------------------------------
! 2 bodies with origen as a center of mass 
!-------------------------------------------------------
subroutine Initial_positions_and_velocities( Nb, Nc, r, v ) 
   integer, intent(in) :: Nb, Nc  
   real :: r(Nb, Nc), v(Nb, Nc)
     
       ! body 1: position and velocity 
         r(1, :) = [1, 0, 0] 
         v(1, :) = [0., 0.4, 0.]
       
       ! body 2 
         r(2, :) = [ -1, 0, 0 ] 
         v(2, :) = [ 0., -0.4, 0. ] 
   
       ! body 3 
         r(3, :) = [ 0, 1, 0 ] 
         v(3, :) = [ -0.4, 0., 0. ] 
         
      ! body 4 
         r(4, :) = [ 0, -1, 0 ] 
         v(4, :) = [ 0.4, 0., 0. ]  
         
    
end subroutine 

 
!------------------------
! orbits of N bodies 
!-----------------------------------
subroutine plot( N, Nb, x, y ) 
   integer :: N, Nb 
   real :: x(N,Nb), y(N,Nb)
   
   real :: xmax, xmin, ymax, ymin 
   character(len=30) :: colors(4) = [ "red", "blue", "green", "orange"  ] 
   integer :: i, k  
   
    CALL PAGE (3000, 3000)
    call scrmod("reverse")
    call metafl("xwin")
    call disini 
    xmax = maxval( x ); xmin = minval( x ) 
    ymax = maxval( y ); ymin = minval( y )   
    
    
    if (xmax>ymax) then 
        ymax = xmax 
    else 
        xmax = ymax 
    end if 
    
     if (xmin>ymin) then 
        xmin = ymin 
    else 
        ymin = xmin  
    end if 
    
    call graf(xmin, xmax, xmin, (xmax-xmin)/10, ymin, ymax, ymin, (ymax-ymin)/10 )
    do i=1, Nb 
        k = mod(i, 5) 
        call color( trim(colors(k)) ) 
        call curve( x(:, i), y(:, i), N ) 
    end do 
    call disfin   

end subroutine     


end module 
    
    