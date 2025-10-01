module example_m

use iso_fortran_env, only: real64, int64
implicit none

integer, parameter ::                                                 &
  rk = real64,                                                        &
  ik = int64


contains

pure elemental function cube(x) result(y)
  real(rk), intent(in):: x
  real(rk) :: y
  y = x * x * x
end function


end module