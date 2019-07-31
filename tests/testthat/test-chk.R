context("chk")

test_that("chk_flag", {
  expect_false(chk_flag(logical(0), err = FALSE))
  expect_false(chk_flag(NA, err = FALSE))
  expect_true(chk_flag(TRUE))
  expect_true(chk_flag(FALSE))
  expect_false(chk_flag(c(FALSE, TRUE), err = FALSE))
  expect_false(chk_flag(1, err = FALSE))
  expect_error(chk_flag(1), "^1 must be a flag [(]TRUE or FALSE[)]$")
})

test_that("chk_lgl", {
  expect_false(chk_lgl(logical(0), err = FALSE))
  expect_true(chk_lgl(NA))
  expect_true(chk_lgl(TRUE))
  expect_true(chk_lgl(FALSE))
  expect_false(chk_flag(c(FALSE, TRUE), err = FALSE))
  expect_false(chk_lgl(1, err = FALSE))
  expect_error(chk_lgl(1), "^1 must be a logical scalar [(]TRUE, FALSE or NA[)]$")
})

test_that("chk_number", {
  expect_false(chk_number(numeric(0), err = FALSE))
  expect_false(chk_number(NA_integer_, err = FALSE))
  expect_true(chk_number(1))
  expect_true(chk_number(1L))
  expect_true(chk_number(1.1))
  expect_true(chk_number(-1.1))
  expect_true(chk_number(Inf))
  expect_false(chk_number(c(1, 2), err = FALSE))
  expect_false(chk_number(TRUE, err = FALSE))
  expect_error(chk_number(TRUE), "^TRUE must be a number [(]non-missing numeric scalar[)]$")
})

test_that("chk_string", {
  expect_false(chk_string(character(0), err = FALSE))
  expect_false(chk_string(NA_character_, err = FALSE))
  expect_true(chk_string(""))
  expect_true(chk_string("a"))
  expect_false(chk_string(c("a", "b"), err = FALSE))
  expect_error(chk_string(1), "^1 must be a string [(]non-missing character scalar[)]$")
})

test_that("chk_named", {
  expect_false(chk_named(list(), err = FALSE))
  expect_false(chk_named(list(1), err = FALSE))
  expect_true(chk_named(list(x = 1)))
  expect_true(chk_named(list(x = 1)[-1]))
  expect_true(chk_named(c(x = 1)))
  expect_true(chk_named(c(x = 1)[-1]))
  expect_error(chk_named(1), "^1 must be named$")
})

test_that("chk_function", {
  expect_true(chk_function(p))
  expect_true(chk_function(function(){}))
  expect_false(chk_function(1, err = FALSE))
  expect_error(chk_function(1), "^1 must be a function$")
})

test_that("chk_unused", {
  expect_true(chk_unused())
  expect_false(chk_unused(1, err = FALSE))
  expect_error(chk_unused(1), "^... must be unused$")
})

test_that("chk_used", {
  expect_true(chk_used(1))
  expect_false(chk_used(err = FALSE))
  expect_error(chk_used(), "^... must be used$")
})

