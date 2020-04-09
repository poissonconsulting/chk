
test_that("vld_vector", {
  expect_true(vld_vector(1))
  expect_true(vld_vector(NA))
  expect_true(vld_vector(1:2))
  expect_true(vld_vector(integer(0)))
  expect_true(vld_vector(list()))
  expect_true(vld_vector(list(x = 1)))
  x <- 1
  attr(x, "oeu") <- 1
  expect_true(vld_vector(x))
  x <- list()
  class(x) <- "foo"
  expect_true(vld_vector(x))
  expect_false(vld_vector(matrix(1)))
})

test_that("chk_vector", {
  expect_null(chk_vector(1))
  expect_invisible(chk_vector(1))

  expect_chk_error(chk_vector(matrix(1)), "^`matrix[(]1[)]` must be a vector[.]$")
})
