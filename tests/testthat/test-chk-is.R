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
  expect_identical(chk_is(1L, "integer"), 1L, "integer")
  expect_invisible(chk_is(1L, "integer"))
  expect_chk_error(chk_is(1, "integer"), "^`1` must inherit from class 'integer'[.]$")
  expect_chk_error(
    chk_is(matrix(1), "numeric"),
    "`matrix[(]1[)]` must inherit from class 'numeric'[.]$"
  )
  x <- list()
  class(x) <- c("a", "b")
  expect_chk_error(chk_is(x, "c"), "`x` must inherit from class 'c'")
  expect_chk_error(chk_is(x, "c", x_name = "c"), "C must inherit from class 'c'")
})
