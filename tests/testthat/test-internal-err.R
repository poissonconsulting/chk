context("internal-err")

test_that("cc",{
  expect_identical(cc(numeric(0)), character(0))
  expect_identical(cc(1), "1")
  expect_identical(cc(1:2), c("1, 2"))
  expect_identical(cc(1:3), c("1, 2, 3"))
})

test_that("cc_or",{
  expect_identical(cc_or(numeric(0)), character(0))
  expect_identical(cc_or(1), "'1'")
  expect_identical(cc_or(1:2), c("'1' or '2'"))
  expect_identical(cc_or(1:3), c("'1', '2' or '3'"))
})

test_that("cc_and",{
  expect_identical(cc_and(numeric(0)), character(0))
  expect_identical(cc_and(1), "'1'")
  expect_identical(cc_and(1:2), c("'1' and '2'"))
  expect_identical(cc_and(1:3), c("'1', '2' and '3'"))
})
