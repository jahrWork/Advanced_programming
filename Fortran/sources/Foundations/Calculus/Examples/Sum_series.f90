module Sum_series 
    
    use Series, only : Sigma
    implicit none 
    real :: PI = 4 * atan(1d0) 
    
    interface 
      real function f_Z_R(x) 
        integer, intent(in) :: x 
     end function 
    end interface 
    
    
 contains 
    
!!*****************************************************************************
!* Summation of 1/n**2
!*****************************************************************************
subroutine  Summation_n2_examples()
   
  
   real :: S        ! sum of series 
   integer :: Ne, N ! number of terms to sum 
   real :: E        ! Error of sums

   S = Summation_n2(Ne)
   E =  PI**2/6 - S
   write(*,*) "Summation 1/n**2 "
   write(*,*) " S = ", S,  " N =", Ne, "Error = ", E
   
   N = 200000000
   S = SummationN_n2( N ) 
   E = PI**2/6 - S
   write(*,*) " S = ", S,  " N =", N, "Error = ", E
   write(*,*) 
   
   write(*,*)
   write(*,*) "Truncation error S = ", 1./Ne
   write(*,*) "Round--off error   = ", E - 1./Ne
   
    
end subroutine      
    
!!*****************************************************************************
!* Summation of three numerical series
!*****************************************************************************
subroutine  Summation_examples()

  
   real ::  S2, S3    ! sum of series 
   integer ::  N2, N3 ! number of terms to reach epsilon
   real ::  E2, E3    ! Error of sums

   S2 = Summation_2n(N2)
   S3 = Summation_factorialn(N3)
   
   E2 =  1/3. - S2
   E3 =  ( exp(1.) - 1 ) - S3  
   
   write(*,*) 
   write(*,*) "S2 =", S2, " N=", N2, " Err=", E2 
   write(*,*) "S3 =", S3, " N=", N3, " Err=", E3  
   write(*,*) 
  
    
end subroutine    

!!*****************************************************************************
!* Summation of three numerical series
!*****************************************************************************
subroutine Summation_functional_examples() 

  
   real :: S1, S2, S3    ! sum of series 
   real :: E1, E2, E3    ! Error of sums
   real :: eps = epsilon(S1) 

   S1 = Sigma(a1, 1, eps)
   S2 = Sigma(a2, 1, eps)
   S3 = Sigma(a3, 1, eps)
   
   E1 = S1 - PI**2/6 
   E2 = S2 - 1/3.
   E3 = S3 - ( exp(1.) - 1 )   
   
   write(*,*) "Functional programming"  
   write(*,*) "Summation from n=1 to n= infinity "
   write(*,*) "an= 1/n**2,               Sn= ", S1
   write(*,*) "an= (-1.)**(n+1) / 2**n,  Sn= ", S2
   write(*,*) "an= 1/factorial(n),       Sn= ", S3
   
   write(*,*) "Total error of S1    = ", E1
   write(*,*) "Total error of S2    = ", E2
   write(*,*) "Total error of S3    = ", E3  
 
    
end subroutine    



!*****************************************************
!* Sn = sum from {n=1} to N 1/ n**2 
!*****************************************************
real function SummationN_n2( N ) result(S) 
    integer, intent(in) :: N    

    integer :: i 
    
  S = 0
  do i=1, N 
      S  = S +  1. / real(i)**2
  end do 
   
end function  



!*****************************************************
!* Sn = sum from {n=1} to {infinity} 1/ n**2 
!*****************************************************
real function Summation_n2( n ) result(S) 
    integer, intent(out) :: n    ! index of the sum 

  real :: an = 1      ! general term  
  real :: Sn

  n = 0 
  Sn = 1 
  S = 0 
  
  do while ( S /= Sn ) 
     
      n = n + 1 
      an =  1. / real(n)**2 ! real to avoid overflow
      Sn = S 
      S = S + an 
      
  end do 
  n = n - 1 
    
end function  

!************************************************************
!* Sn = sum from {n=1} to {infinity} (-1.)**(n+1) / 2**n  
!************************************************************
real function Summation_2n( n ) result(S) 
   integer, intent(out) :: n    ! index of the sum 
   
  
  real :: an        ! general term 
  real :: Sn        ! summation of first n terms 
   
  n = 0 
  Sn = 1 
  S = 0 
  do while( S /= Sn  )
      
      n = n + 1
      an =  (-1.)**(n+1) / 2.**n 
      Sn = S 
      S = S + an 
 
  end do 
  n = n - 1 
 

end function  

!********************************************************
!* Sn = sum from {n=1} to {infinity} 1/ factorial(n) 
!*********************************************************
real function Summation_factorialn(n) result(S) 
  integer, intent(out) :: n    ! index of the sum 
  
  real :: an        ! general term 
  real :: Sn        ! summation of first n terms 

  n = 0 
  Sn = 1 
  S = 0 
  an = 1 
  do while( S /= Sn  ) 
      
      n = n + 1 
      an =  an / n 
      Sn = S 
      S = S + an 
      
  end do 
  n = n - 1 

end function  



real function a1(n) result(a) 
    integer, intent(in) :: n
 
     a = 1 / real(n)**2
    
end function

real function a2(n) result(a) 
    integer, intent(in) :: n
 
     a = (-1)**(n+1) / 2.**n 
    
end function

real function a3(n) result(a) 
    integer, intent(in) :: n
 
     a = 1 / factorial( n ) 
    
end function

real function factorial(n) 
    integer, intent(in) :: n 

     factorial = gamma(real(n+1))  
  
 end function 


  
end module   
