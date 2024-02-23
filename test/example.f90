program example_tictoc
   use mod_tictoc
   implicit none

   integer, parameter :: dp = selected_real_kind(15)

   type(tictoc)    :: ctimer
   integer         :: i, j
   real(kind=dp)          :: x(10000)

   call ctimer%reset()
   call ctimer%tic()
   do j = 1, 100000
      x(:) = log(23.)*[(i, i=1, 10000)]
   end do
   call ctimer%toc()

   write (*, '(g0)') 'CPU TIME = ', ctimer%t_tot

   write (*, '(a)') 'Now measuring inside the loop...'

   call ctimer%reset()
   do j = 1, 100000
      call ctimer%tic()
      x(:) = log(23.)*[(i, i=1, 10000)]
      call ctimer%toc()

      if (j == 5000) write(*, '(g0)') 'CPU TIME NOW (without pausing) = ', ctimer%now()
   end do

   write (*, '(g0)') 'CPU TIME = ', ctimer%t_tot

end program
