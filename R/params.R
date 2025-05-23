#' Parameter Descriptions for chk Package
#'
#' Default parameter descriptions which may be overridden in individual
#' functions.
#'
#' A flag is a non-missing logical scalar.
#'
#' A string is a non-missing character scalar.
#'
#' @param x The object to check.
#' @param x_name A string of the name of object x or NULL.
#' @param y An object to check against.
#' @param chk A flag specifying whether to check the other parameters.
#' @param chk_fun A chk_ function.
#' @param tolerance A non-negative numeric scalar.
#' @param ext A character vector of the permitted file extensions
#'   (without the .).
#' @param exists A flag specifying whether the files/directories must (or must not) exist.
#' @param value A non-missing scalar of a value.
#' @param range A non-missing sorted vector of length 2 of the lower and
#'   upper permitted values.
#' @param inclusive A flag specifying whether the range is exclusive.
#' @param regexp A string of a regular expression.
#' @param values A vector of the permitted values.
#' @param class A character vector specifying the possible class values.
#' @param length A count of the length.
#' @param upper A count of the max length.
#' @param formals A count of the number of formal arguments.
#' @param incomparables A vector of values that cannot be compared.
#'   FALSE means that all values can be compared.
#' @param by A character vector specifying the column names to join x and y on.
#' If named the names are the corresponding columns in x.
#' @param exclusive A flag specifying whether x must only include columns named in values.
#' @param order A flag specifying whether the order of columns in x must match names in values.
#' @param nrow A flag or a whole numeric vector of the value, value range or possible values.
#' @param key A character vector of the columns that represent a unique key.
#' @param vld_fun A vld_ function.
#' @param ... Additional arguments.
#' @return
#' The `chk_` function throws an informative error if the test fails or
#' returns the original object if successful so it can used in pipes.
#'
#' The `vld_` function returns a flag indicating whether the test was met.
#'
#' @keywords internal
#' @aliases parameters arguments args
#' @usage NULL
# nocov start
params <- function(...) NULL
# nocov end

