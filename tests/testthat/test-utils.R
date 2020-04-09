context("utils")

test_that("deparse_backtick_chk", {
  expect_identical(deparse_backtick_chk(1), "`1`")
  expect_identical(deparse_backtick_chk(NA), "`NA`")
  expect_identical(deparse_backtick_chk("1"), "`\"1\"`")
  expect_identical(deparse_backtick_chk(substitute(1)), "`1`")
  expect_identical(deparse_backtick_chk(substitute(NA)), "`NA`")
  expect_identical(deparse_backtick_chk(substitute("1")), "`\"1\"`")
})

test_that("backtick_chk", {
  expect_identical(backtick_chk(1), "`1`")
  expect_identical(backtick_chk("`1`"), "``1``")
})

test_that("unbacktick_chk", {
  expect_identical(unbacktick_chk(1), "1")
  expect_identical(unbacktick_chk("`1`"), "1")
  expect_identical(unbacktick_chk("``1``"), "1")
})
