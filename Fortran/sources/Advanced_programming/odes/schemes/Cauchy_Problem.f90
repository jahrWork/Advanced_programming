
!***********************************************************************
!   It integrates the Cauchy problem.   
!***********************************************************************    
module Cauchy_Problem


use Temporal_Schemes
use ODE_Interface 
implicit none   

 private  
 public :: Cauchy_ProblemS
 

abstract interface 

 function F_R_RN(N, t) 
         integer, intent(in) :: N 
         real, intent(in) ::  t 
         real :: F_R_RN(N) 
      
 end function 

end interface 


contains   

!************************************************************************************************
! It integrates the following Cauchy problem 
!
!       dU/dt = F(U, t),      U(0) = U^0 (CI)   
!
!     Inputs: 
!            Time_Domain(:)        : time discretization 
!            Differential_operator : vector values function F(U, t)
!            Scheme                : Optional Temporal numerical scheme ( default: Runge_Kutta4)
!            Solution(0,:)         : Initial condition 
!
!     Outputs: 
!            Solution(:,:)         : first index represents time 
!                                    second index  represents the i-component of solution
!     
!*  Author: Juan A Hernandez (juanantonio.hernandez@upm.es) 
!***************************************************************************************************
subroutine Cauchy_ProblemS( Time_Domain, Differential_operator, Scheme, & 
                            Solution ) 
     real, intent(in) :: Time_Domain(:) 
     procedure (ODES) :: Differential_operator
     procedure (Temporal_Scheme), optional :: Scheme
     real, intent(out) :: Solution(:,:) 
     
!  *** Initial and final time
       real :: start, finish         ! CPU time 
       real ::  t1, t2               ! simulation time step  
       integer ::  i, N_steps, ierr
       
       call cpu_time(start)
       N_steps = size(Time_Domain) - 1; 
     
!  *** loop for temporal integration 
       do i=1, N_steps 
           t1 = Time_Domain(i) ; t2 = Time_Domain(i+1)
         
           if (present(Scheme))  then 
             call Scheme( Differential_operator, t1, t2,              & 
                          Solution(i,:), Solution(i+1,:), ierr )  
           else 
                    
               call Runge_Kutta4(  Differential_operator, t1, t2,        & 
                                   Solution(i,:), Solution(i+1,:), ierr ) 
           endif 
           if (ierr>0) exit 
       enddo 
       
 call cpu_time(finish)
 write(*, '("Cauchy_Problem, CPU Time=",f6.3," seconds.")') finish-start 
       
end subroutine 

                       

                            
                            
                            
                            
end module 
