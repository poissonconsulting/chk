test_that("vld_character", {
  expect_true(vld_character("1"))
  expect_true(vld_character(matrix("a")))
  expect_true(vld_character(character(0)))
  expect_true(vld_character(NA_character_))
  expect_false(vld_character(1))
  expect_false(vld_character(TRUE))
  expect_false(vld_character(factor("text")))
})

test_that("chk_character", {
  expect_null(chk_character("1"))
  expect_invisible(chk_character("1"))
  expect_chk_error(
    chk_character(TRUE),
    "^`TRUE` must be character[.]$"
  )
})
