context("chk-unnamed")

test_that("vld_unnamed", {
  expect_true(vld_unnamed(list()))
  expect_true(vld_unnamed(list(1)))
  expect_false(vld_unnamed(list(x = 1)))
  expect_false(vld_unnamed(list(x = 1)[-1]))
  expect_false(vld_unnamed(c(x = 1)))
  expect_false(vld_unnamed(c(x = 1)[-1]))
})

test_that("chk_unnamed", {
  expect_null(chk_unnamed(1))
  expect_invisible(chk_unnamed(1))
  expect_chk_error(chk_unnamed(c(x = 1)), "^`c[(]x = 1[)]` must not be named[.]$")
  expect_chk_error(chk_unnamed(c(x = 1), x_name = "new born"), "^New born must not be named[.]$")
})
