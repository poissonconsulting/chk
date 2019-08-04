context("chkor")

test_that("chkor", {
  expect_true(chkor())
  expect_true(chkor(chk_flag(TRUE)))
  expect_false(chkor(chk_flag(1), err = FALSE))
  expect_false(chkor(chk_flag(1), chk_flag(2), err = FALSE))
  expect_true(chkor(chk_flag(1), chk_flag(TRUE)))
  expect_error(chkor(chk_flag(1)), "^`1` must be a flag [(]TRUE or FALSE[)][.]$")
  expect_error(chkor(chk_flag(1), chk_flag(1)), "^`1` must be a flag [(]TRUE or FALSE[)][.]$")
  expect_error(chkor(chk_flag(1), chk_flag(2)), "^At least one of the following conditions must be met:\n[*] `1` must be a flag [(]TRUE or FALSE[)][.]\n[*] `2` must be a flag [(]TRUE or FALSE[)][.]$")
  expect_error(chkor(chk_flag(1), chk_flag(2), chk_flag(0)), "^At least one of the following conditions must be met:\n[*] `1` must be a flag [(]TRUE or FALSE[)].\n[*] `2` must be a flag [(]TRUE or FALSE[)].\n[*] `0` must be a flag [(]TRUE or FALSE[)].$")
})
