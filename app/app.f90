program test

use example_m
implicit none

real(rk), allocatable :: x(:), y(:)
integer(ik) :: n, i
character(len=64) :: fmt

n = 8
allocate(x(n), y(n))

call random_number(x)
y = cube(x)

write (fmt, "(A,I2,A)") "(", n, "G0)"
write (*,fmt) (x(i), i=1,n)
write (*,fmt) (y(i), i=1,n)

! Add testing here

end program