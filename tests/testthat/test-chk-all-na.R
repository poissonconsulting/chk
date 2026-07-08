test_that("vld_not_any_na", {
  expect_false(vld_all_na(1))
  expect_false(vld_all_na(matrix(1:3)))
  expect_false(vld_all_na(c(1, NA)))
  expect_true(vld_all_na(character(0)))
  expect_true(vld_all_na(NULL))
  expect_true(vld_all_na(c()))
  expect_true(vld_all_na(NA))
  expect_true(vld_all_na(c(NA, NA_real_, NA_character_)))
})

test_that("chk_not_any_na", {
  expect_chk_error(chk_all_na(1), "`1` must only have missing values\\.")
  expect_invisible(chk_all_na(NA_real_))
  expect_no_error(chk_all_na(NA))
  expect_chk_error(
    chk_all_na("NA", x_name = 1),
    "^1 must only have missing values[.]$"
  )
})
