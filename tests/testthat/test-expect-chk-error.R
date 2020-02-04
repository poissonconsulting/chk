test_that("expect-chk-error", {
  expect_is(expect_chk_error(chk_flag(1)), "chk_error")
  expect_error(expect_chk_error(chk_flag(TRUE)), "",
               class = "expectation_failure")
    expect_error(expect_chk_error(chk_flag(TRUE), class = "chk_error"), "`class` must be NULL.")
})
