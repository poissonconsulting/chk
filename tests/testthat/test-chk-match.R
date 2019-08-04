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
