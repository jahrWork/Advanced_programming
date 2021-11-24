

module Utilities 



 implicit none 
 
   

    contains

 
!*****************************************************************
!*
!*****************************************************************
subroutine Data_pointer( N1, N2, U, pU )
     integer, intent(in) :: N1, N2
     real, target, intent(in) :: U(N1, N2)  
     real, pointer, intent(out) :: pU(:,:) 
          
     pU => U  
     
end subroutine 
 
 

!*****************************************************************************
!* It searches the element x in an ordered list V ( x = V(ix) ) 
!* If the element x is not in the list it returns -1 
!*****************************************************************************
subroutine Binary_search(x, V, ix)
    real, intent (in) :: x, V(0:)
    integer, intent (out) :: ix

  integer:: m, upper_limit, lower_limit, N
  N = size(V) - 1 
  
  lower_limit = 0; upper_limit = N;
 
  do while( upper_limit > lower_limit ) 
     
     m = ( upper_limit + lower_limit ) / 2
     
     if ( x > V(m) ) then 
                          lower_limit = m + 1 
     else 
                          upper_limit = m 
     endif 
     
  end do 
 
  !if (x == V(m) ) then 
  !      ix = m 
  !else 
  !      ix = -1 
  !endif 
  ix = lower_limit 
 
 
end subroutine
   
    
   





    
   

!*****************************************************************************
!*
!*****************************************************************************   
real function trace(A) 
  real, intent(in) :: A(:,:) 

  integer :: i
  real :: S 
  
  S = 0 
  do i=1, size(A, dim=1) 
      
      S = S + A(i,i) 
      
  end do 
  
  trace = S 
  

end function   



 
!****************************************************************************************************
!* It looks for the given name in an database (array of names) and if returns its position 
!****************************************************************************************************
logical function  equal(a, b)  
   class(*), intent(in) :: a, b 

   
   select type (a) 
       
       type is (integer) 
            select type (b) 
            type is (integer)
            equal = (a == b)  
            end select
            
        
       type is (character(len=*)) 
            select type (b) 
            type is (character(len=*))
            equal = (trim(a) == trim(b))  
            end select
     
       type is (real) 
            select type (b) 
            type is (real)
            equal = (a == b)  
            end select
            
       class default
             write(*,*) "ERROR " 
             stop 
       
   end select
   
   

   
end function 

!****************************************************************************************************
!* It looks for the given element x in a set of values. If it exists, returns its position 
!****************************************************************************************************
  function  look_forg(x, set)  
   class(*), intent(in) :: x, set(:) 
   integer :: look_forg 


   integer :: i, N 
   
   N = size(set)
      
   look_forg = 0 
   
   do i=1, N 
      if ( equal( x, set(i) ) ) then  
                                look_forg = i 
                                exit   
      endif
      
   end do 
   
   
end function  
  
 
!*****************************************************************************
!*
!*****************************************************************************   
subroutine split( string, delimiter, substrings, N  ) 
   character(len=*), intent(in) :: string 
   character(len=1), intent(in) :: delimiter
   character(len=*), intent(out) :: substrings(:) 
   integer, intent(out) :: N 


      integer :: i, index, k 
   
    i = 1   
    k = 1 
    do while (i<=len(string) ) 
        
        index = scan( string(i:), delimiter) 
        
        if (index>0) then 
                          substrings(k) = string(i:i+index-2)
                          i = i + index 
                          k = k + 1 
        else 
             substrings(k) = string(i:i+len(string))
             N = k 
             exit 
        endif 
        
    end do 
    
    
    !write(*,'(A,A)') " strings = ", string
    !   
    !do k=1, N 
    !   write(*,*) " substrings = ", substrings(k) 
    !end do    
    !read(*,*) 



end subroutine 


 !*********************************************************************************
 function factorial8(n) 
    integer(kind=8), intent(in) :: n 
    integer (kind=8) :: factorial8 
    
     integer :: i
     integer (kind=8) ::  p
  
    
     p = 1 
     
     do i=1, n 
         
         p = p * i 
     
     end do 
     
     factorial8 = p 
    ! write(*,*) "huge p = ", huge(p), " factorial =", p 
    
 end function 
 



 !*********************************************************************************
 function factorial(n) 
    integer, intent(in) :: n 
    integer(kind=8) :: factorial 
    
     integer :: i
     integer (kind=8) :: fac , p 
    
     p = 1 
     
     do i=1, n 
         
         fac = p * i 
         
         if ( fac > huge(p)  )  then 
             
             write(*,*) " Error fac= ", fac, " huge(p) =", huge(p)  
             stop 
             
         else 
             p = fac 
      !       write(*,*) " p = ", p, " i=", i  
         end if 
    
                  
     end do 
     
     factorial = p 
  !   write(*,*) "huge p = ", huge(p), " factorial =", p 
    
 end function 

 function rfactorial(n) 
    integer, intent(in) :: n 
    real :: rfactorial 
    
     integer :: i
     real :: fac , p 
    
     p = 1 
     
     do i=1, n 
         
         fac = p * i 
         
         if ( fac > huge(p)  )  then 
             
             write(*,*) " Error fac= ", fac, " huge(p) =", huge(p)  
             stop 
             
         else 
             p = fac 
      !       write(*,*) " p = ", p, " i=", i  
         end if 
    
                  
     end do 
     
     rfactorial = p 
  !   write(*,*) "huge p = ", huge(p), " factorial =", p 
    
 end function 
 
 
    
 


end module 
    
    
    

    