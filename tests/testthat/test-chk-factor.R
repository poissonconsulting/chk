test_that("vld_factor", {
  expect_true(vld_factor(factor("1")))
  expect_true(vld_factor(factor(0)))
  expect_true(vld_factor(factor(NA)))
  expect_false(vld_factor(NA_character_))
  expect_false(vld_factor(1))
  expect_false(vld_factor(TRUE))
})

test_that("chk_factor", {
  expect_identical(chk_factor(factor("1")), factor("1"))
  expect_invisible(chk_factor(factor("1")))
  expect_chk_error(
    chk_factor(TRUE),
    "^`TRUE` must be factor[.]$"
  )
})

