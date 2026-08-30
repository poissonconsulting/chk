test_that("check_data works", {
  expect_identical(check_data(data.frame()), data.frame())
  expect_invisible(check_data(data.frame()))
  expect_identical(check_data(data.frame(x = 1)), data.frame(x = 1))
  expect_identical(
    check_data(data.frame(x = 1, values = list(x = 1))),
    check_data(data.frame(x = 1, values = list(x = 1)))
  )
  expect_identical(
    check_data(data.frame(x = 1), nrow = c(1, Inf)),
    data.frame(x = 1)
  )
})

test_that("check_data fails", {
  expect_chk_error(
    check_data(1),
    "^`1` must be a data.frame[.]$"
  )
  expect_chk_error(
    check_data(data.frame(), nrow = TRUE),
    "`nrow[(]data.frame[(][)][)]` must be greater than 0, not 0."
  )
  expect_chk_error(
    check_data(data.frame(), values = list(x = 1)),
    "`names[(]data.frame[(][)][)]` must include 'x'."
  )

  expect_chk_error(
    check_data(
      data.frame(x = 1, y = 2),
      values = list(x = 1),
      exclusive = TRUE
    ),
    "^`names[(]data.frame[(]x = 1, y = 2[)][)]` must not include 'y'[.]$"
  )
  expect_chk_error(
    check_data(data.frame(x = 1), values = list(x = 1L)),
    "`data.frame[(]x = 1[)][$]x` must inherit from class 'integer'."
  )
  expect_chk_error(
    check_data(data.frame(x = c(1, 1)), key = "x"),
    "^Column 'x' in `data.frame[(]x = c[(]1, 1[)][)]` must be a unique key[.]$"
  )
  expect_chk_error(
    check_data(
      data.frame(x = ordered(1:2)),
      values = list(x = ordered(1:2, levels = 2:1))
    ),
    "^`levels[(]data.frame[(]x = ordered[(]1:2[)][)][$]x[)]` must have each of the following elements in the following order: '2', '1'[.]$"
  )
})

