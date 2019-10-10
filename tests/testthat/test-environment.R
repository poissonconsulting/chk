context("chk-environment")

test_that("vld_environment", {
  expect_false(vld_environment(1))
  expect_false(vld_environment(list(1)))
  expect_true(vld_environment(.GlobalEnv))
  expect_true(vld_environment(environment()))
})

test_that("chk_environment", {
  expect_null(chk_environment(.GlobalEnv))
  expect_invisible(chk_environment(.GlobalEnv))
  expect_chk_error(chk_environment(1), "^`1` must be an environment[.]$")
  expect_chk_error(chk_environment(list(1), x_name = 1), "^1 must be an environment[.]$")
})
