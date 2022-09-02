module Basic_operations 
    
    implicit none  
    
contains     

 subroutine Data_types()
 
     integer :: int = 1
     real :: x = 1.8
     complex :: com = (1,1)
     logical :: bool = .true.
     character (len=10,kind=1) :: string = 'data types'
         
 end subroutine 
 
 subroutine Data_structures()
 
    integer, parameter :: N = 10 
    real :: W(N), V(N), A(N,N), X(6), Y(3)
    integer :: i, j  
    real :: C(5,4), B(-2:4,0:1)

    V = [ ( 1./i**2, i=1, N ) ] 
    W = [ ( (-1)**(i+1)/(2*i+1.), i=1, N ) ] 
    A = reshape( [ ( ( (i/real(N))**(j-1), i=1, N ),  j=1, N) ], [N, N] )  
    X = [ 1.3, 2.4, 3., 4.5, 5.3, 7. ]
    Y = [ A(2, 3:5) ]
    
    !Slices
    C(:,2) = X(1:5)
    C(2:3,3:4) = reshape( [1., 2., 3., 4.], [2,2] ) !enter by columns!
    B(-2:4:3,:) = reshape( [1., 2., 3., 4., 5., 6.], [3,2] )
         
 end subroutine 
 
 subroutine Operators()
 
     real :: x = 2., y = 7.
     real :: pi = 4*atan(1.), e = exp(1.)
     
     write(*,*) "e^(i pi) + 1 = ",  e**( (0,1)*pi ) + 1
     write(*,*) "x <= y is",  x <= y, "and then -x >= -y is", -x >= -y
     write(*,*) "( ( x >= y ) .and. ( 1/x <= 1/y ) ) .eqv. .true. = ", &
                 ( ( x >= y ) .and. ( 1/x <= 1/y ) ) .eqv. .true.
         
 end subroutine 
 
 end module 
