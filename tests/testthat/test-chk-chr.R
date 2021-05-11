test_that("vld_chr", {
  expect_false(vld_chr(character(0)))
  expect_true(vld_chr(NA_character_))
  expect_true(vld_chr(""))
  expect_true(vld_chr("a"))
  expect_false(vld_chr(c("a", "b")))
})

test_that("chk_chr", {
  expect_identical(chk_chr(""), "")
  expect_invisible(chk_chr(""))
  expect_chk_error(chk_chr(1), "^`1` must be a character scalar[.]$")
  expect_chk_error(chk_chr(1, x_name = "''"), "^'' must be a character scalar[.]$")
})

