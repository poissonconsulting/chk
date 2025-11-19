test_that("chkor", {
  rlang::local_options(lifecycle_verbosity = "quiet")

  expect_null(chkor())
  expect_invisible(chkor())
  expect_null(chkor(chk_flag(TRUE)))
  expect_null(chkor(chk_flag(1), chk_flag(TRUE)))
  expect_chk_error(chkor(chk_flag(1)), "^`1` must be a flag [(]TRUE or FALSE[)][.]$")
  expect_chk_error(chkor(chk_flag(1), chk_flag(1)), "^`1` must be a flag [(]TRUE or FALSE[)][.]$")
  expect_chk_error(chkor(chk_flag(1), chk_flag(2)), "^At least one of the following conditions must be met:\n[*] `1` must be a flag [(]TRUE or FALSE[)][.]\n[*] `2` must be a flag [(]TRUE or FALSE[)][.]$")
  expect_chk_error(chkor(chk_flag(1), chk_flag(2), chk_flag(0)), "^At least one of the following conditions must be met:\n[*] `1` must be a flag [(]TRUE or FALSE[)].\n[*] `2` must be a flag [(]TRUE or FALSE[)].\n[*] `0` must be a flag [(]TRUE or FALSE[)].$")
})
