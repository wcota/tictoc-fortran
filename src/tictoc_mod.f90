module tictoc_mod
    use, intrinsic :: iso_fortran_env, only: dp => real64
    implicit none
    private

    type :: tictoc_t
        real(kind=dp):: t_ini, t_fin, t_tot
    contains
        procedure :: reset => reset_tictoc
        procedure :: tic => tic_tictoc
        procedure :: toc => toc_tictoc
        procedure :: now => now_tictoc
    end type tictoc_t

    public :: tictoc_t

contains

    subroutine tic_tictoc(this)
        class(tictoc_t) :: this
        call cpu_time(this%t_ini)
    end subroutine

    function now_tictoc(this) result(t)
        class(tictoc_t) :: this
        real(kind=dp) :: t, t_now
        call cpu_time(t_now)
        t = this%t_tot + (t_now - this%t_ini)
    end function

    subroutine toc_tictoc(this)
        class(tictoc_t) :: this
        call cpu_time(this%t_fin)
        this%t_tot = this%t_tot + (this%t_fin - this%t_ini)
    end subroutine

    subroutine reset_tictoc(this)
        class(tictoc_t) :: this
        this%t_tot = 0.0_dp
    end subroutine

end module tictoc_mod
