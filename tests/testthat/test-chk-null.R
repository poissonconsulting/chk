context("chk-null")

test_that("vld_null", {
  expect_true(vld_null(NULL))
  expect_false(vld_null(1))
})

test_that("chk_null", {
  expect_null(chk_null(NULL))
  expect_invisible(chk_null(NULL))

  expect_chk_error(chk_null(1), "^`1` must be NULL[.]$", "chk_error_null")
  expect_chk_error(chk_null(1, x_name = "NULL"), "^NULL must be NULL[.]$", "chk_error_null")
})

test_that("vld_not_null", {
  expect_true(vld_not_null(1))
  expect_false(vld_not_null(NULL))
})

test_that("chk_not_null", {
  expect_null(chk_not_null(1))
  expect_invisible(chk_not_null(1))

  expect_error(chk_not_null(NULL), "^`NULL` must not be NULL[.]$")
  expect_error(chk_not_null(NULL, x_name = "not NULL"), "^not NULL must not be NULL[.]$")
})
