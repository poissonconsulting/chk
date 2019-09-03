#' Check Range
#' 
#' Checks range of non-missing values.
#'
#' @details  
#' 
#' \code{chk_range()}: Check Range
#' 
#' Checks if all non-missing values fall within range using:
#' 
#' \code{all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2])}
#' 
#' Range should be a non-missing sorted vector of length 2.
#'  
#' @inheritParams chk_true
#' @param value A non-missing scalar of a value.
#' @param range A vector of length 2 of the lower and upper permitted values.
#' @return TRUE if passes check. Otherwise if throws an informative error unless
#' \code{err = FALSE} in which case it returns FALSE.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_range
#' chk_range(numeric(0))
#' chk_range(0)
#' try(chk_range(-0.1))
#' chk_range(c(0.1, 0.2, NA))
#' chk_range(c(0.1, 0.2, NA), range = c(0,1))
#' 
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_range <- function (x, range = c(0, Inf), err = TRUE, x_name = NULL) {
  if(all(x[!is.na(x)] >= range[1] & x[!is.na(x)] <= range[2])) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L) {
    if(range[1] == range[2])
      err(x_name, " must be ", cc(range[1]), ", not ", cc(x), ".")
    err(x_name, " must be between ", cc(range, " and "), 
        ", not ", cc(x), ".")
  }
  if(range[1] == range[2])
    err(x_name, " must have values of ", cc(range[1]), ".")
  err(x_name, " must have values between ", cc(range, " and "), ".")
}

#' @describeIn chk_range Check Less Than
#' 
#' Checks if all non-missing values are less than value using:
#' 
#' \code{all(x[!is.na(x)] < value))}
#' 
#' \code{value} should be a non-missing scalar.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_lt
#' chk_lt(numeric(0))
#' try(chk_lt(0))
#' chk_lt(-0.1)
#' chk_lt(c(-0.1, -0.2, NA))
#' try(chk_lt(c(-0.1, 0.2)))
#' chk_lt(c(-0.1, 0.2), value = 1)
#' chk_lt("a", value = "b")
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_lt <- function (x, value = 0, err = TRUE, x_name = NULL) {
  if(all(x[!is.na(x)] < value)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    err(x_name, " must be less than ", cc(value), ", not ", cc(x), ".")
  err(x_name, " must have values less than ", cc(value), ".")
}

#' @describeIn chk_range Check Less Than or Equal To
#' 
#' Checks if all non-missing values are less than or equal to y using:
#' 
#' \code{all(x[!is.na(x)] <= value))}
#' 
#' \code{value} should be a non-missing scalar.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_lte
#' chk_lte(numeric(0))
#' chk_lte(0)
#' try(chk_lte(0.1))
#' chk_lte(c(-0.1, -0.2, NA))
#' try(chk_lte(c(-0.1, -0.2, NA), value = -1))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_lte <- function (x, value = 0, err = TRUE, x_name = NULL) {
  if(all(x[!is.na(x)] <= value)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    err(x_name, " must be less than or equal to ", cc(value), ", not ", cc(x), ".")
  err(x_name, " must have values less than or equal to ", cc(value), ".")
}

#' @describeIn chk_range Check Greater Than
#' 
#' Checks if all non-missing values are greater than value using:
#' 
#' \code{all(x[!is.na(x)] > value))}
#' 
#' \code{value} should be a non-missing scalar.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_gt
#' chk_gt(numeric(0))
#' try(chk_gt(0))
#' chk_gt(0.1)
#' chk_gt(c(0.1, 0.2, NA))
#' try(chk_gt(c(0.1, -0.2)))
#' chk_gt(c(-0.1, 0.2), value = -1)
#' chk_gt("b", value = "a")
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_gt <- function (x, value = 0, err = TRUE, x_name = NULL) {
  if(all(x[!is.na(x)] > value)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    err(x_name, " must be greater than ", cc(value), ", not ", cc(x), ".")
  err(x_name, " must have values greater than ", cc(value), ".")
}

#' @describeIn chk_range Check Greater Than or Equal To
#' 
#' Checks if all non-missing values are greater than or equal to y using:
#' 
#' \code{all(x[!is.na(x)] >= value))}
#' 
#' \code{value} should be a non-missing scalar.
#' 
#' @export
#' 
#' @examples 
#' 
#' # chk_gte
#' chk_gte(numeric(0))
#' chk_gte(0)
#' try(chk_gte(-0.1))
#' chk_gte(c(0.1, 0.2, NA))
#' try(chk_gte(c(0.1, 0.2, NA), value = 1))
#'  
#  Licence: CC
#  Repository: https://github.com/poissonconsulting/chk
chk_gte <- function (x, value = 0, err = TRUE, x_name = NULL) {
  if(all(x[!is.na(x)] >= value)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name))  x_name <- paste0("`", deparse(substitute(x)), "`")
  if(length(x) == 1L)
    err(x_name, " must be greater than or equal to ", cc(value), 
        ", not ", cc(x), ".")
  err(x_name, " must have values greater than or equal to ", cc(value), ".")
}
