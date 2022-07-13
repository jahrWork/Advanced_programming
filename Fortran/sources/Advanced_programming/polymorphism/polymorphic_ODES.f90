module polymorphic_ODES
    
    use plotting
    implicit none 
     
    
    abstract interface 
      function F_RxR_R(U, t) result(F) 
        real, intent(in) :: U(:), t 
        real :: F (size(U) ) 
      end function 
    end interface 
    
     abstract interface 
      function F_CxR_C(Z, t) result(F) 
        complex, intent(in) :: Z(:)
        real, intent(in) :: t 
        complex :: F (size(Z) ) 
      end function 
    end interface 

contains
    
function Euler(U1, t1, t2, F) result(U2)
   real, intent(in) :: U1(:), t1, t2
   procedure (F_RxR_R) :: F 
   real :: U2(size(U1))
   
    U2 = U1 + (t2-t1) * F(U1, t1)
    
end function 

function oscillator(U, t) result(F)
   real, intent(in) :: U(:), t
   real :: F(size(U)) 
   
   F = [ U(2), -U(1) ]
    
end function 

function complex_oscillator(Z, t) result(F)
   complex, intent(in) :: Z(:)
   real, intent(in) :: t
   complex :: F(size(Z))
     complex :: J = (0, 1) 
   
   F = -J * Z 
    
end function 


subroutine  simulation(U0, Nv, F)
   real, intent(in) :: U0(:)
   integer, intent(in) :: Nv 
   procedure (F_RxR_R) :: F 

     real, allocatable :: U(:,:), time(:) 
     integer :: i, N 
     
     N = 100
     allocate( U(0:N, Nv), time(0:N) ) 
     time = [ ( 10*i/real(N), i=0, N) ]
     U(0, :) =  U0
    
     do i=0, N-1 
         U(i+1,:) = Euler( U(i,:), time(i), time(i+1), F )
     end do 
     
     call plot_ini( -2., 2., -2., 2. )   
     call curve( U(:,1), U(:,2), N+1 ) 
     call plot_show() 
     
     
end subroutine 

subroutine  complex_simulation(Z0, Nv, Fc)
   complex, intent(in) :: Z0(:)
   integer, intent(in) :: Nv 
   procedure (F_CxR_C) :: Fc 
   
   real :: U0(2*Nv) 
   integer :: i 
   
   do i=1, Nv 
    U0(2*i-1:2*i) = [ real(Z0(i)), imag(Z0(i)) ]
   end do 
      
   call simulation( U0, 2*Nv, F )
     
contains 
function F(U, t) 
   real, intent(in) :: U(:), t 
   real :: F(size(U)) 
   
   complex :: Z(Nv), G(Nv) 
   
   do i=1, Nv 
     Z(i) = cmplx( U(2*i-1), U(2*1) ) 
   end do 
   
   G = Fc(Z, t) 
   do i=1, Nv 
     F(2*i-1:2*i) = [ real(G(i)), imag(G(i)) ]
   end do 
   
end function 
end subroutine
     
subroutine complex_ODES 

    real :: U0(2) = [1, 0]
    complex :: Z0(1) = [ (1, 0) ]
    
 ! Example of a system of two real equations 
   call simulation( U0, 2, oscillator )
   
 ! Example of a complex equation sith the same function 
   call complex_simulation( Z0, 1, complex_oscillator )

end subroutine 


end module 