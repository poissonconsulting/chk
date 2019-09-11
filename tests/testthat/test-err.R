context("utils-chk")

test_that("err",{
  expect_error(err(), "^$")
  expect_error(err("this", "is"), "^thisis$")
  expect_error(err("this"), "^this$")
  expect_error(err("there %r %n problem value%s"),
                "there %r %n problem value%s")
  expect_error(err("there %r %n problem value%s", n = 1),
                 "there is 1 problem value")
  expect_error(err("there %r %n problem value%s", n = 2),
                 "there are 2 problem values")
  expect_error(err("there %r %n problem value%s", n = 1.5),
                 "there are 1.5 problem values")
  expect_error(err("there %r %n problem value%s", n = 0),
                 "there are 0 problem values")
})

test_that("msg",{
  expect_message(msg(), "\\s")
  expect_message(msg("this", "is"), "^thisis\\s$")
  expect_message(msg("there %r %n problem value%s"),
                "there %r %n problem value%s")
  expect_message(msg("there %r %n problem value%s", n = 1),
                 "there is 1 problem value")
  expect_message(msg("there %r %n problem value%s", n = 2),
                 "there are 2 problem values")
  expect_message(msg("there %r %n problem value%s", n = 1.5),
                 "there are 1.5 problem values")
  expect_message(msg("there %r %n problem value%s", n = 0),
                 "there are 0 problem values")
})

test_that("wrn",{
  expect_warning(wrn(), "^$")
  expect_warning(wrn("this", "is"), "^thisis$")
  expect_warning(wrn("this"), "^this$")
  expect_warning(wrn("there %r %n problem value%s"),
                "there %r %n problem value%s")
  expect_warning(wrn("there %r %n problem value%s", n = 1),
                 "there is 1 problem value")
  expect_warning(wrn("there %r %n problem value%s", n = 2),
                 "there are 2 problem values")
  expect_warning(wrn("there %r %n problem value%s", n = 1.5),
                 "there are 1.5 problem values")
  expect_warning(wrn("there %r %n problem value%s", n = 0),
                 "there are 0 problem values")
})
