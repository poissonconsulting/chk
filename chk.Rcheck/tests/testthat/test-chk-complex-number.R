test_that("vld_complex_number", {
  expect_false(vld_complex_number(complex(0)))
  expect_false(vld_complex_number(NA_complex_))
  expect_true(vld_complex_number(1i))
  expect_true(vld_complex_number(as.complex(1)))
  expect_false(vld_complex_number(as.complex(c(1, 2))))
  expect_false(vld_complex_number(TRUE))
})

test_that("chk_complex_number", {
  expect_identical(chk_complex_number(as.complex(1)), as.complex(1))
  expect_invisible(chk_complex_number(as.complex(1)))
  expect_chk_error(chk_complex_number(TRUE), "^`TRUE` must be a complex number [(]non-missing complex scalar[)][.]$")
  expect_chk_error(chk_complex_number(TRUE, x_name = 1L), "^1 must be a complex number [(]non-missing complex scalar[)][.]$")
})
