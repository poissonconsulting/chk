context("chk-array")

test_that("vld_array", {
  expect_false(vld_array(1))
  expect_true(vld_array(array()))
  expect_true(vld_array(array(NA)))
  expect_true(vld_array(array(1)))
})

test_that("vld_array", {
  expect_null(chk_array(array(1)))
  expect_invisible(chk_array(array(1)))
  expect_chk_error(chk_array(1),
                   "^`1` must be an array[.]$")
})
