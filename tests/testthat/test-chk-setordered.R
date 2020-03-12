test_that("vld_setordered", {
  expect_true(vld_setordered(numeric(0), numeric(0)))
  expect_true(vld_setordered(NA, NA))
  expect_true(vld_setordered(1, 1))
  expect_true(vld_setordered(c(1, NA), c(1, NA)))
  expect_true(vld_setordered(1, 2:1))
  expect_true(vld_setordered(1, 2))
  expect_true(vld_setordered(1:2, 2))
  expect_false(vld_setordered(1:2, 2:1))
  expect_false(vld_setordered(c(NA, 1), c(1, NA)))
})

test_that("chk_setordered", {
  expect_null(chk_setordered(1, 1))
  expect_invisible(chk_setordered(1, 1))
  expect_chk_error(chk_setordered(2:1, 1:2), "`2:1` must have the first occurence of each element shared with values in the following order: 1, 2[.]$")
})
