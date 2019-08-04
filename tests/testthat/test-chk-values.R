context("chk-values")

test_that("chk_values", {
  expect_true(chk_values(1))
  expect_true(chk_values(1:3))
  expect_true(chk_values(numeric(0), 1L))
  
  expect_false(chk_values(-1, err = FALSE))
  expect_error(chk_values(-1), "^`-1` must be between 0 and Inf, not -1[.]$")
  
  expect_false(chk_values(1L, 0L, err = FALSE))
  expect_error(chk_values(1L, 0L), c("^`1L` must be 0, not 1[.]$"))
  expect_error(chk_values(1, ""), "^`1` must be '', not 1[.]$")

  expect_false(chk_values(c(-1, NA), err = FALSE))
  expect_error(chk_values(c(-1, NA)), 
               "^All values of `c[(]-1, NA[)]` must be between 0 and Inf[.]$")
  
  expect_false(chk_values(1, NA, err = FALSE)) 
  expect_error(chk_values(1, NA), 
               "^`1` must be NA, not 1[.]$")
  
  expect_false(chk_values(NA, 0L, err = FALSE))
  expect_error(chk_values(NA, 0L), c("^`NA` must be 0, not NA[.]$"))
  
  expect_false(chk_values(c(NA, 1), 1, err = FALSE)) 
  expect_error(chk_values(c(NA, 1), 1), 
               "^All values of `c[(]NA, 1[)]` must be 1[.]$")
  
  expect_true(chk_values(NA, NA))
  
  expect_false(chk_values(c(NA, 1), 1:2, err = FALSE)) 
  expect_error(chk_values(c(NA, 1), 1:2), 
               "^`c[(]NA, 1[)]` must not have missing values[.]$")
})
