context("utils")

test_that("deparse_tick", {
  expect_identical(deparse_tick(1), "`1`")
  expect_identical(deparse_tick(NA), "`NA`")
  expect_identical(deparse_tick("1"), "`\"1\"`")
  expect_identical(deparse_tick(substitute(1)), "`1`")
  expect_identical(deparse_tick(substitute(NA)), "`NA`")
  expect_identical(deparse_tick(substitute("1")), "`\"1\"`")
})
