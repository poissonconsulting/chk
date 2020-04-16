test_that("vld", {
  expect_false(vld_Dates(NULL))
  expect_true(vld_Dates(as.Date("2000-01-01")[-1]))
  expect_true(vld_Dates(as.Date("2000-01-01")[c(1, 1)]))
  expect_true(vld_Dates(as.Date("2000-01-01")))
  expect_true(vld_Dates(as.Date(NA)))
})

test_that("chk", {
  expect_null(chk_Dates(as.Date("2000-01-01")))
  expect_invisible(chk_Dates(as.Date("2000-01-01")))

  expect_chk_error(chk_Dates(1), "^`1` must be Date[.]$")
  expect_chk_error(chk_Dates(1, x_name = "2001-02-04"), "^2001-02-04 must be Date[.]$")
})
