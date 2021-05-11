test_that("chk", {
  expect_identical(chk_null_or(NULL, chk_number), NULL, chk_number)
  expect_invisible(chk_null_or(NULL, chk_number))
  expect_identical(chk_null_or(1, chk_number), 1, chk_number)

  expect_chk_error(
    chk_null_or("1", chk_number),
    "^`\"1\"` must be a number [(]non-missing numeric scalar[)] or NULL[.]$"
  )
})


