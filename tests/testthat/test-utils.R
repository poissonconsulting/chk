context("utils")

test_that("deparse_backtick", {
  expect_identical(deparse_backtick_chk(1), "`1`")
  expect_identical(deparse_backtick_chk(NA), "`NA`")
  expect_identical(deparse_backtick_chk("1"), "`\"1\"`")
  expect_identical(deparse_backtick_chk(substitute(1)), "`1`")
  expect_identical(deparse_backtick_chk(substitute(NA)), "`NA`")
  expect_identical(deparse_backtick_chk(substitute("1")), "`\"1\"`")
})
