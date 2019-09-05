context("chk-unique")

test_that("chk_unique", {
  expect_true(chk_unique(integer(0)))
  expect_true(chk_unique(NA))
  expect_true(chk_unique(1))
  expect_true(chk_unique(c(1,2)))
  expect_true(chk_unique(c(1,NA)))
  expect_false(chk_unique(c(NA,NA), err = FALSE))
  expect_true(chk_unique(c(NA,NA), incomparables = NA))
  expect_true(chk_unique(c(NA,NA,1), incomparables = NA))
  expect_false(chk_unique(c(1,1), err = FALSE))
  expect_false(chk_unique(c(1,2,1), err = FALSE))
  expect_error(chk_unique(c(1,1)), "^`c[(]1, 1[)]` must be unique[.]$")
  expect_error(chk_unique(c(1,1), x_name = "unicorn"), "^unicorn must be unique[.]$")
})

test_that("chk_no_missing", {
  expect_true(chk_no_missing(1))
  expect_true(chk_no_missing(integer(0)))
  expect_false(chk_no_missing(NA, err = FALSE))
  expect_false(chk_no_missing(c(NA, 1), err = FALSE))
  expect_error(chk_no_missing(NA), "^`NA` must not have missing values[.]$")
  expect_error(chk_no_missing(NA, x_name = "1"), "^1 must not have missing values[.]$")
})

test_that("chk_named", {
  expect_false(chk_named(list(), err = FALSE))
  expect_false(chk_named(list(1), err = FALSE))
  expect_true(chk_named(list(x = 1)))
  expect_true(chk_named(list(x = 1)[-1]))
  expect_true(chk_named(c(x = 1)))
  expect_true(chk_named(c(x = 1)[-1]))
  expect_error(chk_named(1), "^`1` must be named[.]$")
  expect_error(chk_named(1, x_name = "new born"), "^new born must be named[.]$")
})

test_that("chk_in", {
  expect_true(chk_in(integer(0)))
  expect_error(chk_in(NA, c(0, Inf)), "^`NA` must match 0 or Inf, not NA[.]$")
  expect_false(chk_in(1:3, err = FALSE))
  expect_error(chk_in(1:3), "`1:3` must have values matching 0, 1 or NA[.]$")
  expect_true(chk_in(numeric(0), 1L))
  
  expect_false(chk_in(-1, err = FALSE))
  expect_error(chk_in(-1), "^`-1` must match 0, 1 or NA, not -1[.]$")
  
  expect_false(chk_in(1L, 0L, err = FALSE))
  expect_error(chk_in(c(1L, 1L), 0L), c("^`c[(]1L, 1L[)]` must have values matching 0[.]$"))
  expect_error(chk_in(1, ""), "^`1` must match '', not 1[.]$")
  
  expect_false(chk_in(1, NA, err = FALSE)) 
  expect_error(chk_in(1, NA), 
               "^`1` must match NA, not 1[.]$")
  
  expect_false(chk_in(c(NA, 1), 1, err = FALSE)) 
  expect_error(chk_in(c(NA, 1), 1), 
               "^`c[(]NA, 1[)]` must have values matching 1[.]$")
  
  expect_true(chk_in(NA, NA))
  
  expect_false(chk_in(c(NA, 1), 1:2, err = FALSE)) 
  expect_error(chk_in(c(NA, 1), 1:2), 
               "^`c[(]NA, 1[)]` must have values matching 1 or 2[.]$")
  
  expect_error(chk_in(3L, values = c(1L, 1L, 7L)), 
               "^`3L` must match 1 or 7, not 3[.]$")
  expect_error(chk_in(3L, values = c(1L, 1L, 7L), x_name = "1"), 
               "^1 must match 1 or 7, not 3[.]$")
})
