module pointers 
    
    implicit none 
    
contains    

subroutine  pointer_examples()

   real, target :: a, b, v(0:3), U(0:3) 
   real, pointer :: pa, pv(:), pU(:,:)   
   character(len=30) :: fmt1 ="(A, f5.1,/,A, f5.1, /)"
   character(len=30) :: fmt2 ="(A, 4f5.1,/,A, 4f5.1, /)" 
  
  write(*,*) "Scalar and pointers "
  a = 3 
  pa => a 
  write(*, fmt1) " a =", a, " pa = ", pa
   
  a = 4 
  write(*, fmt1) " a =", a, " pa = ", pa
 
  write(*,*) "Vectors and pointers " 
  v =  [ 1, 2, 3, 4 ]
  pv => v
  v(0) = 2 
  write(*, fmt2) " v = ", v, " pv = ", pv
  v = v + 1 
  write(*, fmt2)  " v = ", v, " pv = ", pv
 
  write(*,*) "Arrays of different ranks  "
  U  = [ 1, 2, 3, 4 ] 
  pU(0:1,0:1) => U 
  write(*, fmt2)  " U = ", U,  " pU(0,:) = ", pU(0,:)
  
  pU = 1 
  write(*, fmt2)  " U = ", U,  " pU(0,:) = ", pU(0,:)
  write(*,*) " Press enter "; read(*,*) 
end subroutine  

 
end module 
    
    