context("chk-string")

test_that("chk_string", {
  expect_false(chk_string(character(0), err = FALSE))
  expect_false(chk_string(NA_character_, err = FALSE))
  expect_true(chk_string(""))
  expect_true(chk_string("a"))
  expect_false(chk_string(c("a", "b"), err = FALSE))
  expect_error(chk_string(1), "^`1` must be a string [(]non-missing character scalar[)][.]$")
  expect_error(chk_string(1, x_name = "''"), "^'' must be a string [(]non-missing character scalar[)][.]$")
})

test_that("chk_match", {
  expect_true(chk_match(character(0)))
  expect_true(chk_match(1))
  expect_true(chk_match("a"))
  expect_false(chk_match("", err = FALSE))
  expect_error(chk_match(""), "^`\"\"` must match regular expression '.+'[.]$")
  expect_error(chk_match(NA_character_), 
               "`NA_character_` must match regular expression '.+'")
  expect_true(chk_match(c("a", "b")))
  expect_error(chk_match(c("a", "b"), "b"), 
               "`c[(]\"a\", \"b\"[)]` must have values matching regular expression 'b'[.]$")
  expect_error(chk_match(c("a", "b"), 'b'), 
               "`c[(]\"a\", \"b\"[)]` must have values matching regular expression 'b'[.]$")
  expect_error(chk_match(c(NA, "b"), 'b'), 
               "`c[(]NA, \"b\"[)]` must have values matching regular expression 'b'[.]$")
  expect_error(chk_match(c(NA, "b"), 'b', x_name = "b"), 
               "b must have values matching regular expression 'b'[.]$")
})
