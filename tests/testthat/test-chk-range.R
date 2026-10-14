test_that("vld_range", {
  expect_true(vld_range(numeric(0)))
  expect_true(vld_range(numeric(0), c(1, 1)))
  expect_true(vld_range(NA_real_))
  expect_true(vld_range(1))
  expect_true(vld_range(1:3 / 3))
  expect_true(vld_range(numeric(0), 1L))

  expect_false(vld_range(-1))
  expect_true(vld_range(c(-1, -1), c(-2, -1)))
  expect_true(vld_range(c(NA, 1), 1:2))
})

test_that("chk_range", {
  expect_identical(chk_range(1), 1)
  expect_invisible(chk_range(1))

  expect_chk_error(chk_range(-1), "^`-1` must be between 0 and 1, not -1[.]$")
  expect_chk_error(
    chk_range(c(-1, NA)),
    "^`c[(]-1, NA[)]` must have values between 0 and 1[.]$"
  )
  expect_chk_error(chk_range(2, c(1, 1)), "^`2` must be 1, not 2[.]$")
  expect_chk_error(
    chk_range(c(2, 1), c(1, 1)),
    "^`c[(]2, 1[)]` must have values of 1[.]$"
  )
  expect_chk_error(chk_range(2, c(1, 1), x_name = 1), "^1 must be 1, not 2[.]$")

  expect_chk_error(
    chk_range(-1, inclusive = FALSE),
    "^`-1` must be between 0 and 1 exclusive, not -1[.]$"
  )
  expect_chk_error(
    chk_range(c(-1, NA), inclusive = FALSE),
    "^`c[(]-1, NA[)]` must have values between 0 and 1 exclusive[.]$"
  )
  expect_chk_error(
    chk_range(2, c(1, 1), inclusive = FALSE),
    "^`2` must be between 1 and 1 exclusive, not 2[.]$"
  )
  expect_chk_error(
    chk_range(c(2, 1), c(1, 1), inclusive = FALSE),
    "^`c[(]2, 1[)]` must have values between 1 and 1 exclusive[.]$"
  )
  expect_chk_error(
    chk_range(2, c(3, 4), inclusive = FALSE, x_name = 1),
    "^1 must be between 3 and 4 exclusive, not 2[.]$"
  )
})

test_that("vld_lt", {
  expect_true(vld_lt(numeric(0)))
  expect_true(vld_lt(NA))
  expect_true(vld_lt(-1))
  expect_true(vld_lt(c(-1, -Inf)))
  expect_false(vld_lt(0))
  expect_false(vld_lt(1))
})

test_that("chk_lt", {
  expect_identical(chk_lt(-1), -1)
  expect_invisible(chk_lt(-1))
  expect_chk_error(chk_lt(1), "^`1` must be less than 0, not 1[.]$")
  expect_chk_error(
    chk_lt(c(1, -1)),
    "^`c[(]1, -1[)]` must have values less than 0[.]$"
  )
  expect_chk_error(chk_lt(1, x_name = -1), "^-1 must be less than 0, not 1[.]$")
})

test_that("vld_lte", {
  expect_true(vld_lte(numeric(0)))
  expect_true(vld_lte(NA))
  expect_true(vld_lte(-1))
  expect_true(vld_lte(c(-1, -Inf)))
  expect_true(vld_lte(0))
  expect_false(vld_lte(1))
})

test_that("chk_lte", {
  expect_identical(chk_lte(-1), -1)
  expect_invisible(chk_lte(-1))
  expect_chk_error(
    chk_lte(1),
    "^`1` must be less than or equal to 0, not 1[.]$"
  )
  expect_chk_error(
    chk_lte(c(1, -1)),
    "^`c[(]1, -1[)]` must have values less than or equal to 0[.]$"
  )
  expect_chk_error(
    chk_lte(1, x_name = "0"),
    "^0 must be less than or equal to 0, not 1[.]$"
  )
  err <- rlang::catch_cnd(chk_lte(1))
  expect_identical(err$x, 1)
  expect_identical(err$value, 0)
})

test_that("vld_gt", {
  expect_true(vld_gt(numeric(0)))
  expect_true(vld_gt(NA))
  expect_true(vld_gt(1))
  expect_true(vld_gt(c(1, Inf)))
  expect_false(vld_gt(0))
  expect_false(vld_gt(-1))
})

