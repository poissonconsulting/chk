test_that("vld_lgl", {
  rlang::local_options(lifecycle_verbosity = "quiet")

  expect_true(vld_lgl(TRUE))
  expect_true(vld_lgl(FALSE))
  expect_false(vld_lgl(NA_real_))
  expect_false(vld_lgl(logical(0)))
  expect_false(vld_flag(c(FALSE, TRUE)))
  expect_false(vld_lgl(1))
})

test_that("chk_lgl", {
  rlang::local_options(lifecycle_verbosity = "quiet")

  expect_identical(chk_lgl(NA), NA)
  expect_invisible(chk_lgl(NA))
  expect_chk_error(chk_lgl(1), "^`1` must be a logical scalar [(]TRUE, FALSE or NA[)][.]$")
  expect_chk_error(chk_lgl(1, x_name = 2), "^2 must be a logical scalar [(]TRUE, FALSE or NA[)][.]$")
})
