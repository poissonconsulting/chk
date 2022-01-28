test_that("vld_dbl", {
  rlang::local_options(lifecycle_verbosity = "quiet")

  lifecycle::expect_deprecated(vld_dbl(1))

  expect_true(vld_dbl(1))
  expect_false(vld_dbl(matrix(c(1, 2))))
  expect_true(vld_dbl(dbl(0)))
  expect_true(vld_dbl(NA_real_))
  expect_false(vld_dbl(1L))
  expect_false(vld_dbl(TRUE))
})

test_that("chk_dbl", {
  rlang::local_options(lifecycle_verbosity = "quiet")

  lifecycle::expect_deprecated(chk_dbl(1))

  expect_identical(chk_dbl(1), 1)
  expect_invisible(chk_dbl(1))
  expect_chk_error(
    chk_dbl(TRUE),
    "^`TRUE` must be double [(]real[)] scalar[.]$"
  )
})
