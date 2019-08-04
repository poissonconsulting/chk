context("chk-standalone")

test_that("chk_flag", {
  expect_false(chk_flag(logical(0), err = FALSE))
  expect_false(chk_flag(NA, err = FALSE))
  expect_true(chk_flag(TRUE))
  expect_true(chk_flag(FALSE))
  expect_false(chk_flag(c(FALSE, TRUE), err = FALSE))
  expect_false(chk_flag(1, err = FALSE))
  expect_error(chk_flag(1), "^`1` must be a flag [(]TRUE or FALSE[)][.]$")
})

test_that("chk_lgl", {
  expect_false(chk_lgl(logical(0), err = FALSE))
  expect_true(chk_lgl(NA))
  expect_true(chk_lgl(TRUE))
  expect_true(chk_lgl(FALSE))
  expect_false(chk_flag(c(FALSE, TRUE), err = FALSE))
  expect_false(chk_lgl(1, err = FALSE))
  expect_error(chk_lgl(1), "^`1` must be a logical scalar [(]TRUE, FALSE or NA[)][.]$")
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
  expect_error(chk_number(TRUE), "^`TRUE` must be a number [(]non-missing numeric scalar[)][.]$")
})

test_that("chk_string", {
  expect_false(chk_string(character(0), err = FALSE))
  expect_false(chk_string(NA_character_, err = FALSE))
  expect_true(chk_string(""))
  expect_true(chk_string("a"))
  expect_false(chk_string(c("a", "b"), err = FALSE))
  expect_error(chk_string(1), "^`1` must be a string [(]non-missing character scalar[)][.]$")
})

test_that("chk_named", {
  expect_false(chk_named(list(), err = FALSE))
  expect_false(chk_named(list(1), err = FALSE))
  expect_true(chk_named(list(x = 1)))
  expect_true(chk_named(list(x = 1)[-1]))
  expect_true(chk_named(c(x = 1)))
  expect_true(chk_named(c(x = 1)[-1]))
  expect_error(chk_named(1), "^`1` must be named[.]$")
})

test_that("chk_null", {
  expect_true(chk_null(NULL))
  expect_false(chk_null(1, err = FALSE))
  expect_error(chk_null(1), "^`1` must be NULL[.]$")
})

test_that("chk_function", {
  expect_true(chk_function(p))
  expect_true(chk_function(function(){}))
  expect_false(chk_function(1, err = FALSE))
  expect_error(chk_function(1), "^`1` must be a function[.]$")
})

test_that("chk_is", {
  expect_true(chk_is(1, "numeric"))
  expect_false(chk_is(1L, "numeric", err = FALSE))
  expect_true(chk_is(1L, "integer"))
  expect_error(chk_is(1, "integer"), "^`1` must inherit from class 'integer', not class 'numeric'[.]$")
  expect_error(chk_is(matrix(1), "numeric"), 
               "`matrix[(]1[)]` must inherit from class 'numeric', not class 'matrix'[.]$")
})

test_that("chk_identical", {
  expect_true(chk_identical(1, 1))
  expect_true(chk_identical(1L, 1L))
  expect_false(chk_identical(1, 1L, err = FALSE))
  expect_false(chk_identical(1L, 1, err = FALSE))

  expect_true(chk_identical(c(1L), 1L))
  expect_false(chk_identical(c(x = 1L), 1L, err = FALSE))
  expect_error(chk_identical(c(x = 1L), 1L), 
               "^`c[(]x = 1L[)]` not identical to: 1L[.]$")
  expect_false(chk_identical(1L, c(x = 1L), err = FALSE))
  expect_error(chk_identical(1L, c(x = 1L)), 
               "^`1L` not identical to: c[(]x = 1L[)][.]$")
  
  expect_error(chk_identical(1, 1L), "^`1` not identical to: 1L[.]$")
  expect_error(chk_identical(1, 1:10), 
               "^`1` not identical to: 1:10[.]$")
  expect_error(chk_identical(1, 1:100), 
               "^`1` not identical to: 1:100[.]$")
  expect_error(chk_identical(1, c(1,5,1,9)), 
               "^`1` not identical to: c[(]1, 5, 1, 9[)][.]$")
})

test_that("chk_equal", {
  expect_true(chk_equal(1, 1))
  expect_true(chk_equal(1L, 1L))
  expect_true(chk_equal(1, 1L))
  expect_true(chk_equal(1L, 1))
  
  expect_true(chk_equal(c(1L), 1L))
  expect_false(chk_equal(c(x = 1L), 1L, err = FALSE))
  expect_error(chk_equal(c(x = 1L), 1L), 
               "^`c[(]x = 1L[)]` not equal to: 1L[.]$")
  expect_false(chk_equal(1L, c(x = 1L), err = FALSE))
  expect_error(chk_equal(1L, c(x = 1L)), 
               "^`1L` not equal to: c[(]x = 1L[)][.]$")

  expect_true(chk_equal(1, 1.00000001))
  expect_true(chk_equal(1, 1.001, 0.01))
  expect_true(chk_equal(1, 1.001, 0.001))
  
  expect_false(chk_equal(1, 1.001, 0.0001, err = FALSE))
  expect_error(chk_equal(1, 1.001, 0.0001), c("^`1` not equal to: 1[.]001[.]$"))
  expect_error(chk_equal(1, c(1,5,1,9)), 
               "^`1` not equal to: c[(]1, 5, 1, 9[)][.]$")
})

test_that("chk_no_missing", {
  expect_true(chk_no_missing(1))
  expect_true(chk_no_missing(integer(0)))
  expect_false(chk_no_missing(NA, err = FALSE))
  expect_false(chk_no_missing(c(NA, 1), err = FALSE))
  expect_error(chk_no_missing(NA), "^`NA` must not have missing values[.]$")
})

test_that("chk_unused", {
  expect_true(chk_unused())
  expect_false(chk_unused(1, err = FALSE))
  expect_error(chk_unused(1), "^`...` must be unused[.]$")
})

test_that("chk_used", {
  expect_true(chk_used(1))
  expect_false(chk_used(err = FALSE))
  expect_error(chk_used(), "^`...` must be used[.]$")
})

test_that("chk_dir", {
  expect_true(chk_dir(tempdir()))
  expect_error(chk_dir(tempfile()), "^Can't find directory `.*`[.]$")
  path <- file.path(tempdir(), "chk")
  unlink(path)
  expect_false(chk_dir(path, err = FALSE))
  expect_error(chk_dir(path), "^Can't find directory `.*chk`[.]$")
})

test_that("chk_file", {
  expect_true(chk_file(tempdir())) # quirk of base R (treats directory as file)
  file <- paste0(tempfile(), ".csv")
  expect_false(chk_file(file, err = FALSE))
  expect_error(chk_file(file), "^Can't find file `.*[.]csv`[.]$")
  teardown(unlink(file))
  write.csv(data.frame(x = 1), file)
  expect_true(chk_file(file))
})
