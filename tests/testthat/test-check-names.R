test_that("check_names", {
  expect_identical(check_names(c(x = 1)), c(x = 1))
  expect_invisible(check_names(c(x = 1)))
  expect_identical(check_names(c(x = 1), "x"), check_names(c(x = 1), "x"))
  expect_identical(
    check_names(c(x = 1, y = 2), "x"),
    check_names(c(x = 1, y = 2), "x")
  )
  expect_identical(
    check_names(c(x = 1, y = 2), c("y", "x")),
    check_names(c(x = 1, y = 2), c("y", "x"))
  )
})

test_that("check_names fails", {
  expect_chk_error(
    check_names(character(0)),
    "^`character[(]0[)]` must be named[.]$"
  )
  x <- structure(list(), .Names = character(0))
  x <- structure(list(), .Names = character(0))
  expect_chk_error(
    check_names(c(x = 1), exclusive = TRUE),
    "^`c[(]x = 1[)]` must not have any elements[.]$"
  )
  expect_chk_error(
    check_names(x, "x"),
    "^`names[(]x[)]` must include 'x'[.]$"
  )
  expect_chk_error(
    check_names(c(x = 1), c("x", "y")),
    "`names[(]c[(]x = 1[)][)]` must include 'y'[.]$"
  )
  expect_chk_error(
    check_names(c(x = 1, z = 2), "x", exclusive = TRUE),
    "^`names[(]c[(]x = 1, z = 2[)][)]` must not include 'z'[.]$"
  )

  expect_chk_error(
    check_names(c(x = 1, y = 2), c("y", "x"), order = TRUE),
    "`names[(]c[(]x = 1, y = 2[)][)]` must include 'y' and 'x' in that order[.]$"
  )
  expect_chk_error(
    check_names(c(x = 1, y = 2), c("y", "x"), order = TRUE, x_name = "b"),
    "`names[(]b[)]` must include 'y' and 'x' in that order[.]$"
  )
})
