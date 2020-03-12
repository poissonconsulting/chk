test_that("vld_orderset", {
  expect_true(vld_orderset(numeric(0), numeric(0)))
  expect_true(vld_orderset(NA, NA))
  expect_true(vld_orderset(1, 1))
  expect_true(vld_orderset(c(1, NA), c(1, NA)))
  expect_true(vld_orderset(1, 2:1))
  expect_true(vld_orderset(1, 2))
  expect_true(vld_orderset(1:2, 2))
  expect_false(vld_orderset(1:2, 2:1))
  expect_false(vld_orderset(c(NA, 1), c(1, NA)))
})

test_that("chk_orderset", {
  expect_null(chk_orderset(1, 1))
  expect_invisible(chk_orderset(1, 1))
  expect_chk_error(chk_orderset(2:1, 1:2), "`2:1` must have [(]the first occurence of[)] each of the following elements in the following order: 1, 2[.]$")
})
