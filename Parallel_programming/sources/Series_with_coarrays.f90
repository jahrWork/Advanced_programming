
!**************************************************    
! It performs sum from n=1 to infinity of 1/n**2 
! with a coarray associated to different images 
!     
!  Author: Nov 2021, juanantonio.hernandez@upm.es 
!**************************************************    
module Series_with_coarrays

  implicit none  


contains 
    
subroutine example_Series_with_coarrays

! this image and number of images 
  integer :: image, j, Ni  

! S is a coarray of dimension  determined at runtime
  real (kind=8), save  :: S[*]  
  
! SN is the total sum of every image   
  real (kind=8) :: SN
  real (kind=8) :: PI = 4*atan(1.0)
  integer :: it1, it2, rate 
  
! N is the total number of terms 
! Nt is the total number of terms of each image   
  integer(kind=8) :: i,  N , Nt 

   call system_clock(it1)
   image = this_image()
   Ni = num_images()
   
!  number of terms to be added    
   N = 2.**38
!  number of terms for each image    
   Nt = N / Ni
 
!  Each image performs a backwards sum of the total sum  
   S = 0 
   do i = image * Nt, 1 + (image-1)*Nt,  -1
      S = S + 1 / real(i)**2
   end do
   
!  partial result of each image    
   write(*,*) " image =", image, " S = ", S  
   
 ! Once image 1 finishes, it sums the contribution of each image
   if (image .eq. 1) then
      
     write(*,*) "Sum contributions of different images  " 
     SN = 0   
     do j = Ni, 1, -1
       SN = SN + S[j] 
     end do
     
     call system_clock(count_rate=rate)
     call system_clock(it2)
     write(*,*) " CPU_time = ", real(it2-it1)/rate 
     
     write (*,*) "Number of images:", Ni
     write (*,*) "Number of terms =", N
     write (*,*) "Calculated  SN=", SN
     write (*,*) "Error=         ", PI**2/6 - SN
     write (*,*) "Error bound =  ", 1./N 
     
   end if

end subroutine    

end module