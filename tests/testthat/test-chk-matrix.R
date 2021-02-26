test_that("vld_matrix", {
  expect_false(vld_matrix(1))
  expect_false(vld_matrix(array(1)))
  expect_true(vld_matrix(matrix()))
  expect_true(vld_matrix(matrix(NA)))
  expect_true(vld_matrix(matrix(1)))
})

test_that("chk_matrix", {
  expect_null(chk_matrix(matrix(1)))
  expect_invisible(chk_matrix(matrix(1)))
  expect_chk_error(
    chk_matrix(1),
    "^`1` must be an matrix[.]$"
  )
})

test_that("check_matrix", {
  expect_identical(check_matrix(matrix(1)), matrix(1))
  expect_invisible(check_matrix(matrix(1)))
  expect_chk_error(
    check_matrix(1),
    "^`1` must be an matrix[.]$"
  )
})
