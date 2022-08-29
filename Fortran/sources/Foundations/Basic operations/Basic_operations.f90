module Basic_operations 
    
    implicit none  
    
contains     

 subroutine Data_types()
 
     integer :: int = 1
     real :: x = 1.8
     complex :: com = (1,1)
     logical :: bool = .true.
     character (len=10,kind=1) :: string = 'data types'
         
 end subroutine 
 
 end module 
