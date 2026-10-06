test_that("vld_finite", {
  expect_true(vld_finite(numeric(0)))
  expect_true(vld_finite(1))
  expect_true(vld_finite(c(-1, 0, 1e10)))
  expect_true(vld_finite(1L))
  expect_true(vld_finite(matrix(1:4, 2)))

  expect_false(vld_finite(NULL))
  expect_false(vld_finite(NA))
  expect_false(vld_finite(TRUE))
  expect_false(vld_finite(FALSE))
  expect_false(vld_finite(1i))
  expect_false(vld_finite(NA_real_))
  expect_false(vld_finite(NaN))
  expect_false(vld_finite(Inf))
  expect_false(vld_finite(-Inf))
  expect_false(vld_finite(c(1, NA)))
  expect_false(vld_finite(c(1, Inf)))
  expect_false(vld_finite("1"))
  expect_false(vld_finite(list(1)))
  expect_false(vld_finite(data.frame(x = 1)))
})

test_that("chk_finite", {
  expect_identical(chk_finite(1), 1)
  expect_invisible(chk_finite(1))

  expect_chk_error(chk_finite(Inf), "^`Inf` must be finite, not Inf[.]$")
  expect_chk_error(chk_finite(-Inf), "^`-Inf` must be finite, not -Inf[.]$")
  expect_chk_error(chk_finite(NaN), "^`NaN` must be finite, not NaN[.]$")
  expect_chk_error(
    chk_finite(NA_real_),
    "^`NA_real_` must be finite, not NA[.]$"
  )
  expect_chk_error(chk_finite(NA), "^`NA` must be numeric[.]$")
  expect_chk_error(chk_finite(TRUE), "^`TRUE` must be numeric[.]$")
  expect_chk_error(
    chk_finite(c(1, NaN)),
    "^`c[(]1, NaN[)]` must have finite values[.]$"
  )
  expect_chk_error(
    chk_finite(list(1)),
    "^`list[(]1[)]` must be numeric[.]$"
  )
  expect_chk_error(chk_finite(Inf, x_name = 1), "^1 must be finite, not Inf[.]$")
})
