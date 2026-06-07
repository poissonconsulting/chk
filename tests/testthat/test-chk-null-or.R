test_that("chk_null_or works vld", {
  expect_identical(chk_null_or(NULL, vld = vld_number), NULL)
  expect_invisible(chk_null_or(NULL, vld = vld_number), NULL)
  expect_identical(chk_null_or(1, vld = vld_number), 1)

  expect_chk_error(
    chk_null_or("1", vld = vld_number),
    "^`\"1\"` must be a number [(]non-missing numeric scalar[)] or NULL[.]$"
  )
})

test_that("chk_null_or still works chk", {
  rlang::local_options(lifecycle_verbosity = "quiet")

  expect_identical(chk_null_or(NULL, chk_number), NULL, chk_number)
  expect_invisible(chk_null_or(NULL, chk_number))
  expect_identical(chk_null_or(1, chk_number), 1, chk_number)

  expect_chk_error(
    chk_null_or("1", chk_number),
    "^`\"1\"` must be a number [(]non-missing numeric scalar[)] or NULL[.]$"
  )
})

test_that("chk_null_or vld overrides chk", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_identical(chk_null_or(1, chk_flag, vld = vld_number), 1)
  expect_chk_error(
    chk_null_or(1, chk = chk_number, vld = vld_flag),
    "^`1` must be a flag [(]TRUE or FALSE[)] or NULL[.]$"
  )
})

test_that("chk_null_or gives correct error message", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_error(
    chk_null_or("2000", vld = vld_whole_number),
    "^`\"2000\"` must be a whole number \\(non-missing integer scalar or double equivalent\\) or NULL\\.$"
  )
  expect_error(
    chk_null_or("2000", vld = chk::vld_whole_number),
    "^`\"2000\"` must be a whole number \\(non-missing integer scalar or double equivalent\\) or NULL\\.$"
  )
})

test_that("chk_null_or resolves a chk_ partner defined alongside the vld_", {
  vld_even <- function(x) is.numeric(x) && all(x %% 2 == 0)
  chk_even <- function(x, x_name = NULL) {
    if (vld_even(x)) {
      return(invisible(x))
    }
    if (is.null(x_name)) {
      x_name <- deparse_backtick_chk(substitute(x))
    }
    abort_chk(x_name, " must be even")
  }

  expect_identical(chk_null_or(NULL, vld = vld_even), NULL)
  expect_identical(chk_null_or(2, vld = vld_even), 2)
  expect_chk_error(
    chk_null_or(3, vld = vld_even),
    "^`3` must be even or NULL[.]$"
  )
})

test_that("chk_null_or falls back gracefully when no chk_ partner is found", {
  # an anonymous function has no derivable partner name
  expect_chk_error(
    chk_null_or("a", vld = function(x) is.numeric(x)),
    "^`\"a\"` must be valid or NULL[.]$"
  )
  # a vld passed via a variable is not a bare vld_ symbol
  fun <- vld_number
  expect_chk_error(
    chk_null_or("a", vld = fun),
    "^`\"a\"` must be valid or NULL[.]$"
  )
  # a vld_ with no partner at all falls back too
  vld_nopartner <- function(x) FALSE
  expect_chk_error(
    chk_null_or("a", vld = vld_nopartner),
    "^`\"a\"` must be valid or NULL[.]$"
  )
})
