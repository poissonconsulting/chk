context("internal-utils")

test_that("set_class",{
  x <- list()
  expect_identical(class(x), "list")
  x <- set_class(x, "new_class")
  expect_identical(class(x), "new_class")
})
