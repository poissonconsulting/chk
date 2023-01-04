 # vld -----
test_that("validate true single vector passed", {
  x <- c(1, 3, 5)
  expect_true(vld_vector_lengths(x))
})

test_that("validate true when vectors are all the same length", {
  x <- c(1, 3, 5)
  y <- c(2, 4, 6)
  expect_true(vld_vector_lengths(x, y))
})

test_that("validate true when one vectors is length 1 and other vectors are the
          same length", {
  x <- c(1, 3, 5)
  y <- c(2, 4, 6)
  z <- c(1)
  expect_true(vld_vector_lengths(x, y, z))
})

test_that("validate false when vector is length 0", {
  x <- NULL
  expect_false(vld_vector_lengths(x))
})

test_that("validate false if one vectors is length 0", {
  x <- c(1, 3, 5)
  y <- c(2, 4, 6)
  z <- NULL
  expect_false(vld_vector_lengths(x, y, z))
})

test_that("validate false when two vectors have multiple lengths", {
  x <- c(1, 3, 5)
  y <- c(2, 4)
  expect_false(vld_vector_lengths(x, y))
})

test_that("validate false when vectors are multiple lengths", {
  v <- c(1, 3, 5)
  x <- c(2, 4)
  y <- c(1, 2, 3, 4)
  z <- c(8)
  expect_false(vld_vector_lengths(v, x, y, z))
})

test_that("validate false if data frame passed", {
  x <- data.frame(a = c(1, 2, 3), b = c(4, 5, 6))
  expect_false(vld_vector_lengths(x))
})

test_that("validate false if list passed", {
  x <- list(a = c(1, 2, 3), b = c(4, 5, 6))
  expect_false(vld_vector_lengths(x))
})


# chk -----
test_that("passes when single vector or non zero length passed", {
  x <- c(1, 3, 5)
  chk_vector_lengths(x)
})


