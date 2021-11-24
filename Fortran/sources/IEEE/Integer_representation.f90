module Integer_representation   
    
   implicit none 
   
    
contains     
    
subroutine Integer_overflow 
 
  integer (kind=1) :: i
  integer (kind=2) :: k 
   
   write(*,*) " Integer overflow "
   do k=0, 257 
       i = k 
       write(*,*) "k = ", k, " i= ", i 
   end do 
   

end subroutine 

subroutine Factorial_overflow 
 
 
  integer :: k, f  
   
   write(*,*) " Factorial overflow "
   f = 1 
   do k=1, 20
       f = f * k 
       write(*,*) "k = ", k, " f= ", f 
   end do 
   

end subroutine 

subroutine Assignment_overflow 
 
  integer (kind=4) :: Q 
    
    !If the assignment of the value is out-of-range,
    ! no error is detected by the compiler 
    ! only a warning  colud alert of possible malfunctions 
  
    Q = 2147483648
    write(*,*) "Intention: assign Q <- 2147483648"
    write(*,*) "Result:  Q =", Q, "huge(Q) = ", huge(Q)

end subroutine 


!********************************************************************
!* It determines the integer repressentation with two's complement 
!*********************************************************************  
 subroutine Integer_representation_twos_complement( kind_type, x ) 
         character (len=*), intent(in) :: kind_type 
         integer (kind=8), intent(in) :: x   
                 
    integer, parameter :: N = 64      
    character (len=N)  :: bits      ! binary form char 
    integer  :: b(0:N-1)            ! binary form vector
    integer (kind=8) :: m, xr, xb, xmax, xmin ! integer parameters 
    integer :: i 
    
   call integer_parameters(kind_type, x, m, xr, xb, xmax, xmin )   
 
   write(bits, '(B64)' ) xr    
   b = 0 
   do i=1, N;  
       if (bits(i:i) == ' ') bits(i:i) = '0'; 
       if (bits(i:i) == '1') b(N-i) = 1; 
   end do
              
   xr = - b(N-1) * 2**(N-1) 
   do i=0, N-2 
       xr = xr + b(i) * 2**i 
   end do  
         
   open( 6, FILE='CON', STATUS='UNKNOWN', RECL=200 )
   write(6, '(a)' ) "-------------------------------------------------"
   write(6, '(a)') " Internal representation of integers  " // kind_type 
   write(6, '(a35, i20)') "Integer  kind=8            x = ", x
   write(6, '(a35, i20)') "Same integer "//kind_type//"        x = ", xb 
   write(6, '(a27, 2i20)') "Integer range "//kind_type//" = ", xmin, xmax  
   write(6, '(a35, a)')   "Internal representation of x = ", bits(N-m+1:N)
   write(6, '(a35, i20)') "-b_{N-1}2 **(N-1)+sum b_i 2**i = ", xr
   write(6, '(a)' ) "-------------------------------------------------"
 
 end subroutine  

subroutine integer_parameters(kind_type, x, m, xr, xb, xmax, xmin )
  character (len=*), intent(in) :: kind_type 
  integer (kind=8), intent(in) :: x   
  integer (kind=8), intent(out) :: xr, xb, xmax, xmin, m  
  
         integer (kind=1) :: i1
         integer (kind=2) :: i2
         integer (kind=4) :: i4
         integer (kind=8) :: i8 
         
               
        if (kind_type=="kind=1") then 
            m = 8; i1 = x; xr = i1;   xb = i1; xmax = huge(i1); xmin = - huge(i1)-1
        else  if (kind_type=="kind=2") then 
            m = 16; i2 = x; xr = i2; xb = i2; xmax = huge(i2); xmin = - huge(i2)-1 
        else  if (kind_type=="kind=4") then 
            m = 32; i4 = x; xr = i4; xb = i4; xmax = huge(i4); xmin = - huge(i4)-1 
        else  if (kind_type=="kind=8") then 
            m = 64; i8 = x; xr = i8; xb = i8; xmax = huge(i8); xmin = - huge(i8)-1     
        end if 
 
end subroutine 





