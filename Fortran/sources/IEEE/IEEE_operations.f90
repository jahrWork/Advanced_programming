module IEEE_operations  
    
   ! This simple program illustrates the detection of overflow.
     use, intrinsic :: IEEE_FEATURES ! ,  only : IEEE_DATATYPE
     use, intrinsic :: IEEE_ARITHMETIC !, only : IEEE_SUPPORT_DATATYPE
     use, intrinsic :: IEEE_EXCEPTIONS !, only : IEEE_OVERFLOW, IEEE_GET_FLAG, IEEE_SET_HALTING_MODE, IEEE_SUPPORT_HALTING
 
    implicit none 
    
    
contains 
    
    
subroutine IEEE_exception_examples 







end subroutine 

    
    
    
subroutine Has_overflow_occurred


!real :: x, y, z; logical :: overflow_flag, IEEE_SUPPORT_HALTING
! Is there IEEE arithmetic support for entities of the
! type and kind of x and is halting supported for overflow?

!if(IEEE_SUPPORT_DATATYPE(x) ) then 
!.and. IEEE_SUPPORT_HALTING(IEEE_OVERFLOW)) then





! There is support for IEEE exceptions, including overflow.
! It is unnecessary to set overflow to nonsignaling
! as the processor is required to set the initial overflow
! flag to quiet at the start of execution of a program.
! Read in two values and check for overflow of their product.
!read *, x, y
! Set the halting mode to continue execution after overflow.
!call IEEE_SET_HALTING_MODE( IEEE_OVERFLOW, .false. )
! Multiply x and y and check for overflow.
!z = x * y
!call IEEE_GET_FLAG( IEEE_OVERFLOW, overflow_flag )
!if( overflow_flag ) then
!print "(a/3G16.8)", "An overflow occurred in the product" // &
!" x*y: x, y and x*y:", x, y, z
!else
!print "(a/3G16.8)", "No overflow occurred in the product" // &
!" x*y: x, y and x*y:", x, y, z
!endif
!else
!print *, "There is no arithmetic or exceptions support for" // &
!" detecting overflow"
!endif
end subroutine 
    
    
   

















    
    
    !REAL A, B, C, X, Y, Z
    !DATA A/10./, B/3./, X/10./, Y/3./
    !
    !real (kind=4) :: x, y, z
    !
    !
    !   real*4 res_uflow, res_oflow
    !
    !   real*4 res_dbyz, res_inv
    !
    !   real*4 small, big, zero, scale

    !   
    ! C = A/B
    ! Z = C - (X/Y)
    !PRINT *, Z          ! Could be zero or not.
    !
       
       
       !x = 1 
       !y = 0.0001
       !z = sqrt( 1 + y**2 ) - 1 - y**2/2 
       !write(*,*) " z sqrt = ", z
       !z =   - y**4/8
       !write(*,*) " z Taylor = ", z 
       !stop 
       
      
       
       !real :: t, s 
      
       !
       !a =  94906265.625d0
       !b =  94906267d0 
       !c =  94906268.375d0
       !    
       !d = b**2 -  a * c 
       !
       !write(*,*) " d = ",  d 
       ! 
       !x1 = ( - b + sqrt(d) ) /(a) 
       !x2 = ( - b - sqrt(d) ) /(a) 
       !       
       !write(*,*) " x1 = ", x1 
       !write(*,*) " x2 = ", x2
       !
       !a =  94906265.625d0
       !b =  94906267d0 
       !c =  94906268.375d0
       !   
       !b = b / a 
       !c = c / a 
       !a = 1d0        
       !d = b**2 -  a * c 
       !
       !write(*,*) " d = ",  d 
       ! 
       !x1 = ( - b + sqrt(d) ) /(a) 
       !x2 = ( - b - sqrt(d) ) /(a) 
       !       
       !write(*,*) " x1 = ", x1 
       !write(*,*) " x2 = ", x2
       !
       
       !real (kind=4) :: a, b, c, d ! kahan 
       !real (kind=4) :: x1, x2, eps  
       
        !! a x**2 - 2 * b * x + c = 0 
       
      ! eps = 1d-5 
      ! a =  1 + 4*eps
      ! b =  -2*(1 + 3*eps ) 
      ! c =  1 + 2*eps 
      !   
      ! d = b**2 -  4 * a * c 
      ! 
      ! write(*,*) " d = ",  d 
      !  
      ! x1 = ( - b + sqrt(d) ) /(2*a) 
      ! x2 = ( - b - sqrt(d) ) /(2*a) 
      !        
      ! write(*,*) " x1 = ", x1 
      ! write(*,*) " x2 = ", x2
      ! 
      ! eps = 1d-5 
      ! a =  1
      ! b =  1 + eps  
      ! c =  eps 
      !   
      ! d = b**2 - 4 * a * c 
      ! 
      ! write(*,*) " d = ",  d 
      !  
      ! x1 = (  b + sqrt(d) ) /(2*a) 
      ! x2 = (  b - sqrt(d) ) /(2*a) 
      !        
      ! write(*,*) " x1 = ", x1 
      ! write(*,*) " x2 = ", x2
      ! 
      ! b = 3.34
      ! a = 1.22
      ! c = 2.28
      ! 
      !d = b**2 - 4 * a * c 
      ! 
      ! write(*,*) " d = ",  d 
      !  
      ! x1 = (  b + sqrt(d) ) /(2*a) 
      ! x2 = (  b - sqrt(d) ) /(2*a) 
      !        
      ! write(*,*) " x1 = ", x1 
      ! write(*,*) " x2 = ", x2
      ! 
      ! stop 
      ! 
      ! 
      ! eps = 1d-3 
      ! x = 1 
      ! y = eps 
      ! z = x**2 - y**2 
      ! write(*,*) " eps = ", eps 
      ! write(*, '(a, e20.15)') " z = ", z 
      ! 
      ! z = ( x + y )*( x - y ) 
      ! write(*, '(a, e20.15)') " z = ", z
      ! 
      ! stop 
       
        !
        !t = 3.0 
        !s = 1.0 - (4.0/t - 1.0)*t
        !write(*,*) " s = ", s 
       
    !   use, intrinsic :: ieee_exceptions
    !   use, intrinsic :: ieee_features, only:ieee_underflow_flag 
    !   
    !   use ieee
    !   
    !   implicit none
    !   
    !   type (ieee_flag_type), parameter :: out_of_range(2) = [ ieee_overflow, ieee_underflow] 
    !   logical :: flags(2), exception(5)  
    !   integer :: i, N 
    !   real (kind=4) :: S 
    !   real :: a, b, c 
    !   
    !   
    !   a = 2 
    !   b = 0 
    !   !call safe_divide(a, b, c, fail) 
    !   !write(*,*) " c =", c, fail
    !   
    !    a = 2 
    !    b = -2.00000001 
    ! !  call safe_underflow(a, b, c, fail)
    !  
    ! !  call safe_inexact(a, b, c, fail)
    !    
    !    call safe_operation(a, b, c )
    !    
    !    
    !    stop 
    !   !write(*,*) " c =", c, "inexact=", fail
    !   write(*,*) " c =", c
    !   
    !   write(*,*) " b =", b 
    !
    !   stop 
    !   
    !!   flags = ieee_support_flag( out_of_range )
    !   write(*,*) "underflow =", ieee_support_flag( ieee_underflow  ) 
      
     !  call IEEE_GET_FLAG(IEEE_DIVIDE_BY_ZERO, fail)
     !  S = 1 + 1d-30
     !!  call ieee_get_flag( out_of_range, flags) 
     !!call IEEE_GET_FLAG(IEEE_DIVIDE_BY_ZERO, fail)
     !  call IEEE_GET_FLAG(ieee_underflow, fail)
     !  write(*,*) " fail = ", fail
     !  
     !  
     !  stop 
     !  N = 100000000
     !  S = 0 
     !  do i=1, N  
     !      S =  S + 1/real(N) 
     !      call ieee_get_flag( out_of_range, flags) 
     !      write(*,*) " flags = ", flags 
     !  end do 
     !  
     !  write(*,*) " epsilon (S) = ", epsilon(S) 
     !  write(*,*) " 1/N = ", 1/real(N)  
     !  write(*,*) " S = ", S 
     !  
       
