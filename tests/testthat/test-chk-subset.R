context("chk-subset")

test_that("vld_subset", {
  expect_true(vld_subset(integer(0), 1))
  expect_false(vld_subset(1:3, 1:2))
  expect_true(vld_subset(numeric(0), 1L))

  expect_false(vld_subset(-1, c(0, 1, NA)))
  expect_false(vld_subset(1L, 0L))
  expect_false(vld_subset(1, NA))

  expect_false(vld_subset(c(NA, 1), 1))
  expect_true(vld_subset(NA, NA))

  expect_false(vld_subset(c(NA, 1), 1:2))
})

test_that("chk_subset", {
  expect_null(chk_subset(integer(0), 1))
  expect_invisible(chk_subset(integer(0), 1))
  expect_chk_error(chk_subset(NA, c(0, Inf)), "^`NA` must match 0 or Inf, not NA[.]$")
  expect_chk_error(chk_subset(1:3, c(0, 1, NA)), "`1:3` must have values matching 0, 1 or NA[.]$")
  expect_chk_error(chk_subset(-1, c(0, 1, NA)), "^`-1` must match 0, 1 or NA, not -1[.]$")
  expect_chk_error(chk_subset(c(1L, 1L), 0L), c("^`c[(]1L, 1L[)]` must have values matching 0[.]$"))
  expect_chk_error(chk_subset(1, ""), "^`1` must match '', not 1[.]$")
  expect_chk_error(
    chk_subset(1, NA),
    "^`1` must match NA, not 1[.]$"
  )
  expect_chk_error(
    chk_subset(c(NA, 1), 1),
    "^`c[(]NA, 1[)]` must have values matching 1[.]$"
  )
  expect_chk_error(
    chk_subset(c(NA, 1), 1:2),
    "^`c[(]NA, 1[)]` must have values matching 1 or 2[.]$"
  )
  expect_chk_error(
    chk_subset(3L, values = c(1L, 1L, 7L)),
    "^`3L` must match 1 or 7, not 3[.]$"
  )
  expect_chk_error(
    chk_subset(3L, values = c(1L, 1L, 7L), x_name = "1"),
    "^1 must match 1 or 7, not 3[.]$"
  )
})

test_that("vld_superset", {
  expect_true(vld_superset(1, 1))
  expect_true(vld_superset(1:2, 1))
  expect_true(vld_superset(1:3, 1:2))
})

test_that("chk_superset", {
  expect_null(chk_superset(1, 1))
  expect_invisible(chk_superset(1, 1))
  expect_chk_error(chk_superset(1, 1:2), "^`1` must include 2[.]$")
  expect_chk_error(chk_superset(1, 1:3), "^`1` must include 2 and 3[.]$")
  expect_chk_error(chk_superset(2, 1), "^`2` must include 1[.]$")
})
