test_that("vld_count", {
  expect_true(vld_count(1))
  expect_true(vld_count(0))
  expect_true(vld_count(100L))
  expect_false(vld_count(0.5))
  expect_false(vld_count(-1L))
  expect_false(vld_count(NA_integer_))
  expect_false(vld_count(integer(0)))
})

test_that("chk_count", {
  expect_identical(chk_count(1), 1)
  expect_invisible(chk_count(1))
  expect_chk_error(chk_count(1.1), "^`1.1` must be a count [(]non-negative non-missing integer scalar or double equivalent[)][.]$")
  expect_chk_error(chk_count(1.1, x_name = 1L), "^1 must be a count [(]non-negative non-missing integer scalar or double equivalent[)][.]$")
})
