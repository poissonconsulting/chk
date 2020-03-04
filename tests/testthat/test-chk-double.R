test_that("vld_double", {
  expect_true(vld_double(1))
  expect_true(vld_double(matrix(c(1, 2))))
  expect_true(vld_double(double(0)))
  expect_true(vld_double(NA_real_))
  expect_false(vld_double(1L))
  expect_false(vld_double(TRUE))
})

test_that("chk_double", {
  expect_null(chk_double(1))
  expect_invisible(chk_double(1))
  expect_chk_error(
    chk_double(TRUE),
    "^`TRUE` must be double[.]$"
  )
})
