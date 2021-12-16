 function  biased_exponent( string  ) result(e) 
   character(len=*), intent(in) :: string 
   integer  :: e 
 
    integer :: i, M 
    integer :: bias 
    
    
    M = len_trim(string) 
    e = 0
    do i=M, 1, -1
        
        if (string(i:i)=='1') then 
            e = e + 2**(M-i) 
        end if 
        
    end do 
    
  !  bias 
  !   if (M==8) then 
     !     bias = 127 
  !   else if (M==15) then 
         bias = 16383
  !   end if 
     
     e = e - bias 
  
    
 end function 
