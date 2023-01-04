# vld -----
test_that("validate true single vector passed", {
  x <- c(1, 3, 5)
  expect_true(vld_lengths_into(x))
})

test_that("validate true when vectors are all the same length", {
  x <- c(1, 3, 5)
  y <- c(2, 4, 6)
  expect_true(vld_lengths_into(x, y))
})

test_that("validate true when one vectors is length 1 and other vectors are the
          same length", {
  x <- c(1, 3, 5)
  y <- c(2, 4, 6)
  z <- c(1)
  expect_true(vld_lengths_into(x, y, z))
})

test_that("validate false when vector is length 0", {
  x <- NULL
  expect_true(vld_lengths_into(x))
})

test_that("validate false if one vectors is length 0", {
  x <- c(1, 3, 5)
  y <- c(2, 4, 6)
  z <- NULL
  expect_false(vld_lengths_into(x, y, z))
})

test_that("validate false when two vectors have multiple lengths", {
  x <- c(1, 3, 5)
  y <- c(2, 4)
  expect_false(vld_lengths_into(x, y))
})

test_that("validate false when vectors are multiple lengths", {
  v <- c(1, 3, 5)
  x <- c(2, 4)
  y <- c(1, 2, 3, 4)
  z <- c(8)
  expect_false(vld_lengths_into(v, x, y, z))
})

test_that("validate false if data frame of two lengths passed", {
  x <- data.frame(a = c(1, 2, 3), b = c(4, 5, 6))
  y <- data.frame(a = c(1, 2), b = c(6, 7), c = c(8, 9))
  expect_false(vld_lengths_into(x, y))
})

test_that("validate true when data frames passed", {
  x <- data.frame(a = c(1, 2, 3), b = c(4, 5, 6))
  y <- data.frame(a = c(1, 2, 3))
  expect_true(vld_lengths_into(x, y))
})

test_that("validate true if list passed", {
  x <- list(a = c(1, 2, 3), b = c(4, 5, 6))
  expect_true(vld_lengths_into(x))
})

test_that("validate true if lists passed", {
  x <- list(a = c(1, 2, 3), b = c(4, 5, 6))
  y <- list(e = c(1, 2, 3), f = c(4, 5, 6))
  expect_true(vld_lengths_into(x, y))
})

# chk -----
test_that("passes when single value passed", {
  x <- 1
  expect_null(chk_lengths_into(x))
  expect_invisible(chk_lengths_into(x))
})

test_that("passes when single vector passed", {
  x <- c(1, 3, 5)
  expect_null(chk_lengths_into(x))
  expect_invisible(chk_lengths_into(x))
})

test_that("passes when multiple vectors of same length passed", {
  x <- c(1, 3, 5)
  y <- c(2, 4, 6)
  z <- c(7, 8, 0)
  expect_null(chk_lengths_into(x, y, z))
  expect_invisible(chk_lengths_into(x, y, z))
})

test_that("passes when multiple vectors of same length passed and vectors of
          length one passed", {
  x <- c(1, 3, 5)
  y <- c(2, 4, 6)
  z <- 7
  expect_null(chk_lengths_into(x, y, z))
  expect_invisible(chk_lengths_into(x, y, z))
})

test_that("passes when only vector of length zero passed", {
  x <- NULL
  expect_null(chk_lengths_into(x))
  expect_invisible(chk_lengths_into(x))
})

test_that("throws error when vector of length zero and other length passed", {
  x <- NULL
  y <- c(1, 2, 3)
  expect_error(
    chk_lengths_into(x, y),
    regexp = paste0(
      "Vectors must be all the same length or length 1 but ",
      "not lengths 0 and 3\\."
    )
  )
})

test_that("throws error when vector have two different lengths", {
  x <- c(4, 5)
  y <- c(1, 2, 3)
  expect_error(
    chk_lengths_into(x, y),
    regexp = paste0(
      "Vectors must be all the same length or length 1 but ",
      "not lengths 2 and 3\\."
    )
  )
})

test_that("throws error when vector have three different lengths", {
  x <- c(4, 5)
  y <- c(1, 2, 3)
  z <- c(6, 7, 8, 9)
  expect_error(
    chk_lengths_into(x, y, z),
    regexp = paste0(
      "Vectors must be all the same length or length 1 but ",
      "not lengths 2, 3 and 4\\."
    )
  )
})
