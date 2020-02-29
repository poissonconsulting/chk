test_that("check_set", {
  expect_null(check_set(1, 1))
  expect_invisible(check_set(1, 1))
  expect_null(check_set(character(0), character(0)))
  expect_null(check_set(NA, NA))
  expect_null(check_set(2:1, 1:2))
  expect_null(check_set(1, numeric(0)))
})

test_that("check_set fails", {
  expect_chk_error(check_set(1, 1:2, exclusive = TRUE),
                   "`1` must equal set: 1, 2[.]$")
  expect_chk_error(expect_null(check_set(1, 1:2)),
                   "`1` must include 2[.]$")
  expect_chk_error(check_set(2:1, 1:2, order = TRUE),
                   "`2:1` must have the first occurence of each element shared with values in the following order: 1, 2[.]$")
    expect_chk_error(check_set(2:1, 1:2, order = TRUE, x_name = "`b`"),
                   "`b` must have the first occurence of each element shared with values in the following order: 1, 2[.]$")

})