!       small = 1.0e-30
!
!       big   = 1.0e30
!
!       zero  = 0.0
!
!       scale = 1.0e-10
!
!!      IEEE underflow condition (Underflow Raised)
!
!       res_uflow = small * scale
!
!       write(6,100)"Underflow: ",small, " *", scale, " = ", res_uflow
!
!!      IEEE overflow condition (Overflow Raised)
!
!       res_oflow = big * big
!
!       write(6,100)"Overflow: ", big, " *", big, " = ", res_oflow
!
!!      IEEE divide-by-zero condition (Divide by Zero Raised)
!
!       res_dbyz = -big / zero
!
!       write(6,100)"Div-by-zero: ", -big, " /", zero, " = ", res_dbyz
!
!!      IEEE invalid condition (Invalid Raised)
!
!       res_inv = zero / zero
!
!       write(6,100)"Invalid: ", zero, " /", zero, " = ", res_inv
!
!100    format(A14,E8.1,A2,E8.1,A2,E10.1)
    














!
!module ieee
! 
!    
!   
!  !  use IEEE_EXCEPTIONS
!       use, intrinsic :: ieee_exceptions
!  !     use, intrinsic :: ieee_features, only:ieee_underflow_flag  
!       implicit none 
!    
!    contains 
    
 
subroutine safe_divide(a, b, c, fail)
                  real a, b, c
                  logical fail  


    type(IEEE_STATUS_TYPE) status
