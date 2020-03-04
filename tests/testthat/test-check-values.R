test_that("check_values pass", {
  expect_null(check_values(1, 1))
  expect_invisible(check_values(1, 1))
  expect_null(check_values(1, numeric(0)))
  expect_null(check_values(integer(0), 1:3))
  expect_null(check_values(1L, integer(0)))
  expect_null(check_values(NA_real_, numeric(0)))
  expect_null(check_values(1, -1))
  expect_null(check_values(1, NA_real_))
  expect_null(check_values(1, c(2, NA_real_)))
  expect_null(check_values(1, c(1, 2, NA_real_)))
  expect_null(check_values(1, c(1, 1)))
  expect_null(check_values(1, c(0.5, 2, NA_real_)))
  expect_null(check_values(c(1, NA_real_), c(0.5, 2, NA_real_)))
})

test_that("check_values fail", {
  expect_chk_error(
    check_values(1.1, c(1, 1)),
    "^All elements of `1.1` must be equal to: 1[.]"
  )
  expect_chk_error(
    check_values(1L, 1),
    "^`1L` must inherit from S3 class 'numeric'[.]$"
  )
  expect_chk_error(check_values(1, 1L), "`1` must inherit from S3 class 'integer'[.]")
  expect_chk_error(check_values(1L, numeric(0)), "`1L` must inherit from S3 class 'numeric'[.]")
  expect_chk_error(
    check_values(NA_real_, 1),
    "`NA_real_` must not have any missing values[.]"
  )
  expect_chk_error(
    check_values(1L, 2:3),
    "`1L` must be between 2 and 3, not 1[.]"
  )
  expect_chk_error(
    check_values(1:10, 21:22),
    "`1:10` must have values between 21 and 22[.]"
  )
  expect_chk_error(
    check_values(1:10, 22:21),
    "`1:10` must have values between 21 and 22[.]"
  )
  expect_chk_error(
    check_values(1:10, 21:23),
    "`1:10` must have values matching 21, 22 or 23[.]"
  )
})