test_that("chk_gt", {
  expect_identical(chk_gt(1), 1)
  expect_invisible(chk_gt(1))
  expect_chk_error(chk_gt(-1), "^`-1` must be greater than 0, not -1[.]$")
  expect_chk_error(
    chk_gt(c(1, -1)),
    "^`c[(]1, -1[)]` must have values greater than 0[.]$"
  )
  expect_chk_error(
    chk_gt(-1, x_name = "`a number`"),
    "^`a number` must be greater than 0, not -1[.]$"
  )
})

test_that("vld_gte", {
  expect_true(vld_gte(numeric(0)))
  expect_true(vld_gte(NA))
  expect_true(vld_gte(1))
  expect_true(vld_gte(c(1, Inf)))
  expect_true(vld_gte(0))
  expect_false(vld_gte(-1))
})

test_that("chk_gte", {
  expect_identical(chk_gte(1), 1)
  expect_invisible(chk_gte(1))
  expect_chk_error(
    chk_gte(-1),
    "^`-1` must be greater than or equal to 0, not -1[.]$"
  )
  expect_chk_error(
    chk_gte(c(1, -1)),
    "^`c[(]1, -1[)]` must have values greater than or equal to 0[.]$"
  )
  expect_chk_error(
    chk_gte(-1, x_name = "another number"),
    "^Another number must be greater than or equal to 0, not -1[.]$"
  )
})

test_that("vld_lte with vector value", {
  expect_true(vld_lte(c(1, 2), c(1, 3)))
  expect_false(vld_lte(c(2, 2), c(1, 3)))
  expect_true(vld_lte(c(NA, 2, 1), c(0, 3, 1)))
  expect_true(vld_lte(c(1, 5, NA), c(2, NA, 0)))
  expect_true(vld_lte(numeric(0), numeric(0)))
  expect_error(
    vld_lte(1:3, 1:2),
    "`value` must be a scalar or the same length as `x`[.]"
  )
  expect_error(
    vld_lte(1:2, numeric(0)),
    "`value` must be a scalar or the same length as `x`[.]"
  )
})

test_that("vld_lt, vld_gte and vld_gt with vector value", {
  expect_true(vld_lt(c(1, NA), c(2, 0)))
  expect_false(vld_lt(c(1, 2), c(2, 2)))
  expect_true(vld_gte(c(1, NA), c(1, 2)))
  expect_false(vld_gte(c(1, 2), c(1, 3)))
  expect_true(vld_gt(c(2, 1), c(1, NA)))
  expect_false(vld_gt(c(2, 1), c(1, 1)))
})

test_that("chk_lte with vector value", {
  x <- c(2, 5, 1)
  expect_identical(chk_lte(x, c(2, 5, 1)), x)
  expect_invisible(chk_lte(x, c(2, 5, 1)))
  expect_chk_error(
    chk_lte(x, c(1, 3, 1)),
    "^`x` must have values less than or equal to the corresponding values of `value`, not at positions 1 and 2[.]$"
  )
  err <- rlang::catch_cnd(chk_lte(x, c(1, 3, 1)))
  expect_identical(err$value, c(1, 3, 1))
})

test_that("chk_lt, chk_gte and chk_gt with vector value", {
  x <- c(2, 5, 1)
  expect_chk_error(
    chk_lt(x, c(3, 5, 2)),
    "^`x` must have values less than the corresponding values of `value`, not at position 2[.]$"
  )
  expect_chk_error(
    chk_gte(x, c(1, 6, 2)),
    "^`x` must have values greater than or equal to the corresponding values of `value`, not at positions 2 and 3[.]$"
  )
  expect_chk_error(
    chk_gt(x, c(1, 3, 1)),
    "^`x` must have values greater than the corresponding values of `value`, not at position 3[.]$"
  )
})

test_that("chk_lte with vector value of dates", {
  start <- as.POSIXct(c("2020-01-02", NA, "2020-01-05"), tz = "UTC")
  end <- as.POSIXct(c("2020-01-03", "2020-01-01", NA), tz = "UTC")
  expect_identical(chk_lte(start, end), start)
  expect_chk_error(
    chk_lte(start, end - 2 * 86400),
    "not at position 1[.]$"
  )
})
