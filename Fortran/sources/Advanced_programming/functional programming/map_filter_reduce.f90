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

elemental function distance(P, P0) 
     type (point2D), intent(in) :: P, P0 
     real :: distance 
           
   distance  = norm2( [ P % x - P0 % x, P % y - P0 % y ] )
     
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


elemental function filter(P, R1, R2) 
     type (point2D), intent(in) :: P 
     real, intent(in) :: R1, R2 
     logical :: filter 
     
        real :: d 
        
        d = norm2( [ P % x, P % y ] )
        
        filter =  d < R2 .and. d > R1  
     
end function 

subroutine test_filter_reduce() 

     integer :: i, N = 10000
     type (point2D), allocatable :: set(:), subset(:) 
     real :: r(2) 
     type (point2D) :: P0, P1 
    
     allocate( set(N) ) 
     call random_seed()
     do i=1, N 
         call random_number(r) 
         r = -1 + 2*r
         set(i) = pointc( r(1), r(2) ) 
     end do 
          
     subset = pack( set, filter(set, 0.4, 0.7) ) 
     
     P0 = pointc( 0.5, 0.5)
     i = minloc( distance(set,P0), dim=1 ) 
     P1 = set(i) 
     write(*,'(A,i5,A,2f15.6)') "Nearest point P =", P1 % x, P1 % y
     
     call plot_ini( -1., 1., -1., 1. )   
     call incmrk(-1);  call marker(21);
     call curve( set(:) % x, set(:) % y, N ) 
     call color("red")
     call curve( subset(:) % x, subset(:) % y, size(subset) )
     call plot_show()
     
     write(*,*) "size subset =", size(subset) 
    
end subroutine  
    



end module 