! save the current floating-point environment, turn halting for
! divide-by-zero off, and clear any previous divide-by-zero flag
call IEEE_GET_STATUS(status)
call IEEE_SET_HALTING_MODE(IEEE_DIVIDE_BY_ZERO, .false.)
call IEEE_SET_FLAG(IEEE_DIVIDE_BY_ZERO, .false.)
! perform the operation
c = a/b
! determine if a failure occurred and restore the floating-point environment
call IEEE_GET_FLAG(IEEE_DIVIDE_BY_ZERO, fail)
call IEEE_SET_STATUS(status)
end subroutine safe_divide  
    
     
     
     
     
subroutine check_underflow


    real a, b, c
    logical fail  

   type(IEEE_STATUS_TYPE) status

    fail = ieee_support_flag( ieee_underflow  ) 
   
    
    call IEEE_GET_STATUS(status)
    call IEEE_SET_FLAG(IEEE_underflow, .false.)
  ! perform the operation
    
    a = 1 
    b = 0.000000000001
    c = a+b 
    
 !  determine if a failure occurred and restore the floating-point environment
    call IEEE_GET_FLAG(IEEE_underflow, fail)
    call IEEE_SET_STATUS(status)

     write(*,*) " support =", fail
     write(*,*) 


end subroutine  
    
    
  subroutine check_inexact(a, b, c, fail)
               real a, b, c
               logical fail  


type(IEEE_STATUS_TYPE) status
! save the current floating-point environment, turn halting for
! divide-by-zero off, and clear any previous divide-by-zero flag


    fail = ieee_support_flag( ieee_inexact  ) 
    write(*,*) " support inexact =", fail 
    
    call IEEE_GET_STATUS(status)
  !  call IEEE_SET_HALTING_MODE(IEEE_underflow, .false.)
    call IEEE_SET_FLAG(IEEE_inexact, .false.)
  ! perform the operation
    a = 1 
    b = 0.000000000001
    c = a+b 
 !  determine if a failure occurred and restore the floating-point environment
    call IEEE_GET_FLAG(IEEE_inexact, fail)
    call IEEE_SET_STATUS(status)



end subroutine  
    
   
  
  
  
subroutine safe_operation(a, b, c)
               real a, b, c
               
               
               integer, parameter :: N = 5 
               logical exception_occurred, support
               integer :: i 


!type(IEEE_STATUS_TYPE) status
! save the current floating-point environment, turn halting for
! divide-by-zero off, and clear any previous divide-by-zero flag


type (ieee_flag_type), parameter :: exceptions(N) =  & 
    [ ieee_overflow, ieee_underflow, ieee_inexact, ieee_divide_by_zero, ieee_invalid] 




    do i=1, N 
       support = ieee_support_flag( exceptions(i)  ) 
       write(*,*) " support  =", support
    end do 
   ! stop 
    
 !   call IEEE_GET_STATUS(status)
 ! !  call IEEE_SET_HALTING_MODE(IEEE_underflow, .false.)
   call IEEE_SET_FLAG(IEEE_inexact, .false.)
 ! ! perform the operation
    a = 1 
    b = 0.000000000001
    c = a+b 
 !!  determine if a failure occurred and restore the floating-point environment
  !  #ifdef DEBUG
    do i=1, N 
        call IEEE_GET_FLAG(exceptions(i), exception_occurred)
        write(*,*) " exception  =", exception_occurred
    end do 
  !  #end if
    
    
    
 !   call IEEE_SET_STATUS(status)



end subroutine    
  
  
  
  
  
    
end module 
    








