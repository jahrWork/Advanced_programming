
module polymorphism 

   use polygon_class
   use square_class
   use circle_class 
   implicit none 
   
    contains 
    
subroutine polymorphism_example 
    
       type (circle),  target :: C 
       type (square),  target :: S 
       type (polygon), target :: P
       
       type :: Polymorphic_Pointer
         class(*), pointer :: p => null()
       end type 
       
            
     ! perimeter of polymorphic or abstract pointers 
       type (Polymorphic_Pointer), pointer :: polygons(:) 
       
       integer :: i, N    ! number of polygons 
       real :: L          ! total perimeter
            
       P = polygon( [1., 2., 3. ] )   ! polygon
       S = square( 4. )               ! square length side = 4 
       C = circle( 10. )              ! circle of radius = 10 
        
     ! every pointer is associated to different objects           
       N = 4 
       allocate ( polygons(N) ) 
  
       polygons(1) % p => P
       polygons(2) % p => S
       polygons(3) % p => C
       polygons(4) % p => P
      
     ! method overriding between inherited classes (perimeter) 
       L = 0 
       do i = 1, N  
         select type( Fi =>  polygons(i) % p ) 
             class is (polygon) 
                L = L + Fi % perimeter()
         end select 
       end do 
       write(*,*) " Total perimeter = ", 2 * 6 + 4 * 4 + 2 * 3.1416 * 10    
       write(*,*) " polygons Total perimeter = ", L    
       
end subroutine 

end module 
    

