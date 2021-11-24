

    
!********************************************************************************
!*  Temporal scheme for the solution of the Cauchy problem 
!*
!       U^{n+1} = G( U^n... U^{n-1+p}, F^n... F^{n-1+p}, dt ) 
!*
!*        Inputs: 
!*                F(U) vector valued function of the system of ordinary differential equations 
!*                t1 : initil time 
!*                t2 : final time  
!*                U1 :  vector for the initial condition 
!*
!*        Outputs:
!*                U2   : vector solution for the final state 
!*                ierr : integer variable to inform of internal errors 
!* 
!*  Author: Juan A Hernandez (juanantonio.hernandez@upm.es) 2016
!********************************************************************************
module Temporal_Schemes

use ODE_Interface

implicit none
  
abstract interface 
  
  subroutine Temporal_Scheme(F, t1, t2,  U1, U2, ierr )
                use ODE_Interface
                procedure (ODES) :: F 
                
                
                real, intent(in)    :: t1, t2
                real, intent(in) ::  U1(:)
                
                real, intent(out) ::  U2(:)
                integer, intent(out) :: ierr 
                
 end subroutine Temporal_Scheme
       
end interface  
 
contains 
!*******************************************************************************
! Euler 
!*******************************************************************************  
subroutine Euler(F, t1, t2, U1, U2, ierr )
       procedure (ODES) :: F
 
       real, intent(in) :: t1, t2 
       real, intent(in) ::  U1(:)
       
       real, intent(out) ::  U2(:)
       integer, intent(out) :: ierr 
       
 
       U2 = U1 + (t2-t1) * F( U1, t1)
       ierr = 0 
     

end subroutine 


!*******************************************************************************
! Runge Kutta 4 stages 
!*******************************************************************************  
subroutine Runge_Kutta4(F, t1, t2, U1, U2, ierr )
       procedure (ODES) :: F
 
       real, intent(in) :: t1, t2 
       real, intent(in) ::  U1(:)
       
       real, intent(out) ::  U2(:)
       integer, intent(out) :: ierr 
       
       real :: t, dt  
       real,save :: t_old
       integer :: N 
       real, save, allocatable :: k1(:), k2(:), k3(:), k4(:) 

       if (.not.allocated(k1)) then 
                         N = size(U1) 
                         allocate( k1(N), k2(N), k3(N), k4(N) )
       elseif (t1 < t_old) then
                         N = size(U1) 
                         deallocate( k1, k2, k3, k4 )
                         allocate( k1(N), k2(N), k3(N), k4(N) )
       endif 


       dt = t2-t1;   t = t1 

       k1 = F( U1, t)
       k2 = F( U1 + dt * k1/2, t + dt/2 )
       k3 = F( U1 + dt * k2/2, t + dt/2 )
       k4 = F( U1 + dt * k3,   t + dt   )
 
       U2 = U1 + dt * ( k1 + 2*k2 + 2*k3 + k4 )/6


      ierr = 0 
      t_old = t2

end subroutine 




!*******************************************************************************
! Wrapper of dopri5
!*******************************************************************************  
subroutine WDOPRI5(F, t1, t2, U1, U2, ierr )
       procedure (ODES) :: F
       real, intent(in) :: t1, t2 
       real, intent(in) ::  U1(:)
       real, intent(out) ::  U2(:)
       integer, intent(out) :: ierr 
    
        integer :: N, NRDENS, LWORK, LIWORK, iout, itol, idid
        integer, allocatable :: IWORK(:), IPAR(:)
        real, allocatable ::  WORK(:), RPAR(:), RTOL(:), ATOL(:)
        external dopri5
        
!       DIMENSION OF THE SYSTEM
        N = size(U1) 
        NRDENS = 2; LIWORK = NRDENS + 21
        LWORK = 8*N + 5*NRDENS + 21
        allocate( IWORK(LIWORK), IPAR(2) ) 
        allocate( WORK(LWORK), RPAR(2), RTOL(N),ATOL(N) )
        
!       OUTPUT ROUTINE (AND DENSE OUTPUT) USED DURING INTEGRATION
        IOUT=2
!       DEFAULT VALUES FOR PARAMETERS
        IWORK = 0; WORK = 0. 
!       DENSE OUTPUT IS USED FOR THE TWO POSITION COORDINATES 1 AND 2
!       IWORK(5)=NRDENS; IWORK(21)=1; IWORK(22)=2      

!       REQUIRED (RELATIVE AND ABSOLUTE) TOLERANCE
        ITOL=0; RTOL=1.0D-7;  ATOL=RTOL
        U2 = U1 
        CALL DOPRI5(N, FAREN, t1, U2, t2,              &
                    RTOL, ATOL, ITOL,                  &
                    SOLOUT, IOUT,                      &
                    WORK, LWORK, IWORK, LIWORK, RPAR, IPAR, IDID)
       ierr =0     
contains 

subroutine FAREN(N, x, y, Fv, RPAR, IPAR)
      integer :: N, ipar 
      real :: x, y(N), Fv(N), RPAR(2)
           
        Fv = F( y, x ) 
        
end subroutine
subroutine SOLOUT(NR,XOLD,X,Y,N,CON,ICOMP,ND,RPAR,IPAR,IRTRN)
    integer :: NR,N,ICOMP,ND,IPAR,IRTRN
    real :: XOLD,X,Y,CON,RPAR
end subroutine     

end subroutine 


end module 





 
 
  
