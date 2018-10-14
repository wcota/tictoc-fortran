# tictoc_fortran
TicToc routine - Fortran

Module name: `mod_tictoc`

Create the object:
```
type(tictoc)    :: ctimer
```

Start the timer:
```
call ctimer%start()
```

`tic` and `toc` methods:
```
call ctimer%tic()
! do something
call ctimer%toc()

! do anything else

call ctimer%tic()
! do something
call ctimer%toc()
```

To see how much time was spent doing something: 
```
write(*,*) ctimer%t_tot
```

To reset the couting:
```
call ctimer%reset()
```
