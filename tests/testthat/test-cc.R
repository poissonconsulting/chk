context("cc")

test_that("cc with atomic vectors", {
  expect_identical(cc(logical(0)), character(0))
  expect_match(cc(1), "^1$")
  expect_match(cc(1, brac = "'"), "^'1'$")
  expect_match(cc(c(1, 1), " or "), "^1 or 1$")
  expect_match(cc(1:2, " or "), "^1 or 2$")
  expect_match(cc(1:2), "^1, 2$")
  expect_match(cc(1:3, " or "), "^1, 2 or 3$")
  expect_match(cc(1:10, " or "), "^1, 2, 3, 4, 5, 6, 7, 8, 9 or 10$")
  expect_match(cc(1:11, " or "), "^1, 2, 3, 4, 5, 6, 7, 8, ... or 11$")
  expect_match(cc(11:1, " or "), "^11, 10, 9, 8, 7, 6, 5, 4, ... or 1$")
  expect_match(
    cc(11:1, brac = "'"),
    "^'11', '10', '9', '8', '7', '6', '5', '4', ..., '1'$"
  )
})

test_that("cc errors", {
  expect_chk_error(
    cc(1, conj = 1),
    "^`conj` must be a string [(]non-missing character scalar[)][.]$"
  )
  expect_chk_error(
    cc(1, conj = character(0)),
    "^`conj` must be a string [(]non-missing character scalar[)][.]$"
  )
  expect_chk_error(
    cc(1, conj = as.character(1:2)),
    "^`conj` must be a string [(]non-missing character scalar[)][.]$"
  )
  expect_chk_error(
    cc(1, brac = 1),
    "^`brac` must inherit from S3 class 'character'[.]$"
  )
  expect_chk_error(
    cc(1, brac = character(0)),
    "^`length[(]brac[)]` must be between 1 and 2, not 0[.]$"
  )
  expect_chk_error(
    cc(1, brac = as.character(1:3)),
    "^`length[(]brac[)]` must be between 1 and 2, not 3[.]$"
  )
  expect_chk_error(
    cc(1, sep = as.character(1:3)),
    "^`sep` must be a string [(]non-missing character scalar[)][.]$"
  )
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
  expect_match(cc(1:2, brac = c("{", "}")), "^\\{1\\}, \\{2\\}$")
  expect_match(cc(1:2, brac = c("", "}{")), "^1\\}\\{, 2\\}\\{$")
})

test_that("cc with random objects", {
  expect_identical(cc(list()), character(0))
  expect_match(cc(list(1)), "^1$")
  expect_match(cc(list(x = 1)), "^1$")
  expect_match(cc(matrix(1)), "^1$")
  expect_match(cc(matrix(1:9, 3), " or "), "^1, 2, 3, 4, 5, 6, 7, 8 or 9$")
})

test_that("cc with sep", {
  expect_identical(cc(1:3, sep = "|"), "1|2, 3")
})

test_that("cc with ellipsis", {
  expect_identical(cc(1:10), c("1, 2, 3, 4, 5, 6, 7, 8, 9, 10"))
  expect_identical(cc(1:10, ellipsis = 3), c("1, ..., 10"))
  expect_chk_error(
    cc(1:10, ellipsis = 2),
    "`ellipsis` must be greater than or equal to 3, not 2[.]"
  )
  expect_chk_error(
    cc(1:10, ellipsis = 2.5),
    "`ellipsis` must be a whole number [(]non-missing integer scalar or double equivalent[)][.]"
  )
})
