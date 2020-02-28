test_that("check_length", {
  expect_null(check_length(1))
  expect_invisible(check_length(1))
  expect_chk_error(check_length(integer(0)),
                   "^`length[(]integer[(]0[)][)]` must be greater than 0, not 0[.]$")
  expect_chk_error(check_length(1, values = FALSE),
                   "^`length[(]1[)]` must be equal to: 0L[.]")
  expect_null(check_length(2, values = 1))
  expect_chk_error(check_length(1, values = 2),
                   "^`length[(]1[)]` must be equal to: 2[.]")
  expect_chk_error(check_length(1, values = 2:3),
                   "^`length[(]1[)]` must be between 2 and 3, not 1[.]")
  expect_chk_error(check_length(1, values = 3:2),
                   "^`length[(]1[)]` must be between 2 and 3, not 1[.]")
  expect_null(check_length(1:2, values = 2:3))
  expect_chk_error(check_length(2, values = c(2,2)),
                   "`length[(]2[)]` must be equal to: 2[.]")
  expect_chk_error(check_length(2, values = c(2,2,2)),
                   "`length[(]2[)]` must match 2, not 1[.]")
  expect_chk_error(check_length(2, values = c(3,2,2)),
                   "`length[(]2[)]` must match 2 or 3, not 1[.]")
})
