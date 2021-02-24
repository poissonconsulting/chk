test_that("check_values pass", {
  expect_identical(check_values(1, 1), check_values(1, 1))
  expect_invisible(check_values(1, 1))
  expect_identical(check_values(1, numeric(0)), check_values(1, numeric(0)))
  expect_identical(check_values(integer(0), 1:3), check_values(integer(0), 1:3))
  expect_identical(check_values(1L, integer(0)), check_values(1L, integer(0)))
  expect_identical(check_values(NA_real_, numeric(0)), check_values(NA_real_, numeric(0)))
  expect_identical(check_values(1, -1), check_values(1, -1))
  expect_identical(check_values(1, NA_real_), check_values(1, NA_real_))
  expect_identical(check_values(1, c(2, NA_real_)), check_values(1, c(2, NA_real_)))
  expect_identical(check_values(1, c(1, 2, NA_real_)), check_values(1, c(1, 2, NA_real_)))
  expect_identical(check_values(1, c(1, 1)), check_values(1, c(1, 1)))
  expect_identical(check_values(1, c(0.5, 2, NA_real_)), check_values(1, c(0.5, 2, NA_real_)))
  expect_identical(check_values(c(1, NA_real_), c(0.5, 2, NA_real_)),
                   check_values(c(1, NA_real_), c(0.5, 2, NA_real_)))
  expect_identical(check_values(factor(1), factor(2)), check_values(factor(1), factor(2)))
  expect_identical(check_values(factor(c(1, NA)), factor(c(2, NA))),
                   check_values(factor(c(1, NA)), factor(c(2, NA))))
  expect_identical(check_values(factor(1:3), factor(1:2)), check_values(factor(1:3), factor(1:2)))
  expect_identical(check_values(factor(1:3), factor(1:2, levels = 1:2)),
                   check_values(factor(1:3), factor(1:2, levels = 1:2)))
  expect_identical(check_values(ordered(1:2), factor(c(1:2, NA))),
                   check_values(ordered(1:2), factor(c(1:2, NA))))
  expect_identical(check_values(ordered(1:3), factor(c(1:2))),
                   check_values(ordered(1:3), factor(c(1:2))))
  expect_identical(check_values(as.character(1:2), as.character(2:1)),
                   check_values(as.character(1:2), as.character(2:1)))
  expect_identical(check_values(factor(1:3), factor(1:3)), check_values(factor(1:3), factor(1:3)))
})

test_that("check_values fail", {
  expect_chk_error(
    check_values(1.1, c(1, 1)),
    "^All elements of `1.1` must be equal to: 1[.]"
  )
  expect_chk_error(
    check_values(1L, 1),
    "^`1L` must inherit from S3 class 'numeric'[.]$"
  )
  expect_chk_error(check_values(1, 1L), "`1` must inherit from S3 class 'integer'[.]")
  expect_chk_error(check_values(1L, numeric(0)), "`1L` must inherit from S3 class 'numeric'[.]")
  expect_chk_error(
    check_values(NA_real_, 1),
    "`NA_real_` must not have any missing values[.]"
  )
  expect_chk_error(
    check_values(1L, 2:3),
    "`1L` must be between 2 and 3, not 1[.]"
  )
  expect_chk_error(
    check_values(1:10, 21:22),
    "`1:10` must have values between 21 and 22[.]"
  )
  expect_chk_error(
    check_values(1:10, 22:21),
    "`1:10` must have values between 21 and 22[.]"
  )
  expect_chk_error(
    check_values(1:10, 21:23),
    "`1:10` must have values matching 21, 22 or 23[.]"
  )
  expect_chk_error(
    check_values(factor(1:2), as.character(1:3)),
    "^`factor[(]1:2[)]` must inherit from S3 class 'character'[.]$")

  expect_chk_error(
    check_values(factor(1:2), ordered(1:3)),
    "^`factor[(]1:2[)]` must inherit from S3 class 'ordered'[.]$")

  expect_chk_error(
    check_values(factor(1:2), factor(2:3)),
    "^`levels[(]factor[(]1:2[)][)]` must include '3'[.]$")

  expect_chk_error(
    check_values(factor(1:2), factor(1:3)),
    "^`levels[(]factor[(]1:2[)][)]` must be identical to: <chr>[.]")

  expect_chk_error(
    check_values(ordered(c(1,3), levels = 1:3), ordered(c(1,2), levels = 1:3)),
    "^`ordered[(]c[(]1, 3[)], levels = 1:3[)]` must have values between '1' and '2'[.]$")

   expect_chk_error(
     check_values(factor(1:2), factor(1:2, levels = 2:1)),
     "^`levels[(]factor[(]1:2[)][)]` must have [(]the first occurence of[)] each of the following elements in the following order: '2', '1'[.]$")

   expect_chk_error(
     check_values(ordered(1:2), ordered(1:2, levels = 2:1)),
     "^`levels[(]ordered[(]1:2[)][)]` must have [(]the first occurence of[)] each of the following elements in the following order: '2', '1'[.]$")
})
