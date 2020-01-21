context("chk-sorted")

test_that("vld_sorted", {
  expect_true(vld_sorted(TRUE))
  expect_true(vld_sorted(1))
  expect_true(vld_sorted(character(0)))
  expect_true(vld_sorted(NA))
  expect_true(vld_sorted(1:2))
  expect_false(vld_sorted(2:1))
})

test_that("chk_sorted", {
  expect_null(chk_sorted(TRUE))
  expect_invisible(chk_sorted(TRUE))
  expect_null(chk_sorted(c(x = TRUE)))

  expect_chk_error(chk_sorted(2:1), "^`2:1` must be sorted[.]$")
})
