context("chk-match")

test_that("chk_match", {
  expect_true(chk_match(1))
  expect_false(chk_match(1:3, err = FALSE))
  expect_error(chk_match(1:3, "^Values of `1:3` must match 1 or Inf[.]$"))
  expect_true(chk_match(numeric(0), 1L))
  
  expect_false(chk_match(-1, err = FALSE))
  expect_error(chk_match(-1), "^Values of `-1` must match 1 or Inf[.]$")
  
  expect_false(chk_match(1L, 0L, err = FALSE))
  expect_error(chk_match(1L, 0L), c("^Values of `1L` must match 0[.]$"))
  expect_error(chk_match(1, ""), "^Values of `1` must match ''[.]$")

  expect_false(chk_match(1, NA, err = FALSE)) 
  expect_error(chk_match(1, NA), 
               "^Values of `1` must match NA[.]$")
  
  expect_false(chk_match(c(NA, 1), 1, err = FALSE)) 
  expect_error(chk_match(c(NA, 1), 1), 
               "^Values of `c[(]NA, 1[)]` must match 1[.]$")
  
  expect_true(chk_match(NA, NA))
  
  expect_false(chk_match(c(NA, 1), 1:2, err = FALSE)) 
  expect_error(chk_match(c(NA, 1), 1:2), 
               "^Values of `c[(]NA, 1[)]` must match 1 or 2[.]$")
})


test_that("chk_values", {
  expect_true(chk_values(1))
  expect_true(chk_values(1:3))
  expect_true(chk_values(numeric(0), 1L))
  
  expect_false(chk_values(-1, err = FALSE))
  expect_error(chk_values(-1), "^`-1` must be between 1 and Inf, not -1[.]$")
  
  expect_false(chk_values(1L, 0L, err = FALSE))
  expect_error(chk_values(1L, 0L), c("^`1L` must be 0, not 1[.]$"))
  expect_error(chk_values(1, ""), "^`1` must be '', not 1[.]$")

  expect_false(chk_values(c(-1, NA), err = FALSE))
  expect_error(chk_values(c(-1, NA)), 
               "^`c[(]-1, NA[)]` must not have missing values[.]$")
  
  expect_false(chk_values(1, NA, err = FALSE)) 
  expect_error(chk_values(1, NA), 
               "^`1` must be NA, not 1[.]$")
  
  expect_false(chk_values(NA, 0L, err = FALSE))
  expect_error(chk_values(NA, 0L), c("^`NA` must not have missing values[.]$"))

  expect_true(chk_values(NA, NA))
  expect_true(chk_values(NA, c(NA, 1)))
  expect_true(chk_values(c(1,NA), c(NA, 1)))
  expect_true(chk_values(c(1,NA), c(NA, 1:2)))
  expect_error(chk_values(c(1,NA), c(NA, 3:2)),
              "^All values of `c[(]1, NA[)]` must be between 2 and 3[.]$")
  
  expect_false(chk_values(c(NA, 1), 1:2, err = FALSE)) 
  expect_error(chk_values(c(NA, 1), 1:2), 
               "^`c[(]NA, 1[)]` must not have missing values[.]$")
  
  expect_error(chk_values(2, c(1,1)), "^`2` must be 1, not 2[.]$")
  expect_error(chk_values(2, c(1,1,1)), "^`2` must be 1, not 2[.]$")
  expect_error(chk_values(c(2,2), c(1,1,1)), "^All values of `c[(]2, 2[)]` must be 1[.]$")
  
  expect_error(chk_values(3L, values = c(1L, 1L, 7L)), 
               "^`3L` must be 1 or 7, not 3[.]$")
})

test_that("chk_values(length)", {
  expect_true(chk_values(length(1)))
  expect_true(chk_values(length(1:3)))
  expect_true(chk_values(length(numeric(0)), 0L))
  expect_true(chk_values(length(1), c(1,2,3)))
  expect_false(chk_values(length(numeric(0)), err = FALSE))
  expect_error(chk_values(length(numeric(0))), 
               "^`length[(]numeric[(]0[)][)]` must be between 1 and Inf, not 0[.]$")
  expect_error(chk_values(length(character(0)), 1:10), "^`length[(]character[(]0[)][)]` must be 1, 2, 3, 4, 5, 6, 7, 8, 9 or 10, not 0[.]$")
  expect_error(chk_values(length(character(0)), 1:11), "^`length[(]character[(]0[)][)]` must be 1, 2, 3, 4, 5, 6, 7, 8, ... or 11, not 0[.]$")
})

