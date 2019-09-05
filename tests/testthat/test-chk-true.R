context("chk-true")

test_that("chk_true", {
  expect_true(chk_true(TRUE))
  expect_true(chk_true(c(x = TRUE)))
  expect_false(chk_true(FALSE, err = FALSE))
  expect_false(chk_true(NA, err = FALSE))
  expect_false(chk_true(c(TRUE, TRUE), err = FALSE))
  expect_error(chk_true(FALSE), "^`FALSE` must be TRUE[.]$")
  expect_error(chk_true(FALSE, x_name = TRUE), "^TRUE must be TRUE[.]$")
})

test_that("chk_false", {
  expect_true(chk_false(FALSE))
  expect_true(chk_false(c(x = FALSE)))
  expect_false(chk_false(TRUE, err = FALSE))
  expect_false(chk_false(NA, err = FALSE))
  expect_false(chk_false(c(FALSE, FALSE), err = FALSE))
  expect_error(chk_false(TRUE), "^`TRUE` must be FALSE[.]$")
  expect_error(chk_false(TRUE, x_name = FALSE), "^FALSE must be FALSE[.]$")
})

test_that("chk_flag", {
  expect_false(chk_flag(logical(0), err = FALSE))
  expect_false(chk_flag(NA, err = FALSE))
  expect_true(chk_flag(TRUE))
  expect_true(chk_flag(FALSE))
  expect_false(chk_flag(c(FALSE, TRUE), err = FALSE))
  expect_false(chk_flag(1, err = FALSE))
  expect_error(chk_flag(1), "^`1` must be a flag [(]TRUE or FALSE[)][.]$")
  expect_error(chk_flag(1, x_name = "2"), "^2 must be a flag [(]TRUE or FALSE[)][.]$")
})

test_that("chk_lgl", {
  expect_false(chk_lgl(logical(0), err = FALSE))
  expect_true(chk_lgl(NA))
  expect_true(chk_lgl(TRUE))
  expect_true(chk_lgl(FALSE))
  expect_false(chk_flag(c(FALSE, TRUE), err = FALSE))
  expect_false(chk_lgl(1, err = FALSE))
  expect_error(chk_lgl(1), "^`1` must be a logical scalar [(]TRUE, FALSE or NA[)][.]$")
  expect_error(chk_lgl(1, x_name = 2), "^2 must be a logical scalar [(]TRUE, FALSE or NA[)][.]$")
})

