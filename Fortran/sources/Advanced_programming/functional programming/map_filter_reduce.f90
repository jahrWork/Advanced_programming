module map_filter_reduce 
    
    use plotting 
    implicit none 
    
    type :: point2D 
        real :: x, y 
    end type 
    
    
 contains
    
    
elemental integer function str_to_number(str)
      character(len=*), intent(in) :: str

    read(str,*)  str_to_number  
   
end function 

subroutine test_map_filter_reduce() 

   character (len=3) :: sp(4) = ["123", "111", "444", "555"];
   integer :: m(4), f 
   integer, allocatable :: r(:) 
   
   write(*,*) " Functional programming: map, filter and reduce  " 
   
!  MAP: elemental
   m = str_to_number(sp)

!  FILTER: pack   
   r = pack( m, m > 200 )
   
!  REDUCE: sum, product, minval, maxval  
   f = maxval( str_to_number(sp) ) 
 
   write(*,'(a30, 10a8)') " array of strings = ", sp
   write(*,'(a30, 10i8)') " MAP: array of numbers = ", m  
   write(*,'(a30, 10i8)') " FILTER:  values > 200 = ",  r
   write(*,'(a30, 10i8)') " REDUCE: max value = ",  f
   
    
   
end subroutine 

elemental function Rotation(P, theta) result(Pr) 
      type (point2D), intent(in) :: P
      real, intent(in) :: theta 
      type (point2D) :: Pr 
      
      real :: A(2,2), R(2)
    
      A(1,:) = [ cos(theta), -sin(theta) ] 
      A(2,:) = [ sin(theta),  cos(theta) ] 
      
      R = matmul(A, [ P % x, P % y] ) 
      
      Pr % x = R(1) 
      Pr % y = R(2) 
   
end function 

function pointc(x,y) result(P) 
             real, intent(in) :: x, y 
             type (point2D) :: P   
            
      P % x = x 
      P % y = y
            
end function 

subroutine test_rotation() 

     integer, parameter :: N = 5 
     type (point2D) :: image(N), imageR(N) 
     real, parameter ::  PI  = 4 * atan(1.)  
     
     image = [ pointc(1., 1.), pointc(-1., 1.), pointc(-1., -1.),  & 
               pointc( 1., -1.), pointc( 1., 1.) ]    
     
     imageR = Rotation( image, PI/4 ) 
     
     call plot_ini( -2., 2., -2., 2. )   
     call curve( image(:) % x, image(:) % y, N ) 
     call color("red")
     call curve( imageR(:) % x, imageR(:) % y, N )
     call plot_show() 
   
end subroutine 

end module 