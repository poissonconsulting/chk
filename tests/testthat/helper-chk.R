expect_chk_error <- function(call, message) {
  expect_error(call, message, class = "chk_error")
}
