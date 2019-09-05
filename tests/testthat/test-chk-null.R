
context("chk-null")

test_that("chk_null", {
  expect_true(chk_null(NULL))
  expect_false(chk_null(1, err = FALSE))
  expect_error(chk_null(1), "^`1` must be NULL[.]$")
  expect_error(chk_null(1, x_name = "NULL"), "^NULL must be NULL[.]$")
})

test_that("chk_not_null", {
  expect_true(chk_not_null(1))
  expect_false(chk_not_null(NULL, err = FALSE))
  expect_error(chk_not_null(NULL), "^`NULL` must not be NULL[.]$")
  expect_error(chk_not_null(NULL, x_name = "not NULL"), "^not NULL must not be NULL[.]$")
})
