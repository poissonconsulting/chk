context("chk-standalone")

test_that("chk_flag", {
  expect_false(chk_flag(logical(0), err = FALSE))
  expect_false(chk_flag(NA, err = FALSE))
  expect_true(chk_flag(TRUE))
  expect_true(chk_flag(FALSE))
  expect_false(chk_flag(c(FALSE, TRUE), err = FALSE))
  expect_false(chk_flag(1, err = FALSE))
  expect_error(chk_flag(1), "^`1` must be a flag [(]TRUE or FALSE[)][.]$")
  expect_error(chk_flag(1, x_name = "2"), "^`2` must be a flag [(]TRUE or FALSE[)][.]$")
})

test_that("chk_lgl", {
  expect_false(chk_lgl(logical(0), err = FALSE))
  expect_true(chk_lgl(NA))
  expect_true(chk_lgl(TRUE))
  expect_true(chk_lgl(FALSE))
  expect_false(chk_flag(c(FALSE, TRUE), err = FALSE))
  expect_false(chk_lgl(1, err = FALSE))
  expect_error(chk_lgl(1), "^`1` must be a logical scalar [(]TRUE, FALSE or NA[)][.]$")
  expect_error(chk_lgl(1, x_name = 2), "^`2` must be a logical scalar [(]TRUE, FALSE or NA[)][.]$")
})

test_that("chk_false", {
  expect_true(chk_false(FALSE))
  expect_true(chk_false(c(x = FALSE)))
  expect_false(chk_false(TRUE, err = FALSE))
  expect_false(chk_false(NA, err = FALSE))
  expect_false(chk_false(c(FALSE, FALSE), err = FALSE))
  expect_error(chk_false(TRUE), "^`TRUE` must be FALSE[.]$")
  expect_error(chk_false(TRUE, x_name = FALSE), "^`FALSE` must be FALSE[.]$")
})

test_that("chk_true", {
  expect_true(chk_true(TRUE))
  expect_true(chk_true(c(x = TRUE)))
  expect_false(chk_true(FALSE, err = FALSE))
  expect_false(chk_true(NA, err = FALSE))
  expect_false(chk_true(c(TRUE, TRUE), err = FALSE))
  expect_error(chk_true(FALSE), "^`FALSE` must be TRUE[.]$")
  expect_error(chk_true(FALSE, x_name = TRUE), "^`TRUE` must be TRUE[.]$")
})

test_that("chk_whole_number", {
  expect_false(chk_whole_number(integer(0), err = FALSE))
  expect_false(chk_whole_number(NA_integer_, err = FALSE))
  expect_true(chk_whole_number(1L))
  expect_true(chk_whole_number(1))
  expect_true(chk_whole_number(-100))
  expect_false(chk_whole_number(1:2, err = FALSE))
  expect_true(chk_whole_number(1.0000000000000000000001))
  expect_false(chk_whole_number(1.1, err = FALSE))
  expect_warning(chk_whole_number(Inf, err = FALSE), 
                 "^NAs introduced by coercion to integer range$")
  expect_error(chk_whole_number(1.1), "^`1.1` must be a whole number [(]non-missing integer scalar or double equivalent[)][.]$")
  expect_error(chk_whole_number(1.1, x_name = 1L), "^`1` must be a whole number [(]non-missing integer scalar or double equivalent[)][.]$")
})

test_that("chk_count", {
  expect_true(chk_count(1L))
  expect_true(chk_count(1))
  expect_true(chk_count(0L))
  expect_false(chk_count(-1L, err = FALSE))
  expect_false(chk_count(1:2, err = FALSE))
  expect_false(chk_count(1.1, err = FALSE))
  expect_false(chk_count(NA_integer_, err = FALSE))
  expect_false(chk_count(integer(0), err = FALSE))
  expect_error(chk_count(1.1), "^`1.1` must be a count [(]non-missing non-negative integer scalar or double equivalent[)][.]$")
  expect_error(chk_count(1.1, x_name = 2), "^`2` must be a count [(]non-missing non-negative integer scalar or double equivalent[)][.]$")
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
  expect_error(chk_number(TRUE, x_name = 1L), "^`1` must be a number [(]non-missing numeric scalar[)][.]$")
})

