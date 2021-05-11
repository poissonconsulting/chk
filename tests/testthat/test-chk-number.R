test_that("vld_number", {
  expect_false(vld_number(numeric(0)))
  expect_false(vld_number(NA_integer_))
  expect_true(vld_number(1))
  expect_true(vld_number(1L))
  expect_true(vld_number(1.1))
  expect_true(vld_number(-1.1))
  expect_true(vld_number(Inf))
  expect_false(vld_number(c(1, 2)))
  expect_false(vld_number(TRUE))
})

test_that("chk_number", {
  expect_identical(chk_number(1), 1)
  expect_invisible(chk_number(1))
  expect_chk_error(chk_number(TRUE), "^`TRUE` must be a number [(]non-missing numeric scalar[)][.]$")
  expect_chk_error(chk_number(TRUE, x_name = 1L), "^1 must be a number [(]non-missing numeric scalar[)][.]$")
})


test_that("vld_whole_number", {
  expect_chk_error(chk_whole_number(1.1), "^`1.1` must be a whole number [(]non-missing integer scalar or double equivalent[)][.]$")
  expect_chk_error(chk_whole_number(1.1, x_name = 1L), "^1 must be a whole number [(]non-missing integer scalar or double equivalent[)][.]$")
})

test_that("chk_whole_number", {
  expect_identical(chk_whole_number(1), 1)
  expect_invisible(chk_whole_number(1))
  expect_chk_error(chk_whole_number(1.1), "^`1.1` must be a whole number [(]non-missing integer scalar or double equivalent[)][.]$")
  expect_chk_error(chk_whole_number(1.1, x_name = 1L), "^1 must be a whole number [(]non-missing integer scalar or double equivalent[)][.]$")
})


