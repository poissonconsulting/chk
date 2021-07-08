test_that("vld_integer", {
  expect_true(vld_integer(1L))
  expect_true(vld_integer(matrix(1:4)))
  expect_true(vld_integer(integer(0)))
  expect_true(vld_integer(NA_integer_))
  expect_false(vld_integer(1))
  expect_false(vld_integer(TRUE))
})

test_that("chk_integer", {
  expect_identical(chk_integer(1L), 1L)
  expect_invisible(chk_integer(1L))
  expect_chk_error(
    chk_integer(TRUE),
    "^`TRUE` must be integer[.]$"
  )
})
