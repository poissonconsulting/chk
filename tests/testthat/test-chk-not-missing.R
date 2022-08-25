test_that("vld_not_missing", {
  expect_false(vld_not_missing())
  expect_true(vld_not_missing(1))
})

test_that("vld_not_missing in function", {
  fun <- function(x) vld_not_missing(x)
  expect_false(fun())
  expect_true(fun(1))
})

test_that("vld_not_missing in function default", {
  fun <- function(x = 1) vld_not_missing(x)
  # this might be expected to be false if testing whether specified
  expect_true(fun())
  expect_true(fun(1))
})

test_that("chk_not_missing", {
  expect_identical(chk_not_missing(1), 1)
  expect_invisible(chk_not_missing(1))
  expect_chk_error(chk_not_missing(), "^`x` must not be missing\\.$")
  expect_chk_error(chk_not_missing(x_name = "`y`"), "^`y` must not be missing\\.$")
})

test_that("chk_not_missing in function", {
  fun <- function(x) chk_not_missing(x)

  expect_chk_error(fun(), "^`x` must not be missing\\.$")
  expect_identical(fun(1), 1)
})

test_that("chk_not_missing in function default", {
  fun <- function(x = 1) chk_not_missing(x)

  expect_identical(fun(NULL), NULL)
  expect_identical(fun(), 1)
  expect_identical(fun(2), 2)
})