test_that("factors are handled correctly.", {
  # level doesn't matter: only checking that class is "factor" when values is empty factor
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "c", "z"))),
                             list(fac = factor())))

  # level doesn't matter: only checking that class is "factor" when values is 1 level and not NA
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "c", "z"))),
                             list(fac = factor("z"))))

  # NAs are not required in the data set
  expect_no_error(check_data(data.frame(fac = factor(c("a", "z"))),
                             list(fac = factor(c("a", "z", NA)))))

  # ensure the data are subset of the factor levels, in the same order
  expect_no_error(check_data(data.frame(fac = factor(c("a", "z"), levels = c("a", "b", "z"))),
                             list(fac = factor(c("a", "b", "z")))))
  expect_error(check_data(data.frame(fac = factor(c("a", "z"))),
                          list(fac = factor(c("a", "b", "z")))),
               "`levels(data.frame(fac = factor(c(\"a\", \"z\")))$fac)` must include 'b'.",
               fixed = TRUE)
  expect_error(check_data(data.frame(fac = factor(c("a", "b", "c", "z"))),
                          list(fac = factor(c("a", "b", "c")))),
               "`levels(data.frame(fac = factor(c(\"a\", \"b\", \"c\", \"z\")))$fac)` must have values matching 'a', 'b' or 'c'.",
               fixed = TRUE)
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "z"))),
                             list(fac = factor(levels = c("a", "b", "z")))))
  expect_error(check_data(data.frame(fac = factor(c("a", "b", "z"))),
                          list(fac = factor("", levels = c("a", "b", "z")))),
               "`data.frame(fac = factor(c(\"a\", \"b\", \"z\")))$fac` must only have missing values.",
               fixed = TRUE)
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "z"))),
                             list(fac = factor("a", levels = c("a", "b", "z")))))
  expect_error(check_data(data.frame(fac = factor(c("a", "b", "z"))),
                          list(fac = factor("x", levels = c()))),
               "`data.frame(fac = factor(c(\"a\", \"b\", \"z\")))$fac` must only have missing values.",
               fixed = TRUE)
  expect_error(check_data(data.frame(fac = factor(c("a", "b", "z"))),
                          list(fac = factor("x", levels = c("a", "b", "z")))),
               "`data.frame(fac = factor(c(\"a\", \"b\", \"z\")))$fac` must only have missing values.",
               fixed = TRUE)
  expect_error(check_data(data.frame(fac = factor(c("a", "b", "z"))),
                          list(fac = factor(NA, levels = c("a", "b", "z")))),
               "`data.frame(fac = factor(c(\"a\", \"b\", \"z\")))$fac` must only have missing values.",
               fixed = TRUE)

  expect_error(check_data(data.frame(fac = factor(c("a", "b", "c", "z"))),
                          list(fac = factor(NA, levels = "b"))),
               "`data.frame(fac = factor(c(\"a\", \"b\", \"c\", \"z\")))$fac` must only have missing values.",
               fixed = TRUE)
  # one level plus NA means any factor with missing values allowed
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "c", "z"))),
                             list(fac = factor(c("b", NA), levels = "b"))))
  expect_error(check_data(data.frame(fac = factor(c("a", "b", "z"))),
                          list(fac = factor(c("a", "b")))),
               "`levels(data.frame(fac = factor(c(\"a\", \"b\", \"z\")))$fac)` must have values matching 'a' or 'b'.",
               fixed = TRUE)
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "z"), c("a", "z", "b"))),
                             list(fac = factor(c("a", "b", "z"), c("a", "z", "b")))))
  expect_error(check_data(data.frame(fac = factor(c("a", "b", "z"), c("a", "z", "b"))),
                          list(fac = factor(c("a", "b", "z")))),
               "`levels(data.frame(fac = factor(c(\"a\", \"b\", \"z\"), c(\"a\", \"z\", \"b\")))$fac)` must have each of the following elements in the following order: 'a', 'b', 'z'.",
               fixed = TRUE)
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "z"))),
                             list(fac = factor(c("a", NA), levels = c("a", "b", "z")))))
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "z"))),
                             list(fac = factor(c("a", "b", "z", NA), levels = c("a", "b", "z")))))
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "z"))),
                             list(fac = factor(c("a", "x", NA), levels = c("a", "b", "z")))))
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "z", NA))),
                             list(fac = factor(c("a", NA), levels = c("a", "b", "z")))))
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "z", NA))),
                             list(fac = factor(c("a", "b", "z", NA), levels = c("a", "b", "z")))))
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "z", NA))),
                             list(fac = factor(c("a", "x", NA), levels = c("a", "b", "z")))))

  # no NAs in the check set means no NAs allowed in the data
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "z"))),
                             list(fac = factor(c("a"), levels = c("a", "b", "z")))))
  expect_no_error(check_data(data.frame(fac = factor(c("a", "b", "z"))),
                             list(fac = factor(c("a", "b", "z"), levels = c("a", "b", "z")))))
  expect_error(check_data(data.frame(fac = factor(c("a", "b", "z", NA))),
                          list(fac = factor(c("a"), levels = c("a", "b", "z")))),
               "`data.frame(fac = factor(c(\"a\", \"b\", \"z\", NA)))$fac` must not have any missing values.",
               fixed = TRUE)
  expect_error(check_data(data.frame(fac = factor(c("a", "b", "z", NA))),
                          list(fac = factor(c("a", "b", "z"), levels = c("a", "b", "z")))),
               "`data.frame(fac = factor(c(\"a\", \"b\", \"z\", NA)))$fac` must not have any missing values.",
               fixed = TRUE)
})

test_that("check_data works with expressions that deparse over multiple lines", {
  data <- data.frame(fac = factor(c("a", "b", "z"), levels = c("a", "z", "b")))
  expect_identical(
    check_data(
      data.frame(fac = factor(c("a", "b", "z"), levels = c("a", "z", "b"))),
      list(fac = factor(c("a", "b", "z"), levels = c("a", "z", "b")))
    ),
    data
  )
  expect_error(
    check_data(
      data.frame(fac = factor(c("a", "b", "z"), levels = c("a", "z", "b"))),
      list(fac = factor(c("a", "b"), levels = c("a", "b")))
    ),
    "`levels(data.frame(fac = factor(c(\"a\", \"b\", \"z\"), levels = c(\"a\", \"z\", \"b\")))$fac)` must have values matching 'a' or 'b'.",
    fixed = TRUE
  )
})
