# tictoc_fortran
TicToc routine - Fortran

Module name: `mod_tictoc`

Create the object:
```fortran
type(tictoc)    :: ctimer
```

Start the timer:
```fortran
call ctimer%start()
```

`tic` and `toc` methods:
```fortran
call ctimer%tic()
! do something
call ctimer%toc()

! do anything else

call ctimer%tic()
! do something
call ctimer%toc()
```

To see how much time was spent doing something: 
```fortran
write(*,*) ctimer%t_tot
```

To reset the counting:
```fortran
call ctimer%reset()
```
