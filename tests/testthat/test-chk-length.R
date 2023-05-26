test_that("vld_length", {
  expect_true(vld_length(1))
  expect_true(vld_length(1:2, 2))
  expect_true(vld_length(NA))
  expect_true(vld_length(character(0), 0))
  expect_true(vld_length(data.frame(x = 1:2)))
  expect_false(vld_length(1:2))
  expect_true(vld_length(1:2, upper = 2))
  expect_true(vld_length(1:2, upper = 3))
})

test_that("chk_length", {
  expect_identical(chk_length(1), 1)
  expect_invisible(chk_length(1))
  expect_chk_error(chk_length(1:2), "^`1:2` must be length 1 not 2[.]$")
  expect_chk_error(chk_length(1:2, length = 3, upper = 4), "^`1:2` must have a length between 3 and 4 not 2[.]$")
  expect_chk_error(chk_length(1:2, x_name = 1L), "^1 must be length 1 not 2[.]$")
})
