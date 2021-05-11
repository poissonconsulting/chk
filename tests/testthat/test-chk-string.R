test_that("vld_string", {
  expect_false(vld_string(character(0)))
  expect_false(vld_string(NA_character_))
  expect_true(vld_string(""))
  expect_true(vld_string("a"))
  expect_false(vld_string(c("a", "b")))
})

test_that("chk_string", {
  expect_identical(chk_string(""), "")
  expect_invisible(chk_string(""))
  expect_chk_error(chk_string(1), "^`1` must be a string [(]non-missing character scalar[)][.]$")
  expect_chk_error(chk_string(1, x_name = "''"), "^'' must be a string [(]non-missing character scalar[)][.]$")
})

test_that("vld_match", {
  expect_true(vld_match(character(0)))
  expect_true(vld_match(1))
  expect_true(vld_match("a"))
  expect_true(vld_match(NA))
  expect_true(vld_match(c(NA, "b"), "b"))
  expect_false(vld_match(""))
  expect_true(vld_match(c("a", "b")))
})

test_that("chk_match", {
  expect_identical(chk_match("1"), "1")
  expect_invisible(chk_match("1"))
  expect_chk_error(chk_match(""), "^`\"\"` must match regular expression '.+'[.]$")
  expect_chk_error(
    chk_match(c("a", "b"), "b"),
    "`c[(]\"a\", \"b\"[)]` must have values matching regular expression 'b'[.]$"
  )
  expect_chk_error(
    chk_match(c("a", "b"), "b"),
    "`c[(]\"a\", \"b\"[)]` must have values matching regular expression 'b'[.]$"
  )
})

