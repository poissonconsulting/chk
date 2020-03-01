test_that("check_names", {
  expect_null(check_names(c(x = 1)))
  expect_invisible(check_names(c(x = 1)))
  expect_null(check_names(c(x = 1), "x"))
  expect_null(check_names(c(x = 1, y = 2), "x"))
  expect_null(check_names(c(x = 1, y = 2), c("y", "x")))
})

test_that("check_names fails", {
  expect_chk_error(check_names(character(0)),
                   "^`character[(]0[)]` must be named[.]$")
  expect_chk_error(check_names(c(x = 1), c("x", "y")),
                   "`names[(]c[(]x = 1[)][)]` must include 'y'[.]$")
  expect_chk_error(check_names(c(x = 1, z = 2), "x", exclusive = TRUE),
                   "`names[(]c[(]x = 1, z = 2[)][)]` must equal set: 'x'[.]$")

  expect_chk_error(check_names(c(x = 1, y = 2), c("y", "x"), order = TRUE),
                   "`names[(]c[(]x = 1, y = 2[)][)]` must have the first occurence of each element shared with values in the following order: 'y', 'x'[.]$")
  expect_chk_error(check_names(c(x = 1, y = 2), c("y", "x"), order = TRUE, x_name = "b"),
                   "`names[(]b[)]` must have the first occurence of each element shared with values in the following order: 'y', 'x'[.]$")
})
