#' Check In and Has
#' 
#' Checks/validates if in and has values.
#'
#' @inheritParams chk_true
#' @param values A vector of the permitted values.
#' @return The \code{chk_} functions throw an informative error if the test fails.
#' The \code{vld_} functions return a flag indicating whether the test was met.
#' @name chk_in
NULL

#' @describeIn chk_in Check In
#' 
#' Checks if all values in values using \code{vld_in()}.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_in
#' chk_in(1, 1:10)
#' try(chk_in(11, 1:10))
chk_in <- function (x, values, x_name = NULL) {
  if(vld_in(x, values)) return(invisible())
  values <- sort(unique(values), na.last = TRUE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    stop(x_name, " must match ", cc(values, " or "), ", not ", cc(x), ".", 
         call. = FALSE)
  stop(x_name, " must have values matching ", cc(values, " or "), ".", 
       call. = FALSE)
}

#' @describeIn chk_in Validate In
#' 
#' Validates all values in values using equivalent of
#' 
#' \code{all(\link{match}(x, values, nomatch = 0) > 0)}
#' 
#' @export
#' 
#' @examples 
#' 
#' # vld_in
#' vld_in(numeric(0), 1:10)
#' vld_in(1, 1:10)
#' vld_in(11, 1:10)
vld_in <- function (x, values) all(x %in% values)

#' @describeIn chk_in Check Has
#' 
#' Checks if includes all values using \code{vld_has()}.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_has
#' chk_has(1:3, 1)
#' try(chk_has(1:3, 4))
chk_has <- function(x, values, x_name = NULL) {
  if(vld_has(x, values)) return(invisible())
  values <- sort(unique(values), na.last = TRUE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  values <- values[!values %in% x]
  stop(x_name, " must include ", cc(values, " and "), ".", 
       call. = FALSE)
}

#' @describeIn chk_in Validates Has
#' 
#' Validates includes all values using
#' 
#' \code{all(\link{match}(values, x, nomatch = 0) > 0)}.
#' 
#' @export
#' 
#' @examples 
#' 
#' # vld_has
#' vld_has(1:3, 1)
#' vld_has(1:3, 4)
#' vld_has(integer(0), integer(0))
vld_has <- function(x, values) all(values %in% x)
