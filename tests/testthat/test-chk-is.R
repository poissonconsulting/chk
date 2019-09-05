context("chk-is")

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
  expect_error(chk_is(x, "c", x_name = "c"), "c must inherit from class 'c'")
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
  expect_error(chk_whole_numeric(TRUE, x_name = "c(1,2)"), "^c[(]1,2[)] must be a whole numeric vector [(]integer vector or double equivalent[)][.]$")
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
  expect_error(chk_list(1, x_name = "list()"), "^list[(][)] must be a list[.]$")
})

test_that("chk_function", {
  expect_true(chk_function(p))
  expect_true(chk_function(function(){}))
  expect_false(chk_function(1, err = FALSE))
  expect_error(chk_function(1), "^`1` must be a function[.]$")
  expect_error(chk_function(1, x_name = "function()"), "^function[(][)] must be a function[.]$")
})
