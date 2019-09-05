context("chk-all")

test_that("chk_all", {
  expect_true(chk_all(NULL, chk_null))
  expect_error(chk_all(NULL, chk_flag), 
               "^`NULL` must be a flag [(]TRUE or FALSE[)][.]$")
  expect_error(chk_all(NULL, chk_flag, x_name = "NULL"), 
               "^NULL must be a flag [(]TRUE or FALSE[)][.]$")
  expect_true(chk_all(character(0), chk_true))
  expect_true(chk_all(TRUE, chk_true))
  expect_true(chk_all(FALSE, chk_false))
  expect_true(chk_all(list(TRUE), chk_true))
  expect_true(chk_all(c(TRUE, TRUE), chk_true))
  expect_true(chk_all(list(TRUE, TRUE), chk_true))
  expect_false(chk_all(FALSE, chk_true, err = FALSE))
  expect_error(chk_all(FALSE, chk_true), 
               "^All elements of `FALSE` must be TRUE[.]$")
  expect_error(chk_all(FALSE, chk_true, x_name = TRUE), 
               "^All elements of TRUE must be TRUE[.]$")
  expect_true(chk_all(1.1, chk_gt, 1))
  expect_error(chk_all(1.1, chk_gt, 2), 
              "^All elements of `1.1` must be greater than 2, not 1.1[.]$")
})

test_that("chk_all_identical", {
  expect_true(chk_all_identical(NULL))
  expect_true(chk_all_identical(character(0)))
  expect_true(chk_all_identical(1))
  expect_true(chk_all_identical(c(TRUE, TRUE)))
  expect_true(chk_all_identical(c(NA, NA)))
  expect_false(chk_all_identical(c(1, 2), err = FALSE))
  expect_error(chk_all_identical(c(1, 2)), "^`c[(]1, 2[)]` must have identical elements[.]$")
})
