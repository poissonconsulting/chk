test_that("vld_whole_numeric", {
  expect_true(vld_whole_numeric(numeric(0)))
  expect_true(vld_whole_numeric(integer(0)))
  expect_false(vld_whole_numeric(logical(0)))
  expect_true(vld_whole_numeric(Inf))
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
  expect_identical(chk_whole_numeric(1L), 1L)
  expect_invisible(chk_whole_numeric(1L))
  expect_identical(chk_whole_numeric(1), 1)
  expect_identical(chk_whole_numeric(Inf), Inf)
  expect_chk_error(
    chk_whole_numeric(TRUE),
    "^`TRUE` must be a whole numeric vector [(]integer vector or double equivalent[)][.]$"
  )
  expect_chk_error(
    chk_whole_numeric(TRUE, x_name = "`c(1,2)`"),
    "^`c[(]1,2[)]` must be a whole numeric vector [(]integer vector or double equivalent[)][.]$"
  )
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
  expect_identical(chk_list(list()), list())
  expect_invisible(chk_list(list()))
  expect_chk_error(chk_list(1), "^`1` must be a list[.]$")
  expect_chk_error(
    chk_list(1, x_name = "`list()`"),
    "^`list[(][)]` must be a list[.]$"
  )
})

test_that("vld_function", {
  expect_true(vld_function(c))
  expect_true(vld_function(function() {}))
  expect_false(vld_function(1))
  expect_true(vld_function(function() {}, formals = 0))
  expect_false(vld_function(function() {}, formals = 1))
  expect_true(vld_function(function(x = 1) {}, formals = 1))
  expect_false(vld_function(function(x = 1, y = 3) {}, formals = 1))
})

test_that("chk_function", {
  expect_identical(chk_function(c), c)
  expect_invisible(chk_function(c))
  expect_chk_error(chk_function(1), "^`1` must be a function[.]$")
  expect_chk_error(
    chk_function(1, x_name = "Function()"),
    "^Function[(][)] must be a function[.]$"
  )
  expect_chk_error(
    chk_function(mean, formals = 3),
    "^`mean` must have 3 formal arguments [(]not 2[)][.]$"
  )
})

test_that("vld_scalar", {
  expect_true(vld_scalar(1))
  expect_true(vld_scalar(NA))
  expect_false(vld_scalar(integer(0)))
  expect_false(vld_scalar(1:2))
  expect_false(vld_scalar(list()))
  expect_true(vld_scalar(list(x = 1)))
  expect_true(vld_scalar(matrix(1)))
  expect_false(vld_scalar(matrix(1:2)))
  expect_true(vld_scalar(data.frame(x = 1:10)))
  expect_false(vld_scalar(data.frame(x = 1, y = 2)))
})

test_that("chk_scalar", {
  expect_identical(chk_scalar(1), 1)
  expect_invisible(chk_scalar(1))
  expect_chk_error(
    chk_scalar(1:2),
    "^`1:2` must be a scalar [(]length 1[)][.]$"
  )
})
