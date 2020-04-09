context("chk-all")

test_that("vld_all", {
  expect_true(vld_all(character(0), vld_true))
  expect_true(vld_all(NULL, vld_null))
  expect_false(vld_all(NULL, vld_not_null))
  expect_false(vld_all(FALSE, vld_true))
  expect_true(vld_all(FALSE, vld_false))
})

test_that("chk_all", {
  expect_null(chk_all(character(0), chk_true))
  expect_invisible(chk_all(character(0), chk_true))
  expect_null(chk_all(NULL, chk_null))
  expect_invisible(chk_all(NULL, chk_null))
  expect_null(chk_all(TRUE, chk_true))
  expect_null(chk_all(FALSE, chk_false))
  expect_null(chk_all(c(TRUE, TRUE), chk_true))
  expect_null(chk_all(1.1, chk_gt, 1))

  expect_chk_error(
    chk_all(NULL, chk_flag),
    "^`NULL` must be a flag [(]TRUE or FALSE[)][.]$"
  )
  expect_chk_error(
    chk_all(NULL, chk_flag, x_name = "NULL"),
    "^NULL must be a flag [(]TRUE or FALSE[)][.]$"
  )
  expect_chk_error(
    chk_all(FALSE, chk_true),
    "^All elements of `FALSE` must be TRUE[.]$"
  )
  expect_chk_error(
    chk_all(FALSE, chk_true, x_name = TRUE),
    "^All elements of TRUE must be TRUE[.]$"
  )
  expect_chk_error(
    chk_all(1.1, chk_gt, 2),
    "^All elements of `1.1` must be greater than 2, not 1.1[.]$"
  )
})

test_that("vld_all_identical", {
  expect_true(vld_all_identical(NULL))
  expect_true(vld_all_identical(character(0)))
  expect_true(vld_all_identical(1))
  expect_true(vld_all_identical(c(TRUE, TRUE)))
  expect_true(vld_all_identical(c(NA, NA)))
  expect_false(vld_all_identical(c(1, 2)))
})

test_that("chk_all_identical", {
  expect_null(chk_all_identical(NULL))
  expect_invisible(chk_all_identical(NULL))
  expect_chk_error(chk_all_identical(c(1, 2)), "^`c[(]1, 2[)]` must have identical elements[.]$")
})

test_that("vld_all_equal", {
  expect_true(vld_all_equal(NULL))
  expect_true(vld_all_equal(character(0)))
  expect_true(vld_all_equal(1))
  expect_true(vld_all_equal(c(TRUE, TRUE)))
  expect_true(vld_all_equal(c(NA, NA)))
  expect_false(vld_all_equal(c(1, 2)))
  expect_false(vld_all_equal(c(1, 1.0000001), tolerance = 1.490116e-08))
  expect_true(vld_all_equal(c(1, 1.00000001), tolerance = 1.490116e-08))
  expect_true(vld_all_equal(list(c(x = 1), c(x = 1))))
  expect_false(vld_all_equal(list(c(x = 1), c(y = 1))))
})

test_that("chk_all_equal", {
  expect_null(chk_all_equal(NULL))
  expect_invisible(chk_all_equal(NULL))
  expect_chk_error(chk_all_equal(c(1, 2)), "^`c[(]1, 2[)]` must have equal elements[.]$")
})

test_that("vld_all_equivalent", {
  expect_true(vld_all_equivalent(NULL))
  expect_true(vld_all_equivalent(character(0)))
  expect_true(vld_all_equivalent(1))
  expect_true(vld_all_equivalent(c(TRUE, TRUE)))
  expect_true(vld_all_equivalent(c(NA, NA)))
  expect_false(vld_all_equivalent(c(1, 2)))
  expect_false(vld_all_equivalent(c(1, 1.0000001), tolerance = 1.490116e-08))
  expect_true(vld_all_equivalent(c(1, 1.00000001), tolerance = 1.490116e-08))
  expect_true(vld_all_equivalent(list(c(x = 1), c(x = 1))))
  expect_true(vld_all_equivalent(list(c(x = 1), c(y = 1))))
})

test_that("chk_all_equivalent", {
  expect_null(chk_all_equivalent(NULL))
  expect_invisible(chk_all_equivalent(NULL))
  expect_chk_error(chk_all_equivalent(c(1, 2)), "^`c[(]1, 2[)]` must have equivalent elements[.]$")
})
