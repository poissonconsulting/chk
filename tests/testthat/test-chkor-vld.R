test_that("chkor_vld", {
  expect_null(chkor_vld())
  expect_invisible(chkor_vld())
  expect_null(chkor_vld(vld_flag(TRUE)))
  expect_null(chkor_vld(vld_flag(TRUE), vld_number(1)))
  expect_null(chkor_vld(vld_flag(1), vld_flag(TRUE)))
  expect_chk_error(
    chkor_vld(vld_flag(1)),
    "^`1` must be a flag [(]TRUE or FALSE[)][.]$"
  )
  expect_chk_error(
    chkor_vld(vld_flag(1), vld_flag(1)),
    "^`1` must be a flag [(]TRUE or FALSE[)][.]$"
  )
  expect_chk_error(
    chkor_vld(vld_flag(1), vld_flag(2)),
    "^At least one of the following conditions must be met:\n[*] `1` must be a flag [(]TRUE or FALSE[)][.]\n[*] `2` must be a flag [(]TRUE or FALSE[)][.]$"
  )
  expect_chk_error(
    chkor_vld(vld_flag(1), vld_flag(2), vld_flag(0)),
    "^At least one of the following conditions must be met:\n[*] `1` must be a flag [(]TRUE or FALSE[)].\n[*] `2` must be a flag [(]TRUE or FALSE[)].\n[*] `0` must be a flag [(]TRUE or FALSE[)].$"
  )
})

test_that("chkor_vld x_name is passed to all chk calls", {
  expect_null(chkor_vld(vld_flag(TRUE), x_name = "`arg`"))
  expect_invisible(chkor_vld(vld_flag(TRUE), x_name = "`arg`"))

  # single failing condition uses x_name instead of the deparsed argument
  expect_chk_error(
    chkor_vld(vld_flag(1), x_name = "`arg`"),
    "^`arg` must be a flag [(]TRUE or FALSE[)][.]$"
  )

  # x_name is applied to every condition
  expect_chk_error(
    chkor_vld(vld_flag("a"), vld_number("a"), x_name = "`arg`"),
    "^At least one of the following conditions must be met:\n[*] `arg` must be a flag [(]TRUE or FALSE[)].\n[*] `arg` must be a number [(]non-missing numeric scalar[)].$"
  )

  # x_name coexists with other arguments passed to the vld_ call
  expect_chk_error(
    chkor_vld(vld_gte(1, value = 5), x_name = "`arg`"),
    "^`arg` must be greater than or equal to 5, not 1[.]$"
  )

  # default (NULL) still deparses the argument
  expect_chk_error(
    chkor_vld(vld_flag(1)),
    "^`1` must be a flag [(]TRUE or FALSE[)][.]$"
  )
})
