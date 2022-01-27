test_that("chk_null_or works vld", {
  expect_identical(chk_null_or(NULL, vld = vld_number), NULL)
  expect_invisible(chk_null_or(NULL, vld = vld_number), NULL)
  expect_identical(chk_null_or(1, vld = vld_number), 1)

  expect_chk_error(
    chk_null_or("1", vld = vld_number),
    "^`\"1\"` must be a number [(]non-missing numeric scalar[)] or NULL[.]$"
  )
})

test_that("chk_null_or still works chk", {
  rlang::local_options(lifecycle_verbosity = "quiet")

  expect_identical(chk_null_or(NULL, chk_number), NULL, chk_number)
  expect_invisible(chk_null_or(NULL, chk_number))
  expect_identical(chk_null_or(1, chk_number), 1, chk_number)

  expect_chk_error(
    chk_null_or("1", chk_number),
    "^`\"1\"` must be a number [(]non-missing numeric scalar[)] or NULL[.]$"
  )
})

test_that("chk_null_or vld overrides chk", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_identical(chk_null_or(1, chk_flag, vld = vld_number), 1)
  expect_chk_error(
    chk_null_or(1, chk = chk_number, vld = vld_flag),
    "^`1` must be a flag [(]TRUE or FALSE[)] or NULL[.]$"
  )
})

