test_that("vld_superset", {
  expect_true(vld_superset(1, 1))
  expect_true(vld_superset(1:2, 1))
  expect_true(vld_superset(1:3, 1:2))
  expect_true(vld_superset(c(1:3, NA), 1:2))
  expect_false(vld_superset(c(1:3), c(1:2, NA)))
  expect_true(vld_superset(c(1:3, NA), c(1:2, NA)))
  expect_false(vld_superset(1, 1:2))
})

test_that("chk_superset", {
  expect_identical(chk_superset(1, 1), 1, 1)
  expect_invisible(chk_superset(1, 1))
  expect_chk_error(chk_superset(1, 1:2), "^`1` must include 2[.]$")
  expect_chk_error(chk_superset(1, 1:3), "^`1` must include 2 and 3[.]$")
  expect_chk_error(chk_superset(2, 1), "^`2` must include 1[.]$")
})
