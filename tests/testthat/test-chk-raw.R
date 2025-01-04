test_that("vld_raw", {
  expect_false(vld_raw(1L))
  expect_false(vld_raw(matrix(1:4)))
  expect_true(vld_raw(raw(0)))
  expect_true(vld_raw(as.raw(1)))
  expect_true(vld_raw(as.raw(c(1,2))))
  expect_false(vld_raw(1))
  expect_false(vld_raw(TRUE))
})

test_that("chk_raw", {
  expect_identical(chk_raw(as.raw(1L)), as.raw(1L))
  expect_invisible(chk_raw(as.raw(1L)))
  expect_chk_error(
    chk_raw(TRUE),
    "^`TRUE` must be raw[.]$"
  )
})
