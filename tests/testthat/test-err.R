context("err")

test_that("err",{
  expect_error(err(), "^$")
  expect_error(err("this", "is"), "^thisis$")
})
