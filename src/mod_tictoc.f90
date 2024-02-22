module mod_tictoc
implicit none

    type :: tictoc
        real*8 :: t_ini, t_fin, t_tot
        contains
            procedure :: reset => t__tictoc_reset
            procedure :: start => t__tictoc_reset
            procedure :: tic => t__tictoc_tic
            procedure :: toc => t__tictoc_toc
    end type

contains

    subroutine t__tictoc_tic(this)
        class(tictoc) :: this
        call cpu_time(this%t_ini)
    end subroutine
    
    subroutine t__tictoc_toc(this)
        class(tictoc) :: this
        call cpu_time(this%t_fin)
        this%t_tot = this%t_tot + (this%t_fin - this%t_ini )
    end subroutine

    subroutine t__tictoc_reset(this)
        class(tictoc) :: this
        this%t_tot = 0d0
    end subroutine

end module
