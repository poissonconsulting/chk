test_that("check_data works", {
  expect_null(check_data(data.frame()))
  expect_invisible(check_data(data.frame()))
  expect_null(check_data(data.frame(x = 1)))
  expect_null(check_data(data.frame(x = 1, values = list(x = 1))))
})

test_that("check_data fails", {
  expect_chk_error(
    check_data(data.frame(), nrow = TRUE),
    "`nrow[(]`data.frame[(][)]`[)]` must be greater than 0, not 0."
  )
  expect_chk_error(
    check_data(data.frame(), values = list(x = 1)),
    "`names[(]data.frame[(][)][)]` must include 'x'."
  )

  expect_chk_error(check_data(data.frame(x = 1, y = 2), values = list(x = 1), exclusive = TRUE), "^`names[(]data.frame[(]x = 1, y = 2[)][)]` must not include 'y'[.]$")
  expect_chk_error(
    check_data(data.frame(x = 1), values = list(x = 1L)),
    "`data.frame[(]x = 1[)][$]x` must inherit from S3 class 'integer'."
  )
  expect_chk_error(
    check_data(data.frame(x = c(1, 1)), key = "x"),
    "^Column 'x' in `data.frame[(]x = c[(]1, 1[)][)]` must be a unique key[.]$"
  )
    expect_chk_error(
    check_data(data.frame(x = ordered(1:2)), values = list(x = ordered(1:2, levels = 2:1))),
    "^`levels[(]data.frame[(]x = ordered[(]1:2[)][)][$]x[)]` must have [(]the first occurence of[)] each of the following elements in the following order: '2', '1'[.]$"
  )
})
