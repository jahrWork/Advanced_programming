module Summation_errors 
    
    implicit none 
    real, parameter :: PI = 4 * atan(1.) 
    
contains 
    
subroutine summation_example

     integer :: N 
     real (kind=4), allocatable :: a(:)
     real (kind=4) :: SN 
     integer :: i 
     
     N = 10000000
     allocate( a(N) )
     
     do i=1, N 
         a(i) = 1 /real(i)**2 
     end do 
    
     
     SN = sum( a ) 
     call print_results("normal ", SN) 
     
     SN = sum( a(N:1:-1) ) 
     call print_results("inverse summation ", SN) 
     
     SN = jahrSum( a ) 
     call print_results("jahr ", SN) 
         
     SN = KahanSum( a ) 
     call print_results("Kahan ", SN) 
    

end subroutine 
    
function KahanSum( a ) result(S) 
       real (kind=4), intent(in) :: a(:) 
       real (kind=4) :: S 
   
    real (kind=4) ::  Error = 0.0          ! A running compensation for lost low-order bits.
    integer :: i, N 
    real (kind=4) :: an, SN
    
    N = size(a) 
    
    S = 0 
    do i=1, N           
                
        an = a(i) + Error          ! Error of last terms a(i-1), a(i-2),... because they are of order epsilon 
        SN = S + an                ! some part of  could be lost 
        Error =  an + (S - SN)     ! Error is what has been lost.  Parenthesis are a must  
        S = SN                     ! Assign the result and the Error is taken into account in an 
        
        !write(*,*) "__________i =", i
        !
        !write(*, '( 3(a, e25.15) )') " ai= ", a(i), " an =", an, " SN  =", SN
        !write(*, '( 3(a, e25.15) )') " Error =", Error, " S  =", S, " sum =", sum(a(1:i)) 
        !read(*,*) 
      
    end do     
    
    
       
end function 
    
function jahrSum( a ) result(S) 
       real (kind=4), intent(in) :: a(:) 
       real (kind=4) :: S 
   
    real (kind=4)  ::  Error = 0.0          ! A running compensation for lost low-order bits.
    integer :: i, N 
    real (kind=4) :: an, SN  
    
    N = size(a) 
    
    S = 0 
    Error = 0 
    do i=1, N           
      
        if (a(i) <= 100 * epsilon(S) ) then 
            Error = Error + a(i) 
        else 
            S = S + a(i) 
        end if 
        
        if (Error >= 100 * epsilon(S) ) then 
             S = S + Error
             Error = 0 
        end if 
        
        
        !write(*,*) "__________i =", i
        !
        !write(*, '( 3(a, e25.15) )') " ai= ", a(i), " epsilon =", epsilon(S) 
        !write(*, '( 3(a, e25.15) )') " Error =", Error, " S  =", S, " sum =", sum(a(1:i)) 
        !read(*,*) 
      
    end do            !  the lost low part will be added to y in a fresh attempt.
    
    S = S + Error 
    
       
end function


subroutine  print_results(label, SN) 
   real (kind=4), intent(in) :: SN 
   character(len=*), intent(in) :: label
   
   character (len=20) :: f ='(a25, 2es24.15)'
   character (len=20) :: fc ='(a25, 3es24.15)'
   character (len=20) :: fr ='(a25, f14.8)'
   
      
   
     write(*,*) "from n= 1 to n=1000000  sum  1/n**2"
     write(*,fr) label//" SN = ", SN 
     write(*,fr) " Error = ", PI**2/6 - SN
     write(*,*)
   
     
    
end subroutine  

    
    
end module 
    