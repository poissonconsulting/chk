test_that("vld_true", {
  expect_true(vld_true(TRUE))
  expect_true(vld_true(c(x = TRUE)))
  expect_true(vld_true(structure(TRUE, x = "y")))
  expect_false(vld_true(FALSE))
  expect_false(vld_true(NA))
  expect_false(vld_true(c(TRUE, TRUE)))
  expect_false(vld_true(1))
})

test_that("chk_true", {
  expect_identical(chk_true(TRUE), TRUE)
  expect_invisible(chk_true(TRUE))
  expect_identical(chk_true(c(x = TRUE)), c(x = TRUE))

  expect_chk_error(chk_true(FALSE), "^`FALSE` must be TRUE[.]$")
  expect_chk_error(chk_true(FALSE, x_name = TRUE), "^TRUE must be TRUE[.]$")
})

test_that("vld_false", {
  expect_true(vld_false(FALSE))
  expect_false(vld_false(TRUE))
  expect_true(vld_false(c(x = FALSE)))
  expect_true(vld_false(structure(FALSE, x = "y")))
  expect_false(vld_false(NA))
  expect_false(vld_false(c(FALSE, FALSE)))
  expect_false(vld_false(0))
})

test_that("chk_false", {
  expect_identical(chk_false(FALSE), FALSE)
  expect_invisible(chk_false(FALSE))
  expect_identical(chk_false(c(x = FALSE)), c(x = FALSE))

  expect_chk_error(chk_false(TRUE), "^`TRUE` must be FALSE[.]$")
  expect_chk_error(chk_false(TRUE, x_name = FALSE), "^FALSE must be FALSE[.]$")
})

test_that("vld_flag", {
  expect_true(vld_flag(FALSE))
  expect_true(vld_flag(TRUE))
  expect_false(vld_flag(logical(0)))
  expect_false(vld_flag(NA))
  expect_false(vld_flag(c(FALSE, TRUE)))
  expect_false(vld_flag(1))
})

test_that("chk_flag", {
  expect_identical(chk_flag(TRUE), TRUE)
  expect_invisible(chk_flag(TRUE))
  expect_chk_error(chk_flag(1), "^`1` must be a flag [(]TRUE or FALSE[)][.]$")
  expect_chk_error(chk_flag(1, x_name = "2"), "^2 must be a flag [(]TRUE or FALSE[)][.]$")
})

test_that("vld_lgl", {
  expect_true(vld_lgl(TRUE))
  expect_true(vld_lgl(FALSE))
  expect_false(vld_lgl(NA_real_))
  expect_false(vld_lgl(logical(0)))
  expect_false(vld_flag(c(FALSE, TRUE)))
  expect_false(vld_lgl(1))
})

test_that("chk_lgl", {
  expect_identical(chk_lgl(NA), NA)
  expect_invisible(chk_lgl(NA))
  expect_chk_error(chk_lgl(1), "^`1` must be a logical scalar [(]TRUE, FALSE or NA[)][.]$")
  expect_chk_error(chk_lgl(1, x_name = 2), "^2 must be a logical scalar [(]TRUE, FALSE or NA[)][.]$")
})