!********************************************************************
!* Examples of the book for dec-bin converter of two's complement
!*                   for any number of bits
!*********************************************************************
subroutine TwosCompl_int_converter 
 
    !Example of binary to decimal 
    write(*,*) "Two's complement conversion of binary: "
    write(*,*) "010101010110111001110  =  "
    write(*,*) TwosCompl_converter_to_decimal( '010101010110111001110' )

    !Example of decimal to binary
    write(*,*) "Two's complement conversion of integer: ", -89544563
    write(*,*) TwosCompl_converter_to_binary( -89544563 )

    !Number 1 in two's complement (2 bits needed)
    write(*,*) "Two's complement conversion of integer: ", 1
    write(*,*) TwosCompl_converter_to_binary( 1 )

    !Example of overflowed value
    write(*,*) "Check overflow integer of 13! = ", 6227020800
    write(*,*) "with 4-bytes memory size = ", 32, "bits"
    write(*,*) "The actual value stored is: "
    write(*,*) Check_overflowed_int( 6227020800, 32 )

end subroutine 




pure function TwosCompl_converter_to_binary( x ) 
        class(*), intent(in) :: x
        character (len=:), allocatable :: TwosCompl_converter_to_binary
    
        integer(kind=8) :: int
           
        select type(x) 
               
        type is (integer (kind=1))
            int = x
            TwosCompl_converter_to_binary = TwosCompl_converter_to_bin( int )
                
        type is (integer (kind=2)) 
            int = x
            TwosCompl_converter_to_binary = TwosCompl_converter_to_bin( int )
                   
        type is (integer (kind=4)) 
            int = x
            TwosCompl_converter_to_binary = TwosCompl_converter_to_bin( int )
                   
        type is (integer (kind=8))  
            TwosCompl_converter_to_binary = TwosCompl_converter_to_bin( x )
               
        class default
            TwosCompl_converter_to_binary = 'ERROR: WRONG VALUE INTRODUCED' 
        end select 
  
    
end function
  


pure function Check_overflowed_int( x, n_bits ) 
        class(*), intent(in) :: x
        integer, intent(in) :: n_bits
        integer(kind=8) :: Check_overflowed_int
    
        integer(kind=8) :: int
           
        select type(x) 
               
        type is (integer (kind=1))
            int = x
            Check_overflowed_int = Check_overflowed( int, n_bits )
                
        type is (integer (kind=2)) 
            int = x
            Check_overflowed_int = Check_overflowed( int, n_bits )
                   
        type is (integer (kind=4)) 
            int = x
            Check_overflowed_int = Check_overflowed( int, n_bits )
                   
        type is (integer (kind=8))  
            Check_overflowed_int = Check_overflowed( x, n_bits )
               
        class default
            Check_overflowed_int = 0 
        end select 
  
    
end function 
    
    
    
pure function TwosCompl_converter_to_decimal( bits )
    character (len=*), intent(in) :: bits
    integer(kind=8) :: TwosCompl_converter_to_decimal
    
    integer :: N, i
    integer(kind=8) :: x 
    character( len=len( bits ) ) :: v
    
    N = len( bits ); x = 0
    
    if ( N <= 64 ) then
        do i = 1, N
            if ( bits(i:i) == '0' ) then
                v(N+1-i:N+1-i) = '0'
            else if ( bits(i:i) == '1' ) then  
                v(N+1-i:N+1-i) = '1'
            else if ( bits(i:i) == ' ' ) then
                v(N+1-i:N+1-i) = '0'
            else
                TwosCompl_converter_to_decimal = 0
                return
            end if
        end do
    else
        TwosCompl_converter_to_decimal = 0
        return
    end if
    
    !Conversion with N-bits memory size
    !NEED OF 2_8?
    x = - binary_str_to_int( v(N:N) ) * 2_8**(N-1)
    do i = 1, N-1
        x = x + binary_str_to_int( v(i:i) ) * 2_8**(i-1)
    end do
    
    TwosCompl_converter_to_decimal = x
    
end function
    
!-----------------------------------------------------------------------------


pure function TwosCompl_converter_to_bin( int )
    integer(kind=8), intent(in) :: int
    character (len=:), allocatable :: TwosCompl_converter_to_bin
    
    integer :: i, n_bits
    integer(kind=8) :: x
    logical :: negative
    character (len=64) :: v
    
    negative = .false.; x = 0
    
    !sign of the integer
    if (int < 0) then; negative = .true.; end if
        
    !pure binary of the absolute value
    x = abs( int )
 
    v = reverse_pure_binary( x )

    !Two's complement if negative value
    if (negative) then
        v = str_NOT( v )
        v = reverse_ADD1( v )
    end if

    !Reverse the value
    v = reverse_str( v )
    
    n_bits = 64
    !Select minimum bits
    if (negative) then
        do i = 1, 63
            if ( v(i:i) == '1' .and. v(i+1:i+1) == '1' ) then
                n_bits = n_bits - 1
            else if ( v(i:i) == '1' .and. v(i+1:i+1) == '0' ) then 
                exit
            end if               
        end do
        
    else
        do i = 1, 63
            if ( v(i:i) == '0' .and. v(i+1:i+1) == '0' ) then
                n_bits = n_bits - 1
            else if ( v(i:i) == '0' .and. v(i+1:i+1) == '1' ) then 
                exit
            end if               
        end do
                
    end if
    
    allocate( character(n_bits) :: TwosCompl_converter_to_bin )
    if (n_bits < 64) then   
        TwosCompl_converter_to_bin = v(64-n_bits+1:64)
    else 
        TwosCompl_converter_to_bin = v
    end if
    
    
    end function

    
    
