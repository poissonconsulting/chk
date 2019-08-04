context("chk-length")

test_that("chk_length", {
  expect_true(chk_length(1))
  expect_true(chk_length(1:3))
  expect_true(chk_length(numeric(0), 0L))
  expect_true(chk_length(1, c(1,2,3)))
  expect_false(chk_length(numeric(0), err = FALSE))
  expect_error(chk_length(numeric(0)), 
               "^`numeric[(]0[)]` must be length 1 to 2147483647, not 0[.]$")
  expect_error(chk_length(1, 0), "^`1` must be length 0, not 1[.]$")
  expect_false(chk_length(1, 0, err = FALSE))
  expect_error(chk_length(1, 2), "^`1` must be length 2, not 1[.]$")
  expect_false(chk_length(1, c(3,2,2), err = FALSE))
  expect_error(chk_length(1, c(3,2,2)), "^`1` must be length 2 or 3, not 1[.]$")
  expect_false(chk_length(1, c(2,4,3), err = FALSE))
  expect_error(chk_length(1, c(2,4,3)), "^`1` must be length 2, 3 or 4, not 1[.]$")
})
