context("chk-equal")

test_that("chk_equal", {
  expect_true(chk_equal(1, 1))
  expect_true(chk_equal(1L, 1L))
  expect_true(chk_equal(1, 1L))
  expect_true(chk_equal(1L, 1))
  
  expect_true(chk_equal(c(1L), 1L))
  expect_false(chk_equal(c(x = 1L), 1L, err = FALSE))
  expect_error(chk_equal(c(x = 1L), 1L), 
               "^`c[(]x = 1L[)]` must be equal to: 1L[.]$")
  expect_false(chk_equal(1L, c(x = 1L), err = FALSE))
  expect_error(chk_equal(1L, c(x = 1L)), 
               "^`1L` must be equal to: c[(]x = 1L[)][.]$")
  
  expect_true(chk_equal(1, 1.00000001))
  expect_true(chk_equal(1, 1.001, 0.01))
  expect_true(chk_equal(1, 1.001, 0.001))
  
  expect_false(chk_equal(1, 1.001, 0.0001, err = FALSE))
  expect_error(chk_equal(1, 1.001, 0.0001), c("^`1` must be equal to: 1[.]001[.]$"))
  expect_error(chk_equal(1, c(1,5,1,9)), 
               "^`1` must be equal to: c[(]1, 5, 1, 9[)][.]$")
  expect_error(chk_equal(1, 2, x_name = 2), 
               "^2 must be equal to: 2[.]$")
})

test_that("chk_identical", {
  expect_true(chk_identical(1, 1))
  expect_true(chk_identical(1L, 1L))
  expect_false(chk_identical(1, 1L, err = FALSE))
  expect_false(chk_identical(1L, 1, err = FALSE))
  
  expect_true(chk_identical(c(1L), 1L))
  expect_false(chk_identical(c(x = 1L), 1L, err = FALSE))
  expect_error(chk_identical(c(x = 1L), 1L), 
               "^`c[(]x = 1L[)]` must be identical to: 1L[.]$")
  expect_false(chk_identical(1L, c(x = 1L), err = FALSE))
  expect_error(chk_identical(1L, c(x = 1L)), 
               "^`1L` must be identical to: c[(]x = 1L[)][.]$")
  
  expect_error(chk_identical(1, 1L), "^`1` must be identical to: 1L[.]$")
  expect_error(chk_identical(1, 1:10), 
               "^`1` must be identical to: 1:10[.]$")
  expect_error(chk_identical(1, 1:100), 
               "^`1` must be identical to: 1:100[.]$")
  expect_error(chk_identical(1, c(1,5,1,9)), 
               "^`1` must be identical to: c[(]1, 5, 1, 9[)][.]$")
  expect_error(chk_identical(1, 2, x_name = 2), 
               "^2 must be identical to: 2[.]$")
})

test_that("chk_equivalent", {
  expect_true(chk_equivalent(1, 1))
  expect_true(chk_equivalent(1L, 1L))
  expect_true(chk_equivalent(1, 1L))
  expect_true(chk_equivalent(1L, 1))
  
  expect_true(chk_equivalent(c(1L), 1L))
  expect_true(chk_equivalent(c(x = 1L), 1L))
  expect_true(chk_equivalent(c(x = 1L), 1L))
  expect_true(chk_equivalent(1L, c(x = 1L)))
  expect_true(chk_equivalent(1L, c(x = 1L)))
  
  expect_true(chk_equivalent(1, 1.00000001))
  expect_true(chk_equivalent(1, 1.001, 0.01))
  expect_true(chk_equivalent(1, 1.001, 0.001))
  
  expect_false(chk_equivalent(1, 1.001, 0.0001, err = FALSE))
  expect_error(chk_equivalent(1, 1.001, 0.0001), c("^`1` must be equivalent to: 1[.]001[.]$"))
  expect_error(chk_equivalent(1, c(1,5,1,9)), 
               "^`1` must be equivalent to: c[(]1, 5, 1, 9[)][.]$")
  expect_error(chk_equivalent(1, 2, x_name = 2), 
               "^2 must be equivalent to: 2[.]$")
})
