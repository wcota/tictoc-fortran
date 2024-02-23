module mod_tictoc
   implicit none
   private

   integer, parameter :: dp = selected_real_kind(15)

   type :: tictoc
      real(kind=dp):: t_ini, t_fin, t_tot
   contains
      procedure :: reset => reset_tictoc
      procedure :: tic => tic_tictoc
      procedure :: toc => toc_tictoc
      procedure :: now => now_tictoc
   end type

   public :: tictoc

contains

   subroutine tic_tictoc(this)
      class(tictoc) :: this
      call cpu_time(this%t_ini)
   end subroutine

   function now_tictoc(this) result(t)
      class(tictoc) :: this
      real(kind=dp) :: t, t_now
      call cpu_time(t_now)
      t = this%t_tot + (t_now - this%t_ini)
   end function

   subroutine toc_tictoc(this)
      class(tictoc) :: this
      call cpu_time(this%t_fin)
      this%t_tot = this%t_tot + (this%t_fin - this%t_ini)
   end subroutine

   subroutine reset_tictoc(this)
      class(tictoc) :: this
      this%t_tot = 0d0
   end subroutine

end module
