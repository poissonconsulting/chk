context("chk-not-any-na")

test_that("vld_not_any_na", {
  expect_true(vld_not_any_na(1))
  expect_true(vld_not_any_na(matrix(1:3)))
  expect_true(vld_not_any_na(character(0)))
  expect_true(vld_not_any_na(NULL))
  expect_false(vld_not_any_na(NA))
  expect_false(vld_not_any_na(c(1, NA)))
})

test_that("chk_not_any_na", {
  expect_null(chk_not_any_na(1))
  expect_invisible(chk_not_any_na(1))
  expect_chk_error(chk_not_any_na(NA), "^`NA` must not have any missing values[.]$")
  expect_chk_error(chk_not_any_na(NA, x_name = 1), "^1 must not have any missing values[.]$")
})
