module mapping 
    
    implicit none 
    
    type tensor
        real, allocatable :: x(:,:) 
    end type 
    
    
contains     
    
elemental real function f(x)
    real, intent(in) :: x 
    f = x**2 
end function 



elemental function square(A) result(F) 
    type(tensor), intent(in) :: A
    type (tensor) :: F
    
    F % x = matmul( A % x, A % x ) 
    
end function 

elemental real function g(x, n)
    real, intent(in) :: x 
    integer, intent(in) :: n 
    g = x**n 
end function 


subroutine mapping_example 


real :: x(4) = [ 1, 2, 3, 4 ]
real :: y1(4), y2(4) 
type (tensor) :: A, B, C(3), D(3) 
integer :: i 


! Python mapping: y1 = list( map(f, x) ) 
! Fortran: 
  y1 = f(x) 

! Python mapping: y2 = list( map( lambda x : g(x, 2), x ) ) 
! Fortran:   
  y2 = g(x, 2) 

  write(*, '(A3, 10es15.5)') "y1=", y1
  write(*, '(A3, 10es15.5)') "y2=", y2

! Tensor B = A * A   
  allocate ( A % x(2,2), B % x(2,2) ) 
  do i=1, 3 
     allocate( C(i) % x(2,2) ) 
  end do 
 
 A % x(1,:) = [ 1, 2 ]
 A % x(2,:) = [ 3, 4 ] 
 C = A 
 B = square(A)
 write(*, '(A3, 10es15.5)') "A*A=", B % x(1, :) 
  
! mapping of tensors elementwise operation  
 D = square(C)
 write(*, '(A3, 10es15.5)') "A*A=", D(3) % x(1, :) 
 
  
end subroutine 

end module 
