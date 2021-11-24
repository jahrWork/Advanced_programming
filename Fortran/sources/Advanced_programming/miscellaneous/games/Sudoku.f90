
module Sudoku

   implicit none 

    integer :: branch = 0
    logical :: debug = .false. !.true. !
   
contains 


!*******************************************************
! It explores sudoku branches of sudoku matrix A(9,9)
! by increasing rows(i) and columms(j)
! from j = 1...9, from i = 1..9
!
! INPUTS:  i,j, A 
! OUTPUTS: As solution matrix 
!*******************************************************
recursive subroutine branches_solver(A, i, j, As)
                 integer :: A(9,9), i, j
                 integer, intent(out) :: As(9,9) 
    
    integer :: k, k0, i1, j1 
    
        
!** solution is the branch which gets the last sudoku cell
    if (i > 9) then
      As = A  
      
!** explore k valid number in position i,j         
    else
      do k = 1, 9 
        if ( is_valid(A, i, j, k) ) then
            
             k0 = A(i, j) 
             A(i, j) = k  
             call new_cell(k0, k, i, j, i1, j1) 
             call branches_solver(A, i1, j1, As)
          
        !** set A(i,j) to try another branch 
            if(k0==0) A(i,j) =0
            call print_branch(i,j)
        end if
      end do
     
    end if
    
end subroutine 

!*********************************************************
! It checks if k value is a valid number in position i,j
!*********************************************************
logical function is_valid(A, i, j, k)
     integer, intent(in) :: A(9,9), i, j, k 
     
     integer :: ic, jc, i0, j0
     
     ic = (i-1)/3;  jc = (j-1)/3 
     i0 = 1 + 3*ic; j0 = 1 + 3*jc
     
     if (A(i, j) == k) then
         
            is_valid = .true.
            
     elseif ( A(i,j) /=0 .or. any( A(i,:)==k ) .or.  & 
             any( A(:,j)==k ) .or. any( A(i0:i0+2, j0:j0+2)==k ) ) then 
         
            is_valid = .false.  
     else
            is_valid = .true. 
     end if 
         
end function 

!*********************************************************
! It increases position i,j by columns  
!*********************************************************
subroutine new_cell(k0, k, i, j, i1, j1) 
   integer, intent(in):: k0, k, i, j
   integer, intent(out) :: i1, j1 
   
    if (j<9) then
                   i1= i; j1 = j+1 
    else 
                   i1= i+1; j1 = 1
    end if 
    
    if (debug) then 
      write(*,'(a16,i2,a6,i2,a3,i2)') "Value of A(i,j) =", k0, " in i=", i, "j=", j  
      write(*,'(a16,i2)') "Explore k =      ", k
      read(*,*)
    endif 
      
end subroutine      


subroutine  sudoku_examples

    integer :: A(9,9), Ab(9,9), As(9,9) 
    
    A(1, :) = [0, 0, 3, 0, 0, 0, 0, 0, 0]
    A(2, :) = [4, 0, 0, 0, 8, 0, 0, 3, 6]
    A(3, :) = [0, 0, 8, 0, 0, 0, 1, 0, 0]
    A(4, :) = [0, 4, 0, 0, 6, 0, 0, 7, 3]
    A(5, :) = [0, 0, 0, 9, 0, 0, 0, 0, 0]
    A(6, :) = [0, 0, 0, 0, 0, 2, 0, 0, 5]
    A(7, :) = [0, 0, 4, 0, 7, 0, 0, 6, 8]
    A(8, :) = [6, 0, 0, 0, 0, 0, 0, 0, 0]
    A(9, :) = [7, 0, 0, 6, 0, 0, 5, 0, 0]
    
    
    Ab(1, :) = [0, 0, 3, 0, 2, 0, 6, 0, 0]
    Ab(2, :) = [9, 0, 0, 3, 0, 5, 0, 0, 1]
    Ab(3, :) = [0, 0, 1, 8, 0, 6, 4, 0, 0]
    Ab(4, :) = [0, 0, 8, 1, 0, 2, 9, 0, 0]
    Ab(5, :) = [7, 0, 0, 0, 0, 0, 0, 0, 8]
    Ab(6, :) = [0, 0, 6, 7, 0, 8, 2, 0, 0]
    Ab(7, :) = [0, 0, 2, 6, 0, 9, 5, 0, 0]
    Ab(8, :) = [8, 0, 0, 2, 0, 3, 0, 0, 9]
    Ab(9, :) = [0, 0, 5, 0, 1, 0, 3, 0, 0]
    
   
    write(*,*) "Sudoku: easy example" 
    call print_matrix(Ab) 
    write(*,*) "Enter to solve it" 
    read(*,*) 
    call branches_solver(Ab, 1, 1, As)  
    call print_matrix(As) 

    
    write(*,*) "Sudoku: difficult solution"
    call print_matrix(A) 
    write(*,*) "Enter to solve it" 
    read(*,*) 
    call branches_solver(A, 1, 1, As) 
    call print_matrix(As) 
  
    
end subroutine 

subroutine print_matrix(A)
  integer, intent(in) :: A(9,9) 
  
   integer :: i, k 
 
 write(*,*) " "   
 write(*,'(A)') (" ----------------------------")  
 do k=0, 2
     do i=1, 3
        write(*,'(3(A3,3i2), A3)') " | ", A(i+3*k,1:3), " | ", A(i+3*k,4:6), " | ", A(i+3*k,7:9), " | "
     end do    
     write(*,'(A)') (" ----------------------------") 
 end do 
 
end subroutine 

 

subroutine print_branch(i, j) 
   integer, intent(in):: i, j 

 !  if (debug) then 
       
   
     if ( mod(branch, 10000)==0 ) then 
        write(*,*) "Exit invalid branch", i, j, branch 
     end if 
    branch = branch + 1 

 !  end if 
   
 end subroutine   

end module 
    