test_that("chk_whole_numeric", {
  expect_true(chk_whole_numeric(numeric(0)))
  expect_true(chk_whole_numeric(integer(0)))
  expect_false(chk_whole_numeric(logical(0), err = FALSE))
  expect_true(chk_whole_numeric(NA_integer_))
  expect_true(chk_whole_numeric(NA_real_))
  expect_false(chk_whole_numeric(NA, err = FALSE))
  expect_true(chk_whole_numeric(1))
  expect_true(chk_whole_numeric(1L))
  expect_false(chk_whole_numeric(1.1, err = FALSE))
  expect_false(chk_whole_numeric(-1.1, err = FALSE))
  expect_warning(chk_whole_numeric(Inf, err = FALSE), 
                 "^NAs introduced by coercion to integer range$")
  expect_true(chk_whole_numeric(c(1, 2)))
  expect_false(chk_whole_numeric(TRUE, err = FALSE))
  expect_error(chk_whole_numeric(TRUE), "^`TRUE` must be a whole numeric vector [(]integer vector or double equivalent[)][.]$")
  expect_error(chk_whole_numeric(TRUE, x_name = "c(1,2)"), "^`c[(]1,2[)]` must be a whole numeric vector [(]integer vector or double equivalent[)][.]$")
})

test_that("chk_proportion", {
  expect_false(chk_proportion(numeric(0), err = FALSE))
  expect_false(chk_proportion(NA_integer_, err = FALSE))
  expect_true(chk_proportion(1))
  expect_true(chk_proportion(1L))
  expect_true(chk_proportion(0.1))
  expect_true(chk_proportion(0))
  expect_false(chk_proportion(1.0001, err = FALSE))
  expect_false(chk_proportion(-0.0001, err = FALSE))
  expect_false(chk_proportion(c(0.1, 0.5), err = FALSE))
  expect_false(chk_proportion(TRUE, err = FALSE))
  expect_error(chk_proportion(TRUE), "^`TRUE` must be a proportion [(]non-missing numeric scalar between 0 and 1[)][.]$")
  expect_error(chk_proportion(TRUE, x_name = "1/2"), "^`1/2` must be a proportion [(]non-missing numeric scalar between 0 and 1[)][.]$")
})

test_that("chk_string", {
  expect_false(chk_string(character(0), err = FALSE))
  expect_false(chk_string(NA_character_, err = FALSE))
  expect_true(chk_string(""))
  expect_true(chk_string("a"))
  expect_false(chk_string(c("a", "b"), err = FALSE))
  expect_error(chk_string(1), "^`1` must be a string [(]non-missing character scalar[)][.]$")
  expect_error(chk_string(1, x_name = "''"), "^`''` must be a string [(]non-missing character scalar[)][.]$")
})

test_that("chk_date", {
  expect_false(chk_date(NULL, err = FALSE))
  expect_false(chk_date(as.Date("2000-01-01")[-1], err = FALSE))
  expect_false(chk_date(as.Date("2000-01-01")[c(1,1)], err = FALSE))
  expect_true(chk_date(as.Date("2000-01-01")))
  expect_error(chk_date(1), "^`1` must be a date [(]non-missing Date scalar[)][.]$")
  expect_error(chk_date(1, x_name = "2001-02-04"), "^`2001-02-04` must be a date [(]non-missing Date scalar[)][.]$")
})

test_that("chk_datetime", {
  expect_false(chk_datetime(NULL, err = FALSE))
  expect_false(chk_datetime(Sys.time()[-1], err = FALSE))
  expect_false(chk_datetime(Sys.time()[c(1,1)], err = FALSE))
  expect_true(chk_datetime(Sys.time()))
  expect_error(chk_datetime(1), "^`1` must be a datetime [(]non-missing POSIXct scalar[)][.]$")
  expect_error(chk_date(1, x_name = 1), "^`1` must be a date [(]non-missing Date scalar[)][.]$")
})

test_that("chk_length", {
  expect_false(chk_length(NULL, err = FALSE))
  expect_false(chk_length(integer(0), err = FALSE))
  expect_true(chk_length(1))
  expect_true(chk_length(NA))
  expect_false(chk_length(list(), err = FALSE))
  expect_true(chk_length(list(x = 1)))
  expect_error(chk_length(NULL), 
               "^`NULL` must be length 1, not 0[.]$")
  expect_error(chk_length(1, 3), 
               "^`1` must be length 3, not 1[.]$")
  expect_error(chk_length(1, 3, x_name = 3), 
               "^`3` must be length 3, not 1[.]$")
})

test_that("chk_named", {
  expect_false(chk_named(list(), err = FALSE))
  expect_false(chk_named(list(1), err = FALSE))
  expect_true(chk_named(list(x = 1)))
  expect_true(chk_named(list(x = 1)[-1]))
  expect_true(chk_named(c(x = 1)))
  expect_true(chk_named(c(x = 1)[-1]))
  expect_error(chk_named(1), "^`1` must be named[.]$")
  expect_error(chk_named(1, x_name = "new born"), "^`new born` must be named[.]$")
})

