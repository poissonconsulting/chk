test_that("chk_tz", {
  expect_null(chk_tz("UTC"))
  expect_invisible(chk_tz("UTC"))
  expect_chk_error(
    chk_tz("TCU"),
    "^`\"TCU\"` must be a tz [(]non-missing scalar character of a recognized timezone[)][.]$"
  )
})

test_that("vld_tz", {
  expect_true(vld_tz("UTC"))
  expect_false(vld_tz("TCU"))
  expect_false(vld_tz(1))
  expect_false(vld_tz(character(0)))
  expect_false(vld_tz(c("UTC", "UTC")))
  expect_false(vld_tz(NA_character_))
})
