test_that("vld_missing", {
  expect_true(vld_missing())
  expect_false(vld_missing(1))
})

test_that("vld_missing in function", {
  fun <- function(x) vld_missing(x)
  expect_true(fun())
  expect_false(fun(1))
})

test_that("vld_missing in function default", {
  fun <- function(x = 1) vld_missing(x)
  # this might be expected to be true if testing whether specified
  expect_false(fun())
  expect_false(fun(1))
})

test_that("chk_missing", {
  expect_null(chk_missing())
  expect_invisible(chk_missing())
  expect_chk_error(chk_missing(1), "^`1` must be missing\\.$")
  expect_chk_error(chk_missing(1, x_name = "`y`"), "^`y` must be missing\\.$")
})

test_that("chk_missing in function", {
  fun <- function(x) chk_missing(x)

  expect_null(fun())
  expect_invisible(fun())
  expect_chk_error(fun(1), "^`x` must be missing\\.$")
})

test_that("chk_missing in function default", {
  fun <- function(x = 1) chk_missing(x)

  # this might be expected to be an error if testing whether specified
  expect_chk_error(fun(), "^`x` must be missing\\.$")
  # this might be expected to be an error if testing whether specified
  expect_chk_error(fun(NULL), "^`x` must be missing\\.$")
  expect_chk_error(fun(1), "^`x` must be missing\\.$")
})
