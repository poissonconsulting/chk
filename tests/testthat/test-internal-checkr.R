context("internal-check")

test_that("check_vector", {
  expect_true(check_vector(integer(0)))
  expect_true(check_vector(1))
  expect_true(check_vector(list()))
  expect_error(check_vector(matrix()), "matrix[(][)] must be a vector")
})

test_that("check_scalar", {
  expect_true(check_scalar(1))
  expect_error(check_scalar(character(0)), "character[(]0[)] must be a vector of length 1")
  expect_true(check_scalar(list(1)))
})

test_that("check_atomic", {
  expect_true(check_atomic(integer(0)))
  expect_true(check_atomic(1))
  expect_true(check_atomic(matrix()))
  expect_error(check_atomic(list()), "list[(][)] must be atomic")
})

test_that("check_atomic_vector", {
  expect_true(check_atomic_vector(integer(0)))
  expect_true(check_atomic_vector(1))
  expect_error(check_atomic_vector(matrix()), "matrix[(][)] must be an atomic vector")
  expect_error(check_atomic_vector(list()), "list[(][)] must be an atomic vector")
})

test_that("check_numeric", {
  expect_true(check_numeric(integer(0)))
  expect_true(check_numeric(1))
  expect_true(check_numeric(matrix(1L)))
  expect_true(check_numeric(NA_real_))
  expect_error(check_numeric(TRUE), "TRUE must be numeric")
})

test_that("check_character", {
  expect_true(check_character(character(0)))
  expect_true(check_character(""))
  expect_true(check_character(matrix("")))
  expect_error(check_character(1), "1 must be character")
})

test_that("check_flag()", {
  expect_true(check_flag(TRUE))
  expect_true(check_flag(FALSE))
  expect_error(check_flag(NA), "^NA must be TRUE or FALSE$")
  y <- TRUE
  expect_true(check_flag(y))
  y <- c("name" = TRUE)
  expect_true(check_flag(y))
  y <- NA
  expect_error(check_flag(y), "^y must be TRUE or FALSE$")
  z <- 1
  expect_error(check_flag(z), "^z must be TRUE or FALSE$")
})

test_that("check_flag_na()", {
  expect_true(check_flag_na(TRUE))
  expect_true(check_flag_na(FALSE))
  expect_true(check_flag_na(NA))
  y <- TRUE
  expect_true(check_flag_na(y))
  y <- c("name" = TRUE)
  expect_true(check_flag_na(y))
  y <- NA
  expect_true(check_flag_na(y))
  y <- c("name" = NA)
  expect_true(check_flag_na(y))
  y <- NA_integer_
  expect_error(check_flag_na(y), "^y must be TRUE, FALSE or NA$")
  y <- 1
  expect_error(check_flag_na(y), "^y must be TRUE, FALSE or NA$")
})

test_that("check_string", {
  z <- "str"
  expect_true(check_string(z))
  z <- ""
  expect_true(check_string(z))
  z <- c("name" = "str")
  expect_true(check_string(z))
  z <- 1
  expect_error(check_string(z), "^z must be a character vector of length 1$")
  z <- character(0)
  expect_error(check_string(z), "^z must be a character vector of length 1$")
  z <- c("1", "2")
  expect_error(check_string(z), "^z must be a character vector of length 1$")
  expect_error(check_string(NA_character_), "^NA_character_ must be a character vector of length 1$")
})

test_that("check_length", {
  expect_true(check_length(1))
  expect_true(check_length(1:3))
  expect_error(check_length(1, numeric(0)), "length must have at least one value")
  expect_error(check_length(1, NA_integer_), " must not include any missing values")
  expect_error(check_length(character(0)), 
               "character[(]0[)] must have a length between 1 and 2147483647")
  expect_true(check_length(character(0), 0L))
  expect_error(check_length(1, 0), "1 must have a length of 0")
  expect_error(check_length(1, 2), "1 must have a length of 2")
  expect_error(check_length(1, c(2,4,3)), "1 must be of length 2, 3 or 4")
  expect_error(check_length(1, c(2,2,3)), "1 must be of length 2 or 3")
  expect_true(check_length(1, c(1,2,3)))
})

test_that("check_named", {
  y <- c("z" = 1L)
  expect_true(check_named(y))
  expect_true(check_named(y[-1]))
  expect_error(check_named(1L), "1L must be named")
})

test_that("check_in", {
  expect_true(check_in(1, 1))
  expect_true(check_in(1, 1L))
  expect_true(check_in(1, 1:2))
  expect_error(check_in(1, 2:3), "1 must be '2' or '3'")
})

test_that("check_unused", {
  expect_true(check_unused())
  expect_error(check_unused(1), "^... must be unused$")
})

