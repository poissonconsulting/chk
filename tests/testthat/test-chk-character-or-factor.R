test_that("vld_character_or_factor", {
  expect_true(vld_character_or_factor("1"))
  expect_true(vld_character_or_factor(matrix("a")))
  expect_true(vld_character_or_factor(character(0)))
  expect_true(vld_character_or_factor(NA_character_))
  expect_false(vld_character_or_factor(1))
  expect_false(vld_character_or_factor(TRUE))
  expect_true(vld_character_or_factor(factor("text")))
})

test_that("chk_character_or_factor", {
  expect_identical(chk_character_or_factor("1"), "1")
  expect_invisible(chk_character_or_factor("1"))
  expect_chk_error(
    chk_character_or_factor(TRUE),
    "^`TRUE` must be character or factor[.]$"
  )
})

