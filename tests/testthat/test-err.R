context("utils-chk")

test_that("message_chk", {
  expect_match(message_chk(), "^[.]$")
  expect_match(message_chk("", ""), "^[.]$")
  expect_match(message_chk("a"), "^A[.]$")
  expect_match(message_chk("`a`"), "^`a`[.]$")
  expect_match(message_chk("a", "b"), "^Ab[.]$")
  expect_match(message_chk(" a", " b"), "^ a b[.]$")
  expect_match(message_chk(" A", "b"), "^ Ab[.]$")
  expect_match(message_chk("Ab", "b"), "^Abb[.]$")
  expect_match(message_chk("Ab.", "b."), "^Ab[.]b[.]$")

  expect_match(message_chk("a"), "^A[.]$")
  expect_match(message_chk("a."), "^A[.]$")
  expect_match(message_chk("a!"), "^A!$")
  expect_match(message_chk("a?"), "^A[?]$")

  expect_match(
    message_chk("there %r %n problem director%y%s", n = 1),
    "There is 1 problem directory[.]$"
  )
  expect_match(
    message_chk("there %r %n problem director%y%s", n = 2),
    "There are 2 problem directories[.]$"
  )
  expect_match(
    message_chk("there %r %n problem director%y%s", n = 1.5),
    "There are 1.5 problem directories[.]$"
  )
  expect_match(
    message_chk("there %r %n problem director%y%s", n = 0),
    "There are 0 problem directories[.]$"
  )
  expect_match(
    message_chk("there %r %n problem director%y%s", n = 0, tidy = FALSE),
    "there are 0 problem directories$"
  )
})

test_that("err", {
  expect_error(err(), "^[.]$")
  expect_error(err("this", "is"), "^Thisis[.]$")
  expect_error(
    err("There %r %n problem value%s"),
    "There %r %n problem value%s[.]$"
  )
  expect_error(
    err("there %r %n problem value%s", n = 2),
    "There are 2 problem values[.]$"
  )
  expect_error(
    err("there %r %n problem value%s", n = 0, tidy = FALSE),
    "there are 0 problem values$"
  )
})

test_that("msg", {
  expect_message(msg(), "^[.]")
  expect_message(msg("this", "is"), "^Thisis[.]")
  expect_message(
    msg("There %r %n problem value%s"),
    "^There %r %n problem value%s[.]"
  )
  expect_message(
    msg("there %r %n problem value%s", n = 2),
    "^There are 2 problem values[.]"
  )
  expect_message(
    msg("there %r %n problem value%s", n = 0, tidy = FALSE),
    "there are 0 problem values"
  )
})

test_that("wrn", {
  expect_warning(wrn(), "^[.]$")
  expect_warning(wrn("this", "is"), "^Thisis[.]$")
  expect_warning(
    wrn("there %r %n problem value%s"),
    "^There %r %n problem value%s."
  )
  expect_warning(
    wrn("there %r %n problem value%s", n = 2),
    "^There are 2 problem values[.]$"
  )
  expect_warning(
    wrn("there %r %n problem value%s", n = 0, tidy = FALSE),
    "there are 0 problem values$"
  )
})
