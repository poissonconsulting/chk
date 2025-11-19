test_that("vld_unused", {
  expect_true(vld_unused())
  expect_false(vld_unused(1))
})

test_that("chk_unused", {
  expect_null(chk_unused())
  expect_invisible(chk_unused())
  expect_chk_error(chk_unused(1), "^`...` must be unused[.]$")
})

test_that("vld_used", {
  expect_true(vld_used(1))
  expect_false(vld_used())
})

test_that("chk_used", {
  expect_null(chk_used(1))
  expect_invisible(chk_used(1))
  expect_chk_error(chk_used(), "^`...` must be used[.]$")
})
