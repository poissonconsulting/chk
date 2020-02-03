context("deprecated")

test_that("vld_is", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")

  expect_true(vld_is(1, "numeric"))
  expect_false(vld_is(1L, "numeric"))
  expect_true(vld_is(1L, "integer"))

  x <- list()
  class(x) <- c("a", "b")
  expect_true(vld_is(x, "a"))
  expect_true(vld_is(x, "b"))
})

test_that("chk_is", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")

  expect_null(chk_is(1L, "integer"))
  expect_invisible(chk_is(1L, "integer"))
  expect_chk_error(chk_is(1, "integer"), "^`1` must inherit from class 'integer'[.]$")
  expect_chk_error(
    chk_is(matrix(1), "numeric"),
    "`matrix[(]1[)]` must inherit from class 'numeric'[.]$"
  )
  x <- list()
  class(x) <- c("a", "b")
  expect_chk_error(chk_is(x, "c"), "`x` must inherit from class 'c'")
  expect_chk_error(chk_is(x, "c", x_name = "c"), "C must inherit from class 'c'")
})

test_that("on", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")

  setup(chk_off())

  teardown({
    rlang::scoped_options(lifecycle_verbosity = "quiet")
    chk_on()
  })

  expect_false(is_chk_on())
  expect_identical(chk_on(), list(chk.on = FALSE))
  expect_true(is_chk_on())
  expect_identical(chk_on(), list(chk.on = TRUE))
  expect_identical(chk_off(), list(chk.on = TRUE))
  expect_false(is_chk_on())
  expect_identical(chk_off(), list(chk.on = FALSE))
})

test_that("vld_no_missing", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")

  expect_true(vld_no_missing(1))
  expect_true(vld_no_missing(integer(0)))
  expect_false(vld_no_missing(NA))
  expect_false(vld_no_missing(c(NA, 1)))
})

test_that("chk_no_missing", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")

  expect_null(chk_no_missing(1))
  expect_invisible(chk_no_missing(1))
  expect_chk_error(chk_no_missing(NA), "^`NA` must not have missing values[.]$")
  expect_chk_error(chk_no_missing(NA, x_name = "1"), "^1 must not have missing values[.]$")
})