pure function Check_overflowed( int, n_bits )
    integer(kind=8), intent(in) :: int
    integer, intent(in) :: n_bits
    integer(kind=8) :: Check_overflowed
    
    character (len=:), allocatable :: v, v_ovfl
    integer :: N
    integer(kind=8) :: int_ovfl
    
    if ( n_bits <= 0 .or. n_bits > 64) then
        Check_overflowed = 0
        return
    end if
    
    v = TwosCompl_converter_to_bin( int )
    N = len( v )
    
    if ( n_bits < N ) then 
        v_ovfl = v(N-n_bits+1:N)
        int_ovfl = TwosCompl_converter_to_decimal( v_ovfl )
        Check_overflowed = int_ovfl
    else
        Check_overflowed = int
    end if
    
end function


!-----------------------------------------------------------------------------
!-----------------------------------------------------------------------------

elemental function  binary_str_to_int( str ) result( int ) 
    character(len=1), intent(in) :: str 
    integer  :: int 
   
    read(str, '(i1)') int 

end function 



pure function str_NOT( str )
    character (len=64), intent(in) :: str
    character (len=64) :: str_NOT
    
    integer :: i
    
    do i = 1, 64
        str_NOT(i:i) = '0'
    end do
    
    do i = 1, 64
        if ( str(i:i)== '0' ) then; str_NOT(i:i) = '1';
        else if ( str(i:i)== '1' ) then; str_NOT(i:i) = '0';
        end if
    end do
    
end function



pure function reverse_ADD1( str )   result ( v )
    character (len=64), intent(in) :: str
    
    integer :: i
    logical :: flag
    character (len=64) :: v
    
    flag = .true.
    
    do i = 1,64
        if ( flag .and. str(i:i) == '1' ) then
            v(i:i) = '0'; flag = .true.
        else if ( flag .and. str(i:i) == '0' ) then
            v(i:i) = '1'; flag = .false.
        else if ( .not.flag .and. str(i:i) == '1' ) then
            v(i:i) = '1'; flag = .false.
        else if ( .not.flag .and. str(i:i) == '0' ) then
            v(i:i) = '0'; flag = .false.
        end if 
            
    end do
    
    
end function



pure function pure_binary( int )
    integer(kind=8), intent(in) :: int
    character (len=64) :: pure_binary
    
    character (len=64) :: v
    integer :: i
    
    v = reverse_pure_binary( int )
    pure_binary = reverse_str( v )
    
end function



pure function reverse_pure_binary( int )
    integer(kind=8), intent(in) :: int
    character (len=64) :: reverse_pure_binary
    
    integer :: i
    integer(kind=8) :: x
    character (len=64) :: v
    
    x = int
    do i = 1, 64
        v(i:i) = '0'
    end do
    
    i = 0
    if ( x >= 0 ) then
        do while ( x /= 0 .and. x /= 1 )
            i = i + 1
            
            if ( mod(x, 2) == 1 ) then; v(i:i) = '1'
            else if ( mod(x, 2) == 0 ) then; v(i:i) = '0'
            end if
            
            x = x/2
        end do
        
        if (x == 1 ) then; v(i+1:i+1) = '1'
        else if ( x == 0 ) then; v(i+1:i+1) = '0'
        end if
        
    else
        reverse_pure_binary(1:27) = 'ERROR: NOT POSITIVE VALUE'
        return
    end if
    
    reverse_pure_binary = v
    
end function



pure function reverse_str( str )
    character (len=*), intent(in) :: str
    character (len=len(str)) :: reverse_str
    
    integer :: i, N
    
    N = len( str )
    
    do i = 1, N
        reverse_str(i:i) = str(n+1-i:n+1-i)
    end do
    
end function
!-----------------------------------------------------------------------------
!-----------------------------------------------------------------------------






end module 