# tictoc_fortran

TicToc routine - Fortran

## Usage 

Copy the file `src/tictoc.f90` or add the package as a dependence using the [Fortran Package Manager](https://fpm.fortran-lang.org/):

```toml
[dependencies]
mod_tictoc.git = "https://github.com/wcota/tictoc_fortran"
```

Import the module using `use mod_tictoc`. This package provides the `tictoc` object. Create one using

```fortran
type(tictoc)    :: ctimer
```

Start the timer:
```fortran
call ctimer%start()
```

Use the `tic` to start the clock, and `toc` to pause it: 

```fortran
call ctimer%tic()
! do something
call ctimer%toc()

! do anything else

call ctimer%tic()
! do something
call ctimer%toc()
```

To see how much time was spent doing something, use the `real` variable `t_tot`:

```fortran
write(*,*) ctimer%t_tot
```

It is also possible to reset the clock by using:

```fortran
call ctimer%reset()
```
