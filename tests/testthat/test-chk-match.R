context("chk-match")

test_that("chk_match", {
  expect_true(chk_match(1))
  expect_true(chk_match(1:3))
  expect_true(chk_match(numeric(0), 1L))
  
  expect_false(chk_match(-1, err = FALSE))
  expect_error(chk_match(-1), "^`-1` must be between 1 and Inf, not -1[.]$")
  
  expect_false(chk_match(1L, 0L, err = FALSE))
  expect_error(chk_match(1L, 0L), c("^`1L` must be 0, not 1[.]$"))
  expect_error(chk_match(1, ""), "^`1` must be '', not 1[.]$")

  expect_false(chk_match(c(-1, NA), err = FALSE))
  expect_error(chk_match(c(-1, NA)), 
               "^All values of `c[(]-1, NA[)]` must be between 1 and Inf[.]$")
  
  expect_false(chk_match(1, NA, err = FALSE)) 
  expect_error(chk_match(1, NA), 
               "^`1` must be NA, not 1[.]$")
  
  expect_false(chk_match(NA, 0L, err = FALSE))
  expect_error(chk_match(NA, 0L), c("^`NA` must be 0, not NA[.]$"))
  
  expect_false(chk_match(c(NA, 1), 1, err = FALSE)) 
  expect_error(chk_match(c(NA, 1), 1), 
               "^All values of `c[(]NA, 1[)]` must be 1[.]$")
  
  expect_true(chk_match(NA, NA))
  
  expect_false(chk_match(c(NA, 1), 1:2, err = FALSE)) 
  expect_error(chk_match(c(NA, 1), 1:2), 
               "^`c[(]NA, 1[)]` must not have missing values[.]$")
})

test_that("chk_match(length)", {
  expect_true(chk_match(length(1)))
  expect_true(chk_match(length(1:3)))
  expect_true(chk_match(length(numeric(0)), 0L))
  expect_true(chk_match(length(1), c(1,2,3)))
  expect_false(chk_match(length(numeric(0)), err = FALSE))
  expect_error(chk_match(length(numeric(0))), 
               "^`length[(]numeric[(]0[)][)]` must be between 1 and Inf, not 0[.]$")
  expect_error(chk_match(length(character(0)), 1:10), "^`length[(]character[(]0[)][)]` must be 1, 2, 3, 4, 5, 6, 7, 8, 9 or 10, not 0[.]$")
  expect_error(chk_match(length(character(0)), 1:11), "^`length[(]character[(]0[)][)]` must be 1, 2, 3, 4, 5, 6, 7, 8, ... or 11, not 0[.]$")
})
