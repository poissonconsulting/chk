test_that("vld_valid_name", {
  expect_true(vld_valid_name(numeric(0)))
  expect_true(vld_valid_name(NA))
  expect_true(vld_valid_name("name"))
  expect_true(vld_valid_name(c("name", NA)))
  expect_true(vld_valid_name(c("name", "name")))
  expect_true(vld_valid_name("."))
  expect_false(vld_valid_name(".1"))
  expect_false(vld_valid_name("1"))
  expect_false(vld_valid_name(c("1", NA)))
})

test_that("chk_valid_name", {
  expect_identical(chk_valid_name("x"), "x")
  expect_invisible(chk_valid_name("x"))
  expect_chk_error(chk_valid_name(".1"), '^`".1"` must be valid name\\.$')
  expect_chk_error(chk_valid_name(".1", x_name = 1L), "^1 must be valid name\\.$")
})
