context("cc")

test_that("cc with atomic vectors", {
  expect_identical(cc(logical(0)), character(0))
  expect_identical(cc(1), "1")
  expect_identical(cc(1, brac = "'"), "'1'")
  expect_identical(cc(c(1,1)), "1 or 1")
  expect_identical(cc(1:2), "1 or 2")
  expect_identical(cc(1:2, conj = ", "), "1, 2")
  expect_identical(cc(1:3), "1, 2 or 3")
  expect_identical(cc(1:10), "1, 2, 3, 4, 5, 6, 7, 8, 9 or 10")
  expect_identical(cc(1:11), "1, 2, 3, 4, 5, 6, 7, 8, ... or 11")
  expect_identical(cc(11:1), "11, 10, 9, 8, 7, 6, 5, 4, ... or 1")
  expect_identical(cc(11:1, conj = ", ", brac = "'"), 
                   "'11', '10', '9', '8', '7', '6', '5', '4', ..., '1'")
})

test_that("cc with random objects", {
  expect_identical(cc(list()), character(0))
  expect_identical(cc(list(1)), "1")
  expect_identical(cc(list(x = 1)), "1")
  expect_identical(cc(matrix(1)), "1")
  expect_identical(cc(matrix(1:9, 3)), "1, 2, 3, 4, 5, 6, 7, 8 or 9")
})
