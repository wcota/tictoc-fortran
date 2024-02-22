module mod_tictoc
   implicit none
   private

   integer, parameter :: dp = selected_real_kind(15)

   type :: tictoc
      real(kind=dp):: t_ini, t_fin, t_tot
   contains
      procedure :: reset
      procedure :: start
      procedure :: tic
      procedure :: toc
   end type

   public :: tictoc

contains

   subroutine tic(this)
      class(tictoc) :: this
      call cpu_time(this%t_ini)
   end subroutine

   subroutine toc(this)
      class(tictoc) :: this
      call cpu_time(this%t_fin)
      this%t_tot = this%t_tot + (this%t_fin - this%t_ini)
   end subroutine

   subroutine reset(this)
      class(tictoc) :: this
      this%t_tot = 0d0
   end subroutine

end module
