context("chk-unused")

test_that("chk_unused", {
  expect_true(chk_unused())
  expect_false(chk_unused(1, err = FALSE))
  expect_error(chk_unused(1), "^`...` must be unused[.]$")
})

test_that("chk_used", {
  expect_true(chk_used(1))
  expect_false(chk_used(err = FALSE))
  expect_error(chk_used(), "^`...` must be used[.]$")
})
