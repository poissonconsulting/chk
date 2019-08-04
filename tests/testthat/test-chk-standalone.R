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

test_that("chk_whole_number", {
  expect_true(chk_whole_number(1L))
  expect_true(chk_whole_number(1))
  expect_true(chk_whole_number(-100))
  expect_false(chk_whole_number(1:2, err = FALSE))
  expect_false(chk_whole_number(1.00000001, err = FALSE))
  expect_false(chk_whole_number(NA_integer_, err = FALSE))
  expect_false(chk_whole_number(integer(0), err = FALSE))
  expect_error(chk_whole_number(1.1), "^`1.1` must be a whole number [(]non-missing integer scalar or double equivalent[)][.]$")
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

test_that("chk_inherits", {
  expect_true(chk_inherits(1, "numeric"))
  expect_false(chk_inherits(1L, "numeric", err = FALSE))
  expect_true(chk_inherits(1L, "integer"))
  expect_error(chk_inherits(1, "integer"), "^`1` must inherit from class 'integer'[.]$")
  expect_error(chk_inherits(matrix(1), "numeric"), 
               "`matrix[(]1[)]` must inherit from class 'numeric'[.]$")
  x <- list()
  class(x) <- c("a", "b")
  expect_true(chk_inherits(x, "a"))
  expect_true(chk_inherits(x, "b"))
  expect_error(chk_inherits(x, "c"), "`x` must inherit from class 'c'")
})

test_that("chk_grepl", {
  expect_true(chk_grepl(character(0)))
  expect_true(chk_grepl(1))
  expect_true(chk_grepl("a"))
  expect_false(chk_grepl("", err = FALSE))
  expect_error(chk_grepl(""), "^`\"\"` must match regular expression '.+'[.]$")
  expect_error(chk_grepl(NA_character_), 
               "`NA_character_` must match regular expression '.+'")
  expect_true(chk_grepl(c("a", "b")))
  expect_error(chk_grepl(c("a", "b"), "b"), 
               "All values of `c[(]\"a\", \"b\"[)]` must match regular expression 'b'[.]$")
  expect_error(chk_grepl(c("a", "b"), 'b'), 
               "All values of `c[(]\"a\", \"b\"[)]` must match regular expression 'b'[.]$")
  expect_error(chk_grepl(c(NA, "b"), 'b'), 
               "All values of `c[(]NA, \"b\"[)]` must match regular expression 'b'[.]$")
})

test_that("chk_is", {
  expect_true(chk_is(1, "numeric"))
  expect_false(chk_is(1L, "numeric", err = FALSE))
  expect_true(chk_is(1L, "integer"))
  expect_error(chk_is(1, "integer"), "^`1` must be class 'integer', not 'numeric'[.]$")
  expect_error(chk_is(matrix(1), "numeric"), 
               "`matrix[(]1[)]` must be class 'numeric', not 'matrix'[.]$")
  
  x <- structure(list(), class = c("a", "b"))
  expect_true(chk_is(x, c("a", "b")))
  expect_error(chk_is(x, "b"), "^`x` must be class 'b', not c[(]'a', 'b'[)][.]$")
  expect_error(chk_is(x, c("b", "a")), "^`x` must be class c[(]'b', 'a'[)], not c[(]'a', 'b'[)][.]$")
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

test_that("chk_equivalent", {
  expect_true(chk_equivalent(1, 1))
  expect_true(chk_equivalent(1L, 1L))
  expect_true(chk_equivalent(1, 1L))
  expect_true(chk_equivalent(1L, 1))
  
  expect_true(chk_equivalent(c(1L), 1L))
  expect_true(chk_equivalent(c(x = 1L), 1L))
  expect_true(chk_equivalent(c(x = 1L), 1L))
  expect_true(chk_equivalent(1L, c(x = 1L)))
  expect_true(chk_equivalent(1L, c(x = 1L)))

  expect_true(chk_equivalent(1, 1.00000001))
  expect_true(chk_equivalent(1, 1.001, 0.01))
  expect_true(chk_equivalent(1, 1.001, 0.001))
  
  expect_false(chk_equivalent(1, 1.001, 0.0001, err = FALSE))
  expect_error(chk_equivalent(1, 1.001, 0.0001), c("^`1` not equivalent to: 1[.]001[.]$"))
  expect_error(chk_equivalent(1, c(1,5,1,9)), 
               "^`1` not equivalent to: c[(]1, 5, 1, 9[)][.]$")
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
