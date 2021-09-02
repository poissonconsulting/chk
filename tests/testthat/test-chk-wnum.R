test_that("vld_wnum", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")

  lifecycle::expect_deprecated(vld_wnum(1))

  expect_false(vld_wnum(numeric(0)))
  expect_true(vld_wnum(NA_integer_))
  expect_true(vld_wnum(1))
  expect_true(vld_wnum(1L))
  expect_false(vld_wnum(1.1))
  expect_true(vld_wnum(-1))
  expect_true(vld_wnum(Inf))
  expect_false(vld_wnum(c(1, 2)))
  expect_false(vld_wnum(TRUE))
})

test_that("chk_wnum", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")

  lifecycle::expect_deprecated(chk_wnum(1))

  expect_identical(chk_wnum(1), 1)
  expect_invisible(chk_wnum(1))
  expect_chk_error(chk_wnum(TRUE), "^`TRUE` must be a whole numeric scalar[.]$")
  expect_chk_error(chk_wnum(TRUE, x_name = 1L), "^1 must be a whole numeric scalar[.]$")
})
