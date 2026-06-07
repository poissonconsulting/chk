test_that("generate_check_data generates code that revalidates the source", {
  data <- data.frame(
    count = c(1L, 3L, NA),
    species = factor(c("a", "b", "a"), levels = c("a", "b")),
    weight = c(1.5, 2.0, 3.2),
    name = c("x", "y", "z"),
    flag = c(TRUE, FALSE, TRUE),
    grade = ordered(c("lo", "hi", "mid"), levels = c("lo", "mid", "hi")),
    day = as.Date(c("2020-01-01", "2020-06-15", "2020-12-31"))
  )
  code <- generate_check_data(data, data_name = "data")
  expect_identical(eval(parse(text = code)), data)
})

test_that("generate_check_data captures class, range, levels and NAs", {
  data <- data.frame(
    count = c(1L, 3L, NA),
    species = factor(c("a", "b", "a"), levels = c("a", "b")),
    weight = c(1.5, 2.0, 3.2)
  )
  expect_identical(
    generate_check_data(data, data_name = "data"),
    paste0(
      "check_data(\n",
      "  data,\n",
      "  values = list(\n",
      "    count = c(1L, 3L, NA),\n",
      "    species = factor(c(\"a\", \"b\"), levels = c(\"a\", \"b\")),\n",
      "    weight = c(1.5, 3.2)\n",
      "  )\n",
      ")"
    )
  )
})

test_that("generate_check_data uses the name of x by default", {
  my_data <- data.frame(x = 1L)
  code <- generate_check_data(my_data)
  expect_match(code, "^check_data\\(\n  my_data,", fixed = FALSE)
})

test_that("generate_check_data handles missing values", {
  # zero-length (class only) permits NAs; all-NA column
  expect_match(
    generate_check_data(data.frame(x = NA_real_), data_name = "d"),
    "x = numeric(0)",
    fixed = TRUE
  )
  # NA present with values present adds an explicit NA
  expect_match(
    generate_check_data(data.frame(x = c(1, 2, NA)), data_name = "d"),
    "x = c(1, 2, NA)",
    fixed = TRUE
  )
  # ordered factor with NA
  expect_match(
    generate_check_data(
      data.frame(x = ordered(c("a", NA), levels = c("a", "b"))),
      data_name = "d"
    ),
    "x = factor(c(\"a\", \"b\", NA), levels = c(\"a\", \"b\"), ordered = TRUE)",
    fixed = TRUE
  )
})

test_that("generate_check_data backticks non-syntactic names", {
  data <- data.frame(x = 1:3)
  names(data) <- "my col"
  expect_match(
    generate_check_data(data, data_name = "d"),
    "`my col` = c(1L, 3L)",
    fixed = TRUE
  )
})

test_that("generate_check_data handles a data frame with no columns", {
  expect_identical(
    generate_check_data(data.frame(), data_name = "data"),
    "check_data(data)"
  )
})

test_that("generate_check_data prints and returns invisibly", {
  expect_output(generate_check_data(data.frame(x = 1L), data_name = "d"))
  expect_invisible(generate_check_data(data.frame(x = 1L), data_name = "d"))
})

test_that("generate_check_data checks its arguments", {
  expect_chk_error(
    generate_check_data(1),
    "^`1` must be a data.frame[.]$"
  )
  expect_chk_error(
    generate_check_data(data.frame(x = 1), data_name = 1),
    "must be a string"
  )
})
