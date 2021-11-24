module robust_dot
! Module for dot product of two real arrays of rank 1.
use, intrinsic :: ieee_features, only : &
IEEE_DATATYPE, IEEE_HALTING
use, intrinsic :: ieee_arithmetic, only : ieee_get_flag, &
ieee_set_flag, ieee_set_halting_mode, ieee_logb, &
ieee_scalb, IEEE_OVERFLOW, IEEE_ALL
private
logical, public :: matrix_error = .false.
public mult
contains
subroutine mult( a, b, x, i )
real, intent(in) :: a(:),b(:)
real, intent(out) :: x
integer, intent(out) :: i
! Local variables.
integer exp_a, exp_b
real max_a, max_b
logical overflow
intrinsic abs, maxval, size, sum
if( size(a)/=size(b) ) then
matrix_error = .true.
return
endif
! The processor ensures that flags, particularly
! IEEE_OVERFLOW, are quiet on entry to a procedure.
! Set the halting mode for all exceptions to continue
! execution. Assume the calling program has checked that IEEE
! arithmetic and exceptions are supported for the default
! real type.
call ieee_set_halting_mode( IEEE_ALL, .false. )
x = sum( a*b )
i = 0
call ieee_get_flag( IEEE_OVERFLOW, overflow )
if( overflow ) then
! An overflow has occurred. Clear all exception flags.
call ieee_set_flag( IEEE_ALL, .false. )
! Scale x and y so that the element of maximum magnitude is
! near 1.
max_a = maxval( abs(a) )
max_b = maxval( abs(b) )
exp_a = ieee_logb( max_a )
exp_b = ieee_logb( max_b )
x = sum( ieee_scalb( a, -exp_a )*ieee_scalb( b, -exp_b ) )
i = exp_a + exp_b
endif
end subroutine mult


end module robust_dot