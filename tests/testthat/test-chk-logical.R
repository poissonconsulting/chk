test_that("vld_logical", {
  expect_true(vld_logical(TRUE))
  expect_true(vld_logical(matrix(TRUE)))
  expect_true(vld_logical(logical(0)))
  expect_true(vld_logical(NA))
  expect_false(vld_logical(1))
  expect_false(vld_logical("TRUE"))
})

test_that("chk_logical", {
  expect_identical(chk_logical(TRUE), TRUE)
  expect_invisible(chk_logical(FALSE))
  expect_chk_error(
    chk_logical(1),
    "^`1` must be logical[.]$"
  )
})
