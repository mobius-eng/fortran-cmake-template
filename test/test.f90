!//////////////////////////////////////////////////////////////////////
!
!                       BASIC_TEST_M
!
! Basic testing facility. Provides the procedure to test for truth.
!
! Typical use:
!
!     CALL TESTSUIT_START('Testing Foo')
!     [DO SOMETHING]
!     CALL TEST(A == B, 'A is not equal B')
!     CALL TESTSUIT_END
!
! TEST only supports test for .TRUE. condition
!
!//////////////////////////////////////////////////////////////////////
module basic_test_m


implicit none

character(len=256) :: suite_name
integer :: n_passed, n_failed
character(len=1), parameter :: esc = char(27)
character(len=4), parameter :: reset = esc//'[0m'
character(len=2), parameter :: fgred = '31', fggreen='32'
character(len=1), parameter :: bold='1', italic='3', underline='4'

contains

subroutine testsuite_start(name)
  character(len=*) :: name
  suite_name = name
  n_passed = 0
  n_failed = 0
  write (*, '(A)') repeat('=', 72)
  write (*, '(A)') ' '
  write (*, '(A, A, A)') '  ', 'Testing: ', trim(suite_name)
  write (*, '(A)') ' ' 
end subroutine


subroutine test(cond, err_msg)
  logical, intent(in) :: cond
  character(len=*), intent(in) :: err_msg
  character(len=16) :: turn_red
  turn_red = '    '//esc//'['//fgred//'m'
  if (cond) then
    n_passed = n_passed + 1
  else
    n_failed = n_failed + 1
    write (*, '(A,A,A)') trim(turn_red), err_msg, reset
  end if
end subroutine


subroutine test_end
  character(len=16) :: turn_green, turn_red
  turn_red   = esc//'['//fgred//'m'
  turn_green = esc//'['//fggreen//'m'
  write (*, '(A, A10, A2, A10)') '  ', 'Passed', ' |', 'Failed'
  write (*, '(A, A, I10, A, A, I10, A)') '  ', trim(turn_green),      &
    n_passed, ' |', trim(turn_red), n_failed, reset
  write (*, '(A)') ' '
  write (*, '(A)') repeat('=', 72)
  write (*, '(A)') ' '
end subroutine

end module


!//////////////////////////////////////////////////////////////////////

program example

use example_m
use basic_test_m
implicit none

real(rk) :: x, y

call testsuite_start("Cube testing")
x = 2.0_rk
y = cube(x)
call test(y == 8.0_rk, "Test failed for x = 2.0")
x = 0.2_rk
y = cube(x)
call test(abs(y - 0.008_rk) < 1e-10_rk, "Test failed for x = 0.2")
call test_end

end program
