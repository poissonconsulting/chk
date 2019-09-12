#' Turn checking on and off
#'
#' Turns checking on and off.
#' @export
#'
#' @examples
#' print(is_chk_on())
#' if (is_chk_on()) {
#'   chk_off()
#'   print(is_chk_on())
#'   chk_on()
#' } else {
#'   chk_on()
#'   print(is_chk_on())
#'   chk_off()
#' }
chk_on <- function() options(chk.on = TRUE)

#' @describeIn chk_on Turns checking off
#' @export
chk_off <- function() options(chk.on = FALSE)

#' @describeIn chk_on Tests checking on
#' @export
is_chk_on <- function() getOption("chk.on", TRUE)
