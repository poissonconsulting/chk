context("chkor")

test_that("chkor", {
  expect_true(chkor())
  expect_true(chkor(chk_flag(TRUE)))
  expect_false(chkor(chk_flag(1), err = FALSE))
  expect_false(chkor(chk_flag(1), chk_flag(2), err = FALSE))
  expect_true(chkor(chk_flag(1), chk_flag(TRUE)))
  expect_error(chkor(chk_flag(1)), "'1' must be a flag [(]TRUE or FALSE[)]")
  expect_error(chkor(chk_flag(1), chk_flag(1)), "'1' must be a flag [(]TRUE or FALSE[)]")
  expect_error(chkor(chk_flag(1), chk_flag(2)), "'1' must be a flag [(]TRUE or FALSE[)] OR '2' must be a flag [(]TRUE or FALSE[)]")
  expect_error(chkor(chk_flag(1), chk_flag(2), chk_flag(0)), "'1' must be a flag [(]TRUE or FALSE[)] OR '2' must be a flag [(]TRUE or FALSE[)] OR '0' must be a flag [(]TRUE or FALSE[)]")
})
