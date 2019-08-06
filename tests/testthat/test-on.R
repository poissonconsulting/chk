context("on")

test_that("on", {
  setup(chk_off())
  teardown(chk_on())
  expect_false(is_chk_on())
  expect_identical(chk_on(), list(chk.on = FALSE))
  expect_true(is_chk_on())
  expect_identical(chk_on(), list(chk.on = TRUE))
  expect_identical(chk_off(), list(chk.on = TRUE))
  expect_false(is_chk_on())
  expect_identical(chk_off(), list(chk.on = FALSE))
})
