module pointers 
    
    implicit none 
    
contains    

  
subroutine  pointer_examples()

   real, target :: a, b, v(0:2), U(0:3) 
   real, pointer :: pa, pv(:), pU(:,:)  
   character(len=10) :: fmt ="(A, 4f5.1)" 

   write(*,*) "Scalar and pointers "
   a = 3 
   pa => a 
   write(*,*) " a =", a, "  pa = ", pa
   
  a = 4 
  write(*,*) " pa = ", pa
  write(*,*)
 
  write(*,*) "Vectors and pointers " 
  v =  [ 1, 2, 3 ]
  pv => v
  v(0) = 2 
  write(*, fmt) " v = ", v
  write(*, fmt) " pv = ", pv
  
  v = v + 1 
  write(*, fmt)  " v = ", v
  write(*, fmt)  " pv = ", pv
  write(*,*)
 
  write(*,*) "Arrays of different ranks  "
  U  = [ 1, 2, 3, 4 ]
  write(*, fmt)  " U = ", U
  pU(0:1,0:1) => U 
  write(*, fmt)  " pU(0,:) = ", pU(0,:)
  pU = 1 
  write(*, fmt)" U = ", U
  write(*,*) " Press enter " 
  read(*,*) 

end subroutine  
 
 
end module 
    
    