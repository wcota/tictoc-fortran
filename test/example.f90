program example_tictoc
use mod_tictoc
implicit none

    type(tictoc)    :: ctimer
    integer         :: i, j
    real*8          :: x(10000)
    
    call ctimer%start()
    call ctimer%tic()
    do j=1,100000
        x(:) = log(23.)*[ (i,i=1,10000) ]
    enddo
    call ctimer%toc()
    
    write(*,'(a,f)') 'CPU TIME = ', ctimer%t_tot
    
    write(*,'(a)') 'Now measuring inside the loop...'
    
    call ctimer%reset()
    do j=1,100000
        call ctimer%tic()
        x(:) = log(23.)*[ (i,i=1,10000) ]
        call ctimer%toc()
    enddo
    
    write(*,'(a,f)') 'CPU TIME = ', ctimer%t_tot

end program
