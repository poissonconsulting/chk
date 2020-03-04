test_that("check_dim length", {
  expect_null(check_dim(1))
  expect_invisible(check_dim(1))
  expect_chk_error(
    check_dim(1:2, dim = identity),
    "`dim[(]x[)]` must be a whole number [(]non-missing integer scalar or double equivalent[)][.]"
  )
  expect_null(check_dim(integer(0)))
  expect_chk_error(
    check_dim(integer(0), values = TRUE),
    "^`length[(]integer[(]0[)][)]` must be greater than 0, not 0[.]$"
  )
  expect_chk_error(
    check_dim(1, values = FALSE),
    "^`length[(]1[)]` must be equal to: 0L[.]"
  )
  expect_null(check_dim(2, values = 1))
  expect_chk_error(
    check_dim(1, values = 2),
    "^`length[(]1[)]` must be equal to: 2[.]"
  )
  expect_chk_error(
    check_dim(1, values = 2:3),
    "^`length[(]1[)]` must be between 2 and 3, not 1[.]"
  )
  expect_chk_error(
    check_dim(1, values = 3:2),
    "^`length[(]1[)]` must be between 2 and 3, not 1[.]"
  )
  expect_null(check_dim(1:2, values = 2:3))
  expect_chk_error(
    check_dim(2, values = c(2, 2)),
    "`length[(]2[)]` must be equal to: 2[.]"
  )
  expect_chk_error(
    check_dim(2, values = c(2, 2, 2)),
    "`length[(]2[)]` must match 2, not 1[.]"
  )
  expect_chk_error(
    check_dim(2, values = c(3, 2, 2)),
    "`length[(]2[)]` must match 2 or 3, not 1[.]"
  )
})

test_that("check_dim nrow", {
  expect_null(check_dim(data.frame(x = 1), dim = nrow))
  expect_invisible(check_dim(data.frame(x = 1), dim = nrow))
  expect_chk_error(
    check_dim(data.frame(x = integer(0)), values = TRUE, dim = nrow),
    "`nrow[(]data.frame[(]x = integer[(]0[)][)][)]` must be greater than 0, not 0[.]"
  )
  expect_chk_error(
    check_dim(data.frame(x = integer(0)), dim = nrow, dim_name = "ncol", values = TRUE),
    "`ncol[(]data.frame[(]x = integer[(]0[)][)][)]` must be greater than 0, not 0[.]"
  )
  expect_chk_error(
    check_dim(data.frame(x = integer(0)), dim = nrow, x_name = "y", dim_name = "ncol", values = TRUE),
    "`ncol[(]y[)]` must be greater than 0, not 0[.]"
  )
})
