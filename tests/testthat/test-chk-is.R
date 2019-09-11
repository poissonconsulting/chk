context("chk-is")

test_that("vld_is", {
  expect_true(vld_is(1, "numeric"))
  expect_false(vld_is(1L, "numeric"))
  expect_true(vld_is(1L, "integer"))

  x <- list()
  class(x) <- c("a", "b")
  expect_true(vld_is(x, "a"))
  expect_true(vld_is(x, "b"))
})

test_that("chk_is", {
  expect_null(chk_is(1L, "integer"))
  expect_invisible(chk_is(1L, "integer"))
  expect_chk_error(chk_is(1, "integer"), "^`1` must inherit from class 'integer'[.]$")
  expect_chk_error(chk_is(matrix(1), "numeric"), 
               "`matrix[(]1[)]` must inherit from class 'numeric'[.]$")
  x <- list()
  class(x) <- c("a", "b")
  expect_chk_error(chk_is(x, "c"), "`x` must inherit from class 'c'")
  expect_chk_error(chk_is(x, "c", x_name = "c"), "c must inherit from class 'c'")
})

test_that("vld_whole_numeric", {
  expect_true(vld_whole_numeric(numeric(0)))
  expect_true(vld_whole_numeric(integer(0)))
  expect_false(vld_whole_numeric(logical(0)))
  expect_warning(vld_whole_numeric(Inf), 
                 "^NAs introduced by coercion to integer range$")
  expect_true(vld_whole_numeric(NA_integer_))
  expect_true(vld_whole_numeric(NA_real_))
  expect_false(vld_whole_numeric(NA))
  expect_true(vld_whole_numeric(1))
  expect_true(vld_whole_numeric(1L))
  expect_false(vld_whole_numeric(1.1))
  expect_false(vld_whole_numeric(-1.1))
  expect_true(vld_whole_numeric(c(1, 2)))
  expect_false(vld_whole_numeric(TRUE))
})

test_that("chk_whole_numeric", {
  expect_null(chk_whole_numeric(1L))
  expect_invisible(chk_whole_numeric(1L))
  expect_chk_error(chk_whole_numeric(TRUE), "^`TRUE` must be a whole numeric vector [(]integer vector or double equivalent[)][.]$")
  expect_chk_error(chk_whole_numeric(TRUE, x_name = "c(1,2)"), "^c[(]1,2[)] must be a whole numeric vector [(]integer vector or double equivalent[)][.]$")
})

test_that("vld_list", {
  expect_true(vld_list(list()))
  expect_true(vld_list(list(1)))
  expect_true(vld_list(list(x = 1)))
  x <- list(x = 1)
  class(x) <- "nlist"
  expect_true(vld_list(x))
  expect_false(vld_list(1))
})

test_that("chk_list", {
  expect_null(chk_list(list()))
  expect_invisible(chk_list(list()))
  expect_chk_error(chk_list(1), "^`1` must be a list[.]$")
  expect_chk_error(chk_list(1, x_name = "list()"), "^list[(][)] must be a list[.]$")
})

test_that("vld_function", {
  expect_true(vld_function(c))
  expect_true(vld_function(function(){}))
  expect_false(vld_function(1))
})

test_that("chk_function", {
  expect_null(chk_function(c))
  expect_invisible(chk_function(c))
  expect_chk_error(chk_function(1), "^`1` must be a function[.]$")
  expect_chk_error(chk_function(1, x_name = "function()"), "^function[(][)] must be a function[.]$")
})
