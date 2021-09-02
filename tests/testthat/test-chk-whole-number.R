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
