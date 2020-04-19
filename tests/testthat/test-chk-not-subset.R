test_that("vld_not_subset", {
  expect_true(vld_not_subset(integer(0), 1))
  expect_true(vld_not_subset(1, 2))
  expect_false(vld_not_subset(1:3, 1:2))
  expect_true(vld_not_subset(numeric(0), 1L))

  expect_true(vld_not_subset(-1, c(0, 1, NA)))
  expect_true(vld_not_subset(1L, 0L))
  expect_true(vld_not_subset(1, NA))

  expect_false(vld_not_subset(c(NA, 1), 1))
  expect_false(vld_not_subset(NA, NA))

  expect_false(vld_not_subset(c(NA, 1), 1:2))
})

test_that("chk_not_subset", {
  expect_null(chk_not_subset(integer(0), 1))
  expect_invisible(chk_not_subset(integer(0), 1))
  expect_chk_error(chk_not_subset(1:3, c(0, 1, NA)), "`1:3` must not have any values matching 0, 1 or NA[.]$")
  expect_chk_error(chk_not_subset(1, c(0, 1, NA)), "^`1` must not match 1, 0 or NA[.]$")
  expect_chk_error(chk_not_subset(0L, 0L), c("^`0L` must not match 0[.]$"))
})
