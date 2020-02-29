test_that("check_data works", {
  expect_null(check_data(data.frame()))
  expect_invisible(check_data(data.frame()))
  expect_null(check_data(data.frame(x = 1)))
})

test_that("check_data fails", {
  expect_chk_error(check_data(data.frame(), nrow = TRUE),
  "`nrow[(]`data.frame[(][)]`[)]` must be greater than 0, not 0.")
  expect_chk_error(check_data(data.frame(), values = list(x = 1)),
  "`data.frame[(][)]` must include 'x'.")
  expect_null(check_data(data.frame(x = 1, y = 2)))
  expect_chk_error(check_data(data.frame(x = 1, y = 2), values = list(x = 1), exclusive = TRUE), "^`data.frame[(]x = 1, y = 2[)]` must equal set: 'x'[.]$")
    expect_chk_error(check_data(data.frame(x = c(1,1)), key = "x"),
                     "^`x[[]key[]]` must be unique[.]$")
})
