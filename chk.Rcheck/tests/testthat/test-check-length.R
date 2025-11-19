test_that("check_length length", {
  expect_identical(check_length(1), 1)
  expect_invisible(check_length(1))

  expect_identical(check_length(integer(0)), integer(0))
  expect_chk_error(
    check_length(integer(0), values = TRUE),
    "^`length[(]integer[(]0[)][)]` must be greater than 0, not 0[.]$"
  )
  expect_chk_error(
    check_length(1, values = FALSE),
    "^`length[(]1[)]` must be equal to 0L[.]"
  )
  expect_identical(check_length(2, values = 1), check_length(2, values = 1))
  expect_chk_error(
    check_length(1, values = 2),
    "^`length[(]1[)]` must be equal to 2[.]"
  )
  expect_chk_error(
    check_length(1, values = 2:3),
    "^`length[(]1[)]` must be between 2 and 3, not 1[.]"
  )
  expect_chk_error(
    check_length(1, values = 3:2),
    "^`length[(]1[)]` must be between 2 and 3, not 1[.]"
  )
  expect_identical(check_length(1:2, values = 2:3), check_length(1:2, values = 2:3))
  expect_chk_error(
    check_length(2, values = c(2, 2)),
    "`length[(]2[)]` must be equal to 2[.]"
  )
  expect_chk_error(
    check_length(2, values = c(2, 2, 2)),
    "`length[(]2[)]` must match 2, not 1[.]"
  )
  expect_chk_error(
    check_length(2, values = c(3, 2, 2)),
    "`length[(]2[)]` must match 2 or 3, not 1[.]"
  )

  expect_chk_error(
    check_length(1, values = 1.1), "^At least one of the following conditions must be met:\n[*] `values` must be a flag [(]TRUE or FALSE[)].\n[*] `values` must be a whole numeric vector \\(integer vector or double equivalent\\)\\.$"
  )
})
