test_that("vld_numeric", {
  expect_true(vld_numeric(1))
  expect_true(vld_numeric(matrix(1:3)))
  expect_true(vld_numeric(integer(0)))
  expect_false(vld_numeric(NULL))
  expect_false(vld_numeric("1"))
  expect_false(vld_numeric(NA))
})

test_that("chk_numeric", {
  expect_identical(chk_numeric(1), 1)
  expect_invisible(chk_numeric(1))
  expect_chk_error(chk_numeric("1"), "`\"1\"` must be numeric[.]$")
  expect_chk_error(chk_numeric("1", x_name = 1), "^1 must be numeric[.]$")
})

