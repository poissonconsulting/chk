context("paste")

test_that("p", {
  expect_identical(p(), paste())
})

test_that("p0", {
  expect_identical(p0(), paste0())
})

test_that("cc with atomic vectors", {
  expect_identical(cc(logical(0)), character(0))
  expect_match(cc(1), "^1$")
  expect_match(cc(1, brac = "'"), "^'1'$")
  expect_match(cc(c(1,1), " or "), "^1 or 1$")
  expect_match(cc(1:2, " or "), "^1 or 2$")
  expect_match(cc(1:2), "^1, 2$")
  expect_match(cc(1:3, " or "), "^1, 2 or 3$")
  expect_match(cc(1:10, " or "), "^1, 2, 3, 4, 5, 6, 7, 8, 9 or 10$")
  expect_match(cc(1:11, " or "), "^1, 2, 3, 4, 5, 6, 7, 8, ... or 11$")
  expect_match(cc(11:1, " or "), "^11, 10, 9, 8, 7, 6, 5, 4, ... or 1$")
  expect_match(cc(11:1, brac = "'"), 
                   "^'11', '10', '9', '8', '7', '6', '5', '4', ..., '1'$")
})

test_that("cc with character", {
  expect_identical(cc(character(0)), character(0))
  expect_match(cc(as.character("")), "^''$")
  expect_match(cc(as.character("a")), "^'a'$")
})

test_that("cc with factor", {
  expect_identical(cc(factor(1)[-1]), character(0))
  expect_match(cc(as.factor("")), "^''$")
  expect_match(cc(as.factor("a")), "^'a'$")
})

test_that("cc with double brackets", {
  expect_match(cc(1:2, brac = c("{","}")), "^\\{1\\}, \\{2\\}$")
  expect_match(cc(1:2, brac = c("","}{")), "^1\\}\\{, 2\\}\\{$")
})

test_that("cc with random objects", {
  expect_identical(cc(list()), character(0))
  expect_match(cc(list(1)), "^1$")
  expect_match(cc(list(x = 1)), "^1$")
  expect_match(cc(matrix(1)), "^1$")
  expect_match(cc(matrix(1:9, 3), " or "), "^1, 2, 3, 4, 5, 6, 7, 8 or 9$")
})
