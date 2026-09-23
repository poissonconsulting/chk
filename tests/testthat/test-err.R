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

test_that("err .subclass deprecated", {
  lifecycle::expect_deprecated(expect_s3_class(
    expect_error(err(.subclass = "xx"), "^[.]$"),
    "xx"
  ))
  expect_s3_class(expect_error(err(class = "xx"), "^[.]$"), "xx")
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

test_that("msg .subclass deprecated", {
  lifecycle::expect_deprecated(expect_s3_class(
    expect_message(msg(.subclass = "xx"), "^[.]$"),
    "xx"
  ))
  expect_s3_class(expect_message(msg(class = "xx"), "^[.]$"), "xx")
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

test_that("wrn .subclass deprecated", {
  lifecycle::expect_deprecated(expect_s3_class(
    expect_warning(wrn(.subclass = "xx"), "^[.]$"),
    "xx"
  ))
  expect_s3_class(expect_warning(wrn(class = "xx"), "^[.]$"), "xx")
})

test_that("message_chk pluralizes with %es", {
  expect_identical(
    message_chk("there %r %n problem class%es", n = 1, tidy = FALSE),
    "there is 1 problem class"
  )
  expect_identical(
    message_chk("there %r %n problem class%es", n = 2, tidy = FALSE),
    "there are 2 problem classes"
  )
})

test_that("message_chk handles %es and %s in the same message", {
  expect_identical(
    message_chk("%n class%es and %n value%s", n = 2, tidy = FALSE),
    "2 classes and 2 values"
  )
  expect_identical(
    message_chk("%n class%es and %n value%s", n = 1, tidy = FALSE),
    "1 class and 1 value"
  )
})

test_that("message_chk escapes %% as a literal %", {
  expect_identical(
    message_chk("100%% complete", n = 1, tidy = FALSE),
    "100% complete"
  )
  expect_identical(
    message_chk("100%%s of value%s", n = 2, tidy = FALSE),
    "100%s of values"
  )
})

test_that("message_chk leaves a lone % untouched", {
  expect_identical(
    message_chk("50% of value%s", n = 2, tidy = FALSE),
    "50% of values"
  )
})

test_that("message_chk leaves the types alone when n is NULL", {
  expect_identical(
    message_chk("there %r %n problem class%es", tidy = FALSE),
    "there %r %n problem class%es"
  )
})

test_that("message_chk requires n to be a number", {
  expect_chk_error(
    message_chk("there %r %n value%s", n = NA),
    "^`n` must be a number \\(non-missing numeric scalar\\)\\.$"
  )
  expect_chk_error(
    message_chk("there %r %n value%s", n = c(1, 2)),
    "^`n` must be a number \\(non-missing numeric scalar\\)\\.$"
  )
})

test_that("message_chk pluralizes with %y", {
  expect_identical(
    message_chk("%n director%y", n = 1, tidy = FALSE),
    "1 directory"
  )
  expect_identical(
    message_chk("%n director%y", n = 2, tidy = FALSE),
    "2 directorie"
  )
})

test_that("message_chk pluralizes with %y followed by %s", {
  expect_identical(
    message_chk("there %r %n problem director%y%s", n = 1, tidy = FALSE),
    "there is 1 problem directory"
  )
  expect_identical(
    message_chk("there %r %n problem director%y%s", n = 0, tidy = FALSE),
    "there are 0 problem directories"
  )
  expect_identical(
    message_chk("there %r %n problem director%y%s", n = 1.5, tidy = FALSE),
    "there are 1.5 problem directories"
  )
  expect_identical(
    message_chk("there %r %n problem director%y%s", n = 2, tidy = FALSE),
    "there are 2 problem directories"
  )
})

test_that("message_chk pluralizes with %ies", {
  expect_identical(
    message_chk("there %r %n problem director%ies", n = 1, tidy = FALSE),
    "there is 1 problem directory"
  )
  expect_identical(
    message_chk("there %r %n problem director%ies", n = 0, tidy = FALSE),
    "there are 0 problem directories"
  )
  expect_identical(
    message_chk("there %r %n problem director%ies", n = 1.5, tidy = FALSE),
    "there are 1.5 problem directories"
  )
  expect_identical(
    message_chk("there %r %n problem director%ies", n = 2, tidy = FALSE),
    "there are 2 problem directories"
  )
})

test_that("message_chk %ies is not consumed by %es or %s", {
  expect_identical(
    message_chk(
      "%n polic%ies and %n class%es and %n value%s",
      n = 1,
      tidy = FALSE
    ),
    "1 policy and 1 class and 1 value"
  )
  expect_identical(
    message_chk(
      "%n polic%ies and %n class%es and %n value%s",
      n = 3,
      tidy = FALSE
    ),
    "3 policies and 3 classes and 3 values"
  )
})

test_that("message_chk %% escapes %y and %ies", {
  expect_identical(
    message_chk("%%y and %%ies", n = 2, tidy = FALSE),
    "%y and %ies"
  )
})

test_that("message_chk leaves %y and %ies alone when n is NULL", {
  expect_identical(
    message_chk("%n director%y%s and %n polic%ies", tidy = FALSE),
    "%n director%y%s and %n polic%ies"
  )
})
