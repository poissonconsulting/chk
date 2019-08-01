context("err")

test_that("err",{
  expect_error(err(), "^$")
  expect_error(err("this", "is"), "^thisis$")
})

test_that("wrn",{
  expect_warning(wrn(), "^$")
  expect_warning(wrn("this", "is"), "^thisis$")
})

test_that("msg",{
  expect_message(msg(), "\\s")
  expect_message(msg("this", "is"), "^thisis\\s$")
})
