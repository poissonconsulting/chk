context("utils")

test_that("deparse_backtick", {
  expect_identical(deparse_backtick(1), "`1`")
  expect_identical(deparse_backtick(NA), "`NA`")
  expect_identical(deparse_backtick("1"), "`\"1\"`")
  expect_identical(deparse_backtick(substitute(1)), "`1`")
  expect_identical(deparse_backtick(substitute(NA)), "`NA`")
  expect_identical(deparse_backtick(substitute("1")), "`\"1\"`")
})
