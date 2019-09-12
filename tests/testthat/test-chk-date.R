context("chk-date")

test_that("vld_date", {
  expect_false(vld_date(NULL))
  expect_false(vld_date(as.Date("2000-01-01")[-1]))
  expect_false(vld_date(as.Date("2000-01-01")[c(1, 1)]))
  expect_true(vld_date(as.Date("2000-01-01")))
})

test_that("chk_date", {
  expect_null(chk_date(as.Date("2000-01-01")))
  expect_invisible(chk_date(as.Date("2000-01-01")))

  expect_chk_error(chk_date(1), "^`1` must be a date [(]non-missing Date scalar[)][.]$")
  expect_chk_error(chk_date(1, x_name = "2001-02-04"), "^2001-02-04 must be a date [(]non-missing Date scalar[)][.]$")
})

test_that("vld_datetime", {
  expect_false(vld_datetime(NULL))
  expect_false(vld_datetime(Sys.time()[-1]))
  expect_false(vld_datetime(Sys.time()[c(1, 1)]))
  expect_true(vld_datetime(Sys.time()))
})

test_that("chk_datetime", {
  expect_null(chk_datetime(Sys.time()))
  expect_invisible(chk_datetime(Sys.time()))
  expect_chk_error(chk_datetime(1), "^`1` must be a datetime [(]non-missing POSIXct scalar[)][.]$")
  expect_chk_error(chk_date(1, x_name = 1), "^1 must be a date [(]non-missing Date scalar[)][.]$")
})