test_that("chk_null", {
  expect_true(chk_null(NULL))
  expect_false(chk_null(1, err = FALSE))
  expect_error(chk_null(1), "^`1` must be NULL[.]$")
  expect_error(chk_null(1, x_name = "NULL"), "^`NULL` must be NULL[.]$")
})

test_that("chk_not_null", {
  expect_true(chk_not_null(1))
  expect_false(chk_not_null(NULL, err = FALSE))
  expect_error(chk_not_null(NULL), "^`NULL` must not be NULL[.]$")
  expect_error(chk_not_null(NULL, x_name = "not NULL"), "^`not NULL` must not be NULL[.]$")
})

test_that("chk_list", {
  expect_true(chk_list(list()))
  expect_true(chk_list(list(1)))
  expect_true(chk_list(list(x = 1)))
  x <- list(x = 1)
  class(x) <- "nlist"
  expect_true(chk_list(x))
  expect_false(chk_list(1, err = FALSE))
  expect_error(chk_list(1), "^`1` must be a list[.]$")
  expect_error(chk_list(1, x_name = "list()"), "^`list[(][)]` must be a list[.]$")
})

test_that("chk_function", {
  expect_true(chk_function(p))
  expect_true(chk_function(function(){}))
  expect_false(chk_function(1, err = FALSE))
  expect_error(chk_function(1), "^`1` must be a function[.]$")
  expect_error(chk_function(1, x_name = "function()"), "^`function[(][)]` must be a function[.]$")
})

test_that("chk_is", {
  expect_true(chk_is(1, "numeric"))
  expect_false(chk_is(1L, "numeric", err = FALSE))
  expect_true(chk_is(1L, "integer"))
  expect_error(chk_is(1, "integer"), "^`1` must inherit from class 'integer'[.]$")
  expect_error(chk_is(matrix(1), "numeric"), 
               "`matrix[(]1[)]` must inherit from class 'numeric'[.]$")
  x <- list()
  class(x) <- c("a", "b")
  expect_true(chk_is(x, "a"))
  expect_true(chk_is(x, "b"))
  expect_error(chk_is(x, "c"), "`x` must inherit from class 'c'")
  expect_error(chk_is(x, "c", x_name = "c"), "`c` must inherit from class 'c'")
})

test_that("chk_match", {
  expect_true(chk_match(character(0)))
  expect_true(chk_match(1))
  expect_true(chk_match("a"))
  expect_false(chk_match("", err = FALSE))
  expect_error(chk_match(""), "^`\"\"` must match regular expression '.+'[.]$")
  expect_error(chk_match(NA_character_), 
               "`NA_character_` must match regular expression '.+'")
  expect_true(chk_match(c("a", "b")))
  expect_error(chk_match(c("a", "b"), "b"), 
               "All values of `c[(]\"a\", \"b\"[)]` must match regular expression 'b'[.]$")
  expect_error(chk_match(c("a", "b"), 'b'), 
               "All values of `c[(]\"a\", \"b\"[)]` must match regular expression 'b'[.]$")
  expect_error(chk_match(c(NA, "b"), 'b'), 
               "All values of `c[(]NA, \"b\"[)]` must match regular expression 'b'[.]$")
  expect_error(chk_match(c(NA, "b"), 'b', x_name = "b"), 
               "All values of `b` must match regular expression 'b'[.]$")
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
  expect_error(chk_identical(1, 2, x_name = 2), 
               "^`2` not identical to: 2[.]$")
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
  expect_error(chk_equal(1, 2, x_name = 2), 
               "^`2` not equal to: 2[.]$")
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
  expect_error(chk_equivalent(1, 2, x_name = 2), 
               "^`2` not equivalent to: 2[.]$")
})

test_that("chk_no_missing", {
  expect_true(chk_no_missing(1))
  expect_true(chk_no_missing(integer(0)))
  expect_false(chk_no_missing(NA, err = FALSE))
  expect_false(chk_no_missing(c(NA, 1), err = FALSE))
  expect_error(chk_no_missing(NA), "^`NA` must not have missing values[.]$")
  expect_error(chk_no_missing(NA, x_name = "1"), "^`1` must not have missing values[.]$")
})

