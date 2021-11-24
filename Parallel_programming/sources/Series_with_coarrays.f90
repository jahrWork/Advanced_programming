
!**************************************************    
! It performs sum from n=1 to infinity of 1/n**2 
! with a coarray associated to different images 
!     
!  Author: Nov 2021, juanantonio.hernandez@upm.es 
!**************************************************    
program Series_with_coarrays

implicit none  

! this image and number of images 
  integer :: image, Ni  

! S is a coarray of dimension  determined at runtime
  real (kind=8) :: S[*]
  
! SN is the total sum of every image   
  real (kind=8) :: SN
  real (kind=8) :: t0, tf, rate, PI = 4*atan(1.0)
  
! N is the total number of terms 
! Nt is the total number of terms of each image   
  integer(kind=8) :: i, N , Nt 

   call cpu_time(t0) 
   image = this_image()
   Ni = num_images()
   
!  number of terms to be added    
   N = 2.**35
!  number of terms for each image    
   Nt = N / Ni
 
!  Each image performs a bacwards sum of the total sum  
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
     do i = Ni, 1, -1
       SN = SN + S[i] 
     end do
     
     call cpu_time(tf)
     write (*,*) "CPU time:", tf-t0
     write (*,*) "Number of images:", Ni
     write (*,*) "Number of terms =", N
     write (*,*) "Calculated  SN=", SN
     write (*,*) "Error=         ", PI**2/6 - SN
     write (*,*) "Error bound =  ", 1./N 
     
   end if

end program 