test_that("vld_complex", {
  expect_true(vld_complex(as.complex(1)))
  expect_true(vld_complex(as.complex(1:2)))
  expect_true(vld_complex(complex(0)))
  expect_true(vld_complex(NA_complex_))
  expect_false(vld_complex(1))
  expect_false(vld_complex(TRUE))
})

test_that("chk_complex", {
  expect_identical(chk_complex(as.complex(1)), as.complex(1))
  expect_invisible(chk_complex(as.complex(1)))
  expect_chk_error(
    chk_complex(TRUE),
    "^`TRUE` must be complex[.]$"
  )
})
