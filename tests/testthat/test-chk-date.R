context("chk-date")

test_that("chk_date", {
  expect_false(chk_date(NULL, err = FALSE))
  expect_false(chk_date(as.Date("2000-01-01")[-1], err = FALSE))
  expect_false(chk_date(as.Date("2000-01-01")[c(1,1)], err = FALSE))
  expect_true(chk_date(as.Date("2000-01-01")))
  expect_error(chk_date(1), "^`1` must be a date [(]non-missing Date scalar[)][.]$")
  expect_error(chk_date(1, x_name = "2001-02-04"), "^2001-02-04 must be a date [(]non-missing Date scalar[)][.]$")
})

test_that("chk_datetime", {
  expect_false(chk_datetime(NULL, err = FALSE))
  expect_false(chk_datetime(Sys.time()[-1], err = FALSE))
  expect_false(chk_datetime(Sys.time()[c(1,1)], err = FALSE))
  expect_true(chk_datetime(Sys.time()))
  expect_error(chk_datetime(1), "^`1` must be a datetime [(]non-missing POSIXct scalar[)][.]$")
  expect_error(chk_date(1, x_name = 1), "^1 must be a date [(]non-missing Date scalar[)][.]$")
})