test_that("chk_unique", {
  expect_true(chk_unique(integer(0)))
  expect_true(chk_unique(NA))
  expect_true(chk_unique(1))
  expect_true(chk_unique(c(1,2)))
  expect_true(chk_unique(c(1,NA)))
  expect_false(chk_unique(c(NA,NA), err = FALSE))
  expect_false(chk_unique(c(1,1), err = FALSE))
  expect_false(chk_unique(c(1,2,1), err = FALSE))
  expect_error(chk_unique(c(1,1)), "^`c[(]1, 1[)]` must be unique[.]$")
  expect_error(chk_unique(c(1,1), x_name = "unicorn"), "^`unicorn` must be unique[.]$")
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

test_that("chk_in", {
  expect_true(chk_in(integer(0)))
  expect_error(chk_in(NA, c(0, Inf)), "^`NA` must match 0 or Inf, not NA[.]$")
  expect_false(chk_in(1:3, err = FALSE))
  expect_error(chk_in(1:3), "^Values of `1:3` must match 0, 1 or NA[.]$")
  expect_true(chk_in(numeric(0), 1L))
  
  expect_false(chk_in(-1, err = FALSE))
  expect_error(chk_in(-1), "^`-1` must match 0, 1 or NA, not -1[.]$")
  
  expect_false(chk_in(1L, 0L, err = FALSE))
  expect_error(chk_in(c(1L, 1L), 0L), c("^Values of `c[(]1L, 1L[)]` must match 0[.]$"))
  expect_error(chk_in(1, ""), "^`1` must match '', not 1[.]$")
  
  expect_false(chk_in(1, NA, err = FALSE)) 
  expect_error(chk_in(1, NA), 
               "^`1` must match NA, not 1[.]$")
  
  expect_false(chk_in(c(NA, 1), 1, err = FALSE)) 
  expect_error(chk_in(c(NA, 1), 1), 
               "^Values of `c[(]NA, 1[)]` must match 1[.]$")
  
  expect_true(chk_in(NA, NA))
  
  expect_false(chk_in(c(NA, 1), 1:2, err = FALSE)) 
  expect_error(chk_in(c(NA, 1), 1:2), 
               "^Values of `c[(]NA, 1[)]` must match 1 or 2[.]$")
  
  expect_error(chk_in(3L, values = c(1L, 1L, 7L)), 
               "^`3L` must match 1 or 7, not 3[.]$")
  expect_error(chk_in(3L, values = c(1L, 1L, 7L), x_name = "1"), 
               "^`1` must match 1 or 7, not 3[.]$")
})

test_that("chk_lt", {
  expect_true(chk_lt(numeric(0)))
  expect_true(chk_lt(NA))
  expect_true(chk_lt(-1))
  expect_true(chk_lt(c(-1, -Inf)))
  expect_false(chk_lt(0, err = FALSE))
  expect_false(chk_lt(1, err = FALSE))
  expect_error(chk_lt(1), "^`1` must be less than 0, not 1[.]$")
  expect_error(chk_lt(c(1,-1)), "^Values of `c[(]1, -1[)]` must be less than 0[.]$")
  expect_error(chk_lt(1, x_name = -1), "^`-1` must be less than 0, not 1[.]$")
})

test_that("chk_lte", {
  expect_true(chk_lte(numeric(0)))
  expect_true(chk_lte(NA))
  expect_true(chk_lte(-1))
  expect_true(chk_lte(c(-1, -Inf)))
  expect_true(chk_lte(0))
  expect_false(chk_lte(1, err = FALSE))
  expect_error(chk_lte(1), "^`1` must be less than or equal to 0, not 1[.]$")
  expect_error(chk_lte(c(1,-1)), "^Values of `c[(]1, -1[)]` must be less than or equal to 0[.]$")
  expect_error(chk_lte(1, x_name = "0"), "^`0` must be less than or equal to 0, not 1[.]$")
})

test_that("chk_gt", {
  expect_true(chk_gt(numeric(0)))
  expect_true(chk_gt(NA))
  expect_true(chk_gt(1))
  expect_true(chk_gt(c(1, Inf)))
  expect_false(chk_gt(0, err = FALSE))
  expect_false(chk_gt(-1, err = FALSE))
  expect_error(chk_gt(-1), "^`-1` must be greater than 0, not -1[.]$")
  expect_error(chk_gt(c(1,-1)), "^Values of `c[(]1, -1[)]` must be greater than 0[.]$")
  expect_error(chk_gt(-1, x_name = "a number"), "^`a number` must be greater than 0, not -1[.]$")
})

test_that("chk_gte", {
  expect_true(chk_gte(numeric(0)))
  expect_true(chk_gte(NA))
  expect_true(chk_gte(1))
  expect_true(chk_gte(c(1, Inf)))
  expect_true(chk_gte(0))
  expect_false(chk_gte(-1, err = FALSE))
  expect_error(chk_gte(-1), "^`-1` must be greater than or equal to 0, not -1[.]$")
  expect_error(chk_gte(c(1,-1)), "^Values of `c[(]1, -1[)]` must be greater than or equal to 0[.]$")
  expect_error(chk_gte(-1, x_name = "another number"), "^`another number` must be greater than or equal to 0, not -1[.]$")
})

test_that("chk_range", {
  expect_true(chk_range(numeric(0)))
  expect_true(chk_range(numeric(0), c(1,1)))
  expect_true(chk_range(NA_real_))
  expect_true(chk_range(1))
  expect_true(chk_range(1:3))
  expect_true(chk_range(numeric(0), 1L))
  
  expect_false(chk_range(-1, err = FALSE))
  expect_error(chk_range(-1), "^`-1` must be between 0 and Inf, not -1[.]$")
  expect_error(chk_range(c(-1, NA)), "^Values of `c[(]-1, NA[)]` must be between 0 and Inf[.]$")
  expect_true(chk_range(c(-1, -1), c(-2, -1)))
  expect_true(chk_range(c(NA, 1), 1:2)) 
  
  expect_error(chk_range(2, c(1,1)), "^`2` must be 1, not 2[.]$")
  expect_error(chk_range(c(2,1), c(1,1)), "^Values of `c[(]2, 1[)]` must be 1[.]$")
  expect_error(chk_range(2, c(1,1), x_name = 1), "^`1` must be 1, not 2[.]$")
})

test_that("chk_dir", {
  expect_error(chk_dir(character(0)), 
               "^`character[(]0[)]` must be length 1, not 0[.]$")
  expect_error(chk_dir(character(0), x_name = "this"), 
               "^`this` must be length 1, not 0[.]$")
  expect_true(chk_dir(tempdir()))
  expect_error(chk_dir(tempfile()), "^Can't find directory '.*'[.]$")
  path <- file.path(tempdir(), "chk")
  unlink(path)
  expect_false(chk_dir(path, err = FALSE))
  expect_error(chk_dir(path), "^Can't find directory '.*chk'[.]$")
  expect_error(chk_dir(c(path, file.path(path, "other"))), 
               "^`c[(]path, file.path[(]path, \"other\"[)][)]` must be length 1, not 2[.]$")
})

test_that("chk_dirs", {
  expect_true(chk_dirs(character(0)))
  expect_true(chk_dirs(tempdir()))
  expect_error(chk_dirs(tempfile()), "^Can't find directory '.*'[.]$")
  path <- file.path(tempdir(), "chk")
  unlink(path)
  expect_false(chk_dirs(path, err = FALSE))
  expect_error(chk_dirs(path), "^Can't find directory '.*chk'[.]$")
  expect_error(chk_dirs(c(path, file.path(path, "other"))), "^Can't find the following directories: '.*chk' or '.*other'[.]$")
})

test_that("chk_file", {
  expect_error(chk_file(character(0)), 
              "^`character[(]0[)]` must be length 1, not 0[.]$")
  expect_error(chk_file(character(0), x_name = "that"), 
              "^`that` must be length 1, not 0[.]$")
  expect_false(chk_file(tempdir(), err = FALSE))
  file <- paste0(tempfile(), ".csv")
  expect_false(chk_file(file, err = FALSE))
  expect_error(chk_file(file), "^Can't find file '.*[.]csv'[.]$")
  file1 <- paste0(tempfile(), "1.csv")
  file2 <- paste0(tempfile(), "2.csv")
  expect_error(chk_file(c(file1, file2), 
                        "^`c[(]file1, file2[)]` must be length 1, not 2[.]$"))
  teardown(unlink(file))
  write.csv(data.frame(x = 1), file)
  expect_true(chk_file(file))
  expect_false(chk_file(dirname(file), err = FALSE))
})

test_that("chk_files", {
  expect_true(chk_files(character(0)))
  expect_false(chk_files(tempdir(), err = FALSE))
  file <- paste0(tempfile(), ".csv")
  expect_false(chk_files(file, err = FALSE))
  expect_error(chk_files(file), "^Can't find file '.*[.]csv'[.]$")
  file1 <- paste0(tempfile(), "1.csv")
  file2 <- paste0(tempfile(), "2.csv")
  expect_error(chk_files(c(file1, file2)), 
                        "^Can't find the following files: '.*[.]csv' or '.*[.]csv'[.]$")
  teardown(unlink(file))
  write.csv(data.frame(x = 1), file)
  expect_true(chk_files(file))
  expect_false(chk_files(dirname(file), err = FALSE))
})
