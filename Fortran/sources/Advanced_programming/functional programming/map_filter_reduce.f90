module map_filter_reduce 
    
    implicit none 
    
 contains
    
    
elemental integer function str_to_number(str)
      character(len=*), intent(in) :: str

    read(str,*)  str_to_number  
   
end function 

subroutine test_map_filter_reduce() 

   character (len=3) :: sp(4) = ["123", "111", "444", "555"];
   integer :: m(4), f 
   integer, allocatable :: r(:) 
   
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

end module 