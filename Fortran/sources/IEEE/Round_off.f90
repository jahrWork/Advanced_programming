module Round_off
    
    implicit none 
    
    contains 
 
 
!*********************************************************************   
! Roots of a second grade equation    
! Complex numbers are defined in fortran as any other type
! No need to include external libraries 
! Pure attribute assures no side effects     
!**********************************************************************
pure subroutine roots_2th(a, b, c, x1, x2) 
       real (kind=4), intent(in) :: a, b, c 
       complex (kind=4), intent(out) :: x1, x2 

      complex (kind=4) :: d 
      
      d = b**2 - 4* a*c
      x1 = ( - b + sqrt( d ) )/(2*a)
      x2 = ( - b - sqrt( d ) )/(2*a)


end subroutine 

!*********************************************************************   
! Roots of a second grade equation quadruple precision 
!**********************************************************************
pure subroutine roots_2thq(a, b, c, x1, x2) 
       real (kind=16), intent(in) :: a, b, c 
       complex (kind=16), intent(out) :: x1, x2 

      complex (kind=16) :: d 
      
      d = b**2 - 4* a*c
      x1 = ( - b + sqrt( d ) )/(2*a)
      x2 = ( - b - sqrt( d ) )/(2*a)


end subroutine 

!*********************************************************************   
! It solves the problem when -b + sqrt( b**2 - 4 a c ) is close to zero      
!**********************************************************************
pure subroutine robust_roots_2th(a, b, c, x1, x2) 
       real (kind=4), intent(in) :: a, b, c 
       complex (kind=4), intent(out) :: x1, x2 

      complex :: d 
      
      d = b**2 - 4* a*c
      if ( abs(-b+sqrt(d)) <= 100*epsilon(b) ) then 
          x2 = ( - b - sqrt( d ) )/(2*a)
          x1 = c / x2
      else 
          x1 = ( - b + sqrt( d ) )/(2*a)
          x2 = c / x1 
      end if 
      

end subroutine

 subroutine roots_2th_example 
      
     complex (kind=4) :: x1, x2 
     real (kind=4) :: a, b, c 
     
     a = 1; b = -2 ; c = 1 
     call roots_2th(a, b, c, x1, x2) 
     
     write(*,*) " x1 = ", x1 
     write(*,*) " x2 = ", x2 

end subroutine 

subroutine catastrophic_cancellation 

   real (kind=4) :: a, b, c
   complex (kind=4) :: x1, x2
    
   complex (kind=16) :: x1e, x2e  
   real (kind=16) :: aq, bq, cq
   
   real (kind=16) ::  x0, mu 
     
  write(*,*) " Normal numerical computation "  
  write(*,*) " a x**2 + b x + c = 0  "
  x0 = 0.3  
  a = 1; b= -2*x0; c = x0**2;  x1e = x0; x2e = x0  
  
  call roots_2th(a, b, c, x1, x2 ) 
  call print_results(a, b, c, x1, x2, x1e, x2e) 
     
  write(*,*) " Catasthrophic cancellation example 1 "
  write(*,*) " a x**2 + b x + c = 0  "
  mu = 10000
  aq = 1; bq= -2*mu; cq = 1  
  a = aq; b = bq; c = cq; 
  call roots_2th(a, b, c, x1, x2 )
  call roots_2thq(aq, bq, cq, x1e, x2e )
  call print_results(a, b, c, x1, x2, x1e, x2e) 
  
  write(*,*) " Solving catasthrophic cancellation example 1 "
  write(*,*) " a x**2 + b x + c = 0  "
  call robust_roots_2th(a, b, c, x1, x2 )
  call print_results(a, b, c, x1, x2, x1e, x2e) 
  
  write(*,*) " Catasthrophic cancellation example 2 "
  write(*,*) " y = sqrt( x**2 + 1 ) - sqrt(x**2 + 2) with x=1000 "
  aq = 1000; 
  a = aq 
  x1 = sqrt( a**2 + 1) - sqrt( a**2 + 2 ) 
  x1e = -1/( sqrt( a**2 + 1) + sqrt( a**2 + 2 ) ) 
  call print_results2("a =", a, "x1 = ", x1, "x1e = ", x1e) 
  
    
end subroutine 
    
subroutine  print_results(a, b, c, x1, x2, x1e, x2e) 
   real (kind=4), intent(in) :: a, b, c
   complex (kind=4), intent(in) :: x1, x2
   complex (kind=16), intent(in) :: x1e, x2e
   
   character (len=20) :: f ='(a25, 2es24.15)'
   character (len=20) :: fc ='(a25, 3es24.15)'
   character (len=20) :: fr ='(a25, f14.8)'
   
  
  write(*, fc) " a, b, c = ", a, b, c 
  write(*, f) " Numeric solution x1 = ", x1
  write(*, f) " Numeric solution x2 = ", x2 
  write(*, f) " Exact solution x1e = ", x1e
  write(*, f) " Exact solution x2e = ", x2e 
  write(*, fr) " Relative error x1 = ", abs(x1e-x1)/abs(x1e)  
  write(*, fr) " Relative error x2 = ", abs(x2e-x2)/abs(x2e) 
  write(*,*)
     
    
end subroutine  

subroutine  print_results2(ca, a, cx, x1, cx1e, x1e) 
   real (kind=4), intent(in) :: a
   complex (kind=4), intent(in) :: x1
   complex (kind=16), intent(in) :: x1e
   character(len=*), intent(in) :: ca, cx, cx1e
   
   character (len=20) :: f ='(a25, 2es24.15)'
   character (len=20) :: fc ='(a25, 3es24.15)'
   character (len=20) :: fr ='(a25, f14.8)'
   
  
  write(*, fc) ca, a
  write(*, f) " Numeric solution "//cx, x1 
  write(*, f) " Exact solution "//cx1e, x1e
  write(*, fr) " Relative error "//cx, abs(x1e-x1)/abs(x1e) 
  write(*,*)
     
    
end subroutine  
  
    
subroutine errors_in_operations 

   real (kind=4) ::  S, dX = 0.3
   integer :: i, N = 1000000 
  
   S = 0 
   do i=1, N
             S = S + dX
   end do
   
   write(*,*) "______________________________"
   write(*,*) " do i=1, 100000; S = S + 0.3 "
   write(*,*) " S = ", S ! result S = 3027.90
   write(*,*) " instead of S = 300000 " 
   write(*,*)
   
   do i=1, N 
             S = S - dX
   end do 
   write(*,*) " do i=1, 1000000; S = S - 0.3  "
   write(*,*) " S = ", S ! result S = 26.1582
   write(*,*) " instead of S = 0 "
   write(*,*)
 
   write(*,*) " do i=1, 1000000; S = S + 1./1000000  "
   S = 0; 
   do i=1, N
      S = S + 1./N 
   end do 
   write(*,*) " S = ", S ! result S = 26.1582
   write(*,*) " instead of S = 1 "
   write(*,*) 
     
end subroutine   
    
   
subroutine loss_of_precision 

   real ::  x, eps = 1    
  
   do while (eps>0) 
       
      write(*,*) " Enter eps =? (0:exit) "; read(*,*) eps 
      x  = 1 + eps 
      
      write(*,*) " eps = ", eps," epsilon = ", epsilon(x) 
      write(*,'(a, e35.25)') " x = 1 + eps = ",  x 
      
   end do 
   
end subroutine 

end module 
    
    
    