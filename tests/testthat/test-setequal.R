context("setequal")

test_that("vld_setequal", {
  expect_true(vld_setequal(1, 1))
  expect_true(vld_setequal(1L, 1))
  expect_true(vld_setequal(character(0), character(0)))
  expect_false(vld_setequal(1:2, 1))
  expect_false(vld_setequal(1, 1:2))
})

test_that("chk_setequal", {
  expect_null(chk_setequal(1, 1))
  expect_invisible(chk_setequal(1, 1))
  expect_chk_error(chk_setequal(1, 1:2), "^`1` must equal set: 1, 2[.]$")
  expect_chk_error(chk_setequal(1, 1:2, x_name = 2), "^2 must equal set: 1, 2[.]$")
})
