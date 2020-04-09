test_that("check_key works", {
  expect_null(check_key(data.frame()))
  expect_invisible(check_key(data.frame()))
  expect_invisible(check_key(data.frame(x = 1)))
  expect_invisible(check_key(data.frame(x = 1), "x"))
  expect_invisible(check_key(data.frame(x = c(1, 1), y = 1:2), c("y", "x")))
  expect_invisible(check_key(data.frame(x = c(1, 1), y = c(NA, 1)), c("y", "x")))
  expect_invisible(check_key(data.frame(x = c(1, 1), y = NA), c("y", "x"), na_distinct = TRUE))
})

test_that("check_key fails", {
  x <- data.frame(x = c(1, 2), y = c(1, 1), z = NA)
  expect_chk_error(
    check_key(x, c("y", "y")),
    "`key` must be unique[.]$"
  )
  expect_chk_error(
    check_key(x, "y"),
    "^Column 'y' in `x` must be a unique key[.]$"
  )
  expect_chk_error(
    check_key(x, c("y", "z")),
    "^Columns 'y' and 'z' in `x` must be a unique key[.]$"
  )
})
