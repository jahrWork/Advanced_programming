module IEEE_representation 
    
    implicit none 
    
    contains 
    
  
  subroutine IEEE_real_representation( x ) 
           class(*), intent(in) :: x 
    
           real (kind=16) :: y, xc, xd 
           real (kind=16) :: mantissa_base_2 
           integer :: exponent_base_2  
           integer :: s 
           integer (kind=8) :: i
           character (len=64) :: bits 
           
           
           select type(x) 
               
           type is (real (kind=4))
                   write(*,*) 
                   write(*,*) " Single precision  "
                   y = x ; xc = x 
                   call mantissa_exponent_base_2(y, mantissa_base_2, exponent_base_2, s) 
                
           type is (real (kind=8)) 
                   write(*,*) 
                   write(*,*) " Double precision "
                   y = x ; xc = x
                   call mantissa_exponent_base_2(y, mantissa_base_2, exponent_base_2, s) 
                   
           type is (real (kind=16)) 
                   write(*,*) 
                   write(*,*) " Quaduple precision "
                   y = x ; xc = x 
                   call mantissa_exponent_base_2(y, mantissa_base_2, exponent_base_2, s) 
                   
                   
               class default
                       write(*,*) "ERROR " 
                       stop 
           end select 
     
    
  end subroutine  
  
!*****************************************************************************
!* It converts a string of characters to a real number 
!*****************************************************************************   
elemental function  string_to_float( string  ) result(f) 
   character(len=*), intent(in) :: string 
   real(kind=16) :: f 
 
   
    read(string, '(e20.15)') f 

end function 

!*****************************************************************************
!* It converts a string of characters to a real number 
!*****************************************************************************   
elemental function  string_to_integer( string  ) result(int) 
   character(len=*), intent(in) :: string 
   integer  :: int 
 
    
   
    read(string, '(i10)') int 

end function   
  

!*****************************************************************************
!* It converts a string of characters to a real number 
!*****************************************************************************   
elemental function   normalized_mantissa_real4( string  ) result(mantissa) 
   character(len=*), intent(in) :: string 
   real  :: mantissa 
 
    integer :: i, M 
    
    M = len_trim(string) 
    mantissa = 1
    do i=1, M
        
        if (string(i:i)=='1') then 
            mantissa = mantissa + 1./2.**i 
        end if 
        
    end do 
    
end function 


!*****************************************************************************
!* It converts a string of characters to a real number 
!*****************************************************************************   
elemental function normalized_mantissa( string  ) result(mantissa) 
   character(len=*), intent(in) :: string 
   real (kind=16)  :: mantissa 
 
    integer :: i, M 
    
    M = len_trim(string) 
    mantissa = 1
    do i=1, M
        
        if (string(i:i)=='1') then 
            mantissa = mantissa + 1./2.**i 
        end if 
        
    end do 
    
end function 

!*****************************************************************************
!* It converts a string of bits  to a biased exponent 
!*****************************************************************************   
 function  biased_exponent( string ) result(e) 
   character(len=*), intent(in) :: string 
   integer  :: e 
 
    integer :: i, M 
    integer :: bias, r = 15
    
    
    M = len_trim(string) 
    e = 0
    do i=M, 1, -1
        
        if (string(i:i)=='1') then 
            e = e + 2**(M-i) 
        end if 
        
    end do 

    bias = 2**(r-1) - 1      
    e = e - bias 

 end function 

 
 
!*****************************************************************************
!* It determines sign, mantissa and exponent  of a real number in base-2 
!*****************************************************************************   
 subroutine  mantissa_exponent_base_2_real4( x, m, e, s ) 
         real (kind=4), intent(in) :: x        
         real (kind=4), intent(out) :: m        ! mantissa 
         integer, intent(out) :: e, s  ! exponent and sign 
        
        character (len=32) :: bits 
        real :: xr 
    
        write(bits, '(B32)' ) x       
        if (bits(1:1) == '1' ) then 
           s = -1 
        else 
            bits(1:1) = '0' ! sign positive 
            s = +1
        end if 
        
        m = normalized_mantissa_real4( bits(10:32) )
        e = biased_exponent( bits(2:9) )
        xr = s * m * 2.**e
         
        write(*, '(a, ES15.7)' ) "------- x = ", x
        write(*,*) " internal representation of  x = ", bits
        write(*,*) " mantissa of x (base 2) = ", bits(10:32)
        write(*,*) " biased exponent of x (base 2) = ", bits(2:9) 
        write(*,*) " normalized mantissa x = ", m
        write(*,*) " exponent of x (base 2) = ", e
        write(*, '(a, ES15.7)' ) "------- reconstruction x = ", xr
  
 end subroutine  
 
!*****************************************************************************
!* It determines sign, mantissa and exponent  of a real number in base-2 
!*****************************************************************************   
 subroutine mantissa_exponent_base_2( x, m, e, s ) 
         real (kind=16), intent(in) :: x        
         real (kind=16), intent(out) :: m     ! mantissa 
         integer, intent(out) :: e, s         ! exponent and sign 
    
        character (len=128) :: bits 
        real (kind=16) :: xr 
        integer :: i 
    
        write(bits, '(B128)' ) x       
        if (bits(1:1) == '1' ) then 
           s = -1 
        else 
            bits(1:1) = '0' ! sign positive 
            s = +1
        end if 
     
        m = normalized_mantissa( bits(17:128) )
        e = biased_exponent( bits(2:16) )
        xr = s * m * 2.**e
         
        open( 6, FILE='CON', STATUS='UNKNOWN', RECL=200 )
        write(6, '(a)' ) "---------------------------------------------------"
        write(6, '(a35, ES40.32)' ) " x = ", x
        write(6, '(a35, a128)') "Internal representation of x = ", bits(1:128)
        write(6, '(a35, a112)') "Mantissa of x  = ", bits(17:128)
        write(6, '(a35, a15)') "Biased exponent of x  = ", bits(2:16) 
        write(6, '(a35, ES40.32)') "Normalized mantissa x = ", m
        write(6, '(a35, i10)') "Exponent of x  = ", e
        write(6, '(a35, ES40.32)' ) "Reconstruction x = ", xr
        write(6, '(a)' ) "---------------------------------------------------"
 
 end subroutine 
 
   
 
 
 
    end module 
    
 
    
    
    
      !  bias 
  !   if (M==8) then 
     !     bias = 127 
  !   else if (M==15) then 
    !     bias = 16383
  !   end if 