# tictoc_fortran

TicToc routine - Fortran

## Usage 

Copy the file `src/tictoc.f90` or add the package as a dependence using the [Fortran Package Manager](https://fpm.fortran-lang.org/) (Fpm):

```toml
[dependencies]
tictoc_fortran.git = "https://github.com/wcota/tictoc_fortran"
```

Import the module using `use mod_tictoc`. This package provides the `tictoc` object. Create one using

```fortran
type(tictoc)    :: ctimer
```

Reset the timer:
```fortran
call ctimer%reset()
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

## Example

An example is available at `test/example.f90`. To run it with Fpm, use `fpm test example`. Expected output:

```
Project is up to date
CPU TIME = 
0.35635800000000001
Now measuring inside the loop...
CPU TIME = 
0.57127699999999348
```

Tested with `gfortran`, `ifort` and `ifx` compilers.