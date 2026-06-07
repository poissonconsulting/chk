#' Generate `check_data()` Code
#'
#' @description
#' Generates the code for a [check_data()] call from an example data frame so
#' the column specification does not have to be written out by hand.
#'
#' @details
#' For each column the generated `values` entry captures
#'
#' \itemize{
#'   \item the column's class,
#'   \item whether it permits missing values,
#'   \item the range (minimum and maximum) of numeric, Date and POSIXct
#'     columns, and
#'   \item the levels of factors.
#' }
#'
#' The result is a starting point that is expected to be edited, for example to
#' widen a range or relax a set of factor levels. The code is printed to the
#' console (so it can be copied) and returned invisibly as a string.
#'
#' @param x A data frame to generate the [check_data()] code from.
#' @param data_name A string of the name to use for the data frame in the
#'   generated code or NULL to use the name of `x`.
#' @return A string of the generated code, invisibly.
#'
#' @seealso [check_data()]
#' @export
#'
#' @examples
#' data <- data.frame(
#'   count = c(1L, 3L, NA),
#'   letter = c("a", "b", "c"),
#'   height = c(1.5, 2.5, 3.5)
#' )
#' generate_check_data(data)
generate_check_data <- function(x, data_name = NULL) {
  sx <- substitute(x)
  x_name <- deparse_backtick_chk(sx)
  if (is.null(data_name)) {
    data_name <- if (is.name(sx)) deparse(sx) else "data"
  }
  chk_data(x, x_name = x_name)
  chk_string(data_name)

  if (!length(x)) {
    code <- p0("check_data(", data_name, ")")
    cat(code, "\n", sep = "")
    return(invisible(code))
  }

  entries <- vapply(
    names(x),
    function(name) {
      p0(
        "    ",
        generate_name_code(name),
        " = ",
        generate_values_code(x[[name]])
      )
    },
    character(1)
  )
  code <- p0(
    "check_data(\n",
    "  ",
    data_name,
    ",\n",
    "  values = list(\n",
    p0(entries, collapse = ",\n"),
    "\n",
    "  )\n",
    ")"
  )
  cat(code, "\n", sep = "")
  invisible(code)
}

generate_name_code <- function(name) {
  if (vld_valid_name(name)) {
    return(name)
  }
  backtick_chk(name)
}

generate_values_code <- function(col) {
  has_na <- anyNA(col)
  v <- col[!is.na(col)]

  if (is.factor(col)) {
    return(generate_factor_code(col, has_na))
  }
  if (is.numeric(col) || inherits(col, "Date") || inherits(col, "POSIXct")) {
    u <- sort(unique(v))
    if (!length(u)) {
      return(generate_empty_code(col))
    }
    if (length(u) == 1L) {
      return(generate_scalar_code(u[1], has_na, col))
    }
    return(generate_range_code(min(u), max(u), has_na, col))
  }
  # Other atomic types (character, logical, complex, raw): class and missingness
  # only, as there is no meaningful range to capture.
  if (!length(v)) {
    return(generate_empty_code(col))
  }
  generate_scalar_code(v[[1]], has_na, col)
}

generate_factor_code <- function(col, has_na) {
  levs <- levels(col)
  ordered <- if (is.ordered(col)) ", ordered = TRUE" else ""
  if (!length(levs)) {
    values <- if (has_na) "NA" else "character(0)"
    return(p0("factor(", values, ordered, ")"))
  }
  levs_code <- p0(
    "c(",
    p0(vapply(levs, deparse, character(1)), collapse = ", "),
    ")"
  )
  values <- levs
  if (has_na) {
    values <- c(values, NA)
  }
  values_code <- p0(
    "c(",
    p0(
      vapply(
        values,
        function(z) if (is.na(z)) "NA" else deparse(z),
        character(1)
      ),
      collapse = ", "
    ),
    ")"
  )
  p0("factor(", values_code, ", levels = ", levs_code, ordered, ")")
}

generate_empty_code <- function(col) {
  if (inherits(col, "Date")) {
    return("as.Date(character(0))")
  }
  if (inherits(col, "POSIXct")) {
    return(p0("as.POSIXct(character(0), tz = ", deparse(generate_tz(col)), ")"))
  }
  switch(
    typeof(col),
    double = "numeric(0)",
    integer = "integer(0)",
    character = "character(0)",
    logical = "logical(0)",
    complex = "complex(0)",
    raw = "raw(0)",
    p0(class(col)[[1]], "(0)")
  )
}

generate_scalar_code <- function(val, has_na, col) {
  code <- generate_literal(val, col)
  if (has_na) {
    return(p0("c(", code, ", NA)"))
  }
  code
}

generate_range_code <- function(lower, upper, has_na, col) {
  parts <- c(generate_literal(lower, col), generate_literal(upper, col))
  if (has_na) {
    parts <- c(parts, "NA")
  }
  p0("c(", p0(parts, collapse = ", "), ")")
}

generate_literal <- function(val, col) {
  if (inherits(col, "Date")) {
    return(p0("as.Date(", deparse(format(val)), ")"))
  }
  if (inherits(col, "POSIXct")) {
    tz <- generate_tz(col)
    formatted <- format(val, "%Y-%m-%d %H:%M:%S", tz = tz)
    return(p0("as.POSIXct(", deparse(formatted), ", tz = ", deparse(tz), ")"))
  }
  if (is.double(val)) {
    # Use the shortest representation that round-trips, falling back to full
    # precision only when the default would change the value.
    code <- deparse(val)
    if (
      !identical(
        val,
        tryCatch(eval(parse(text = code)), error = function(e) NULL)
      )
    ) {
      code <- deparse(val, control = "digits17")
    }
    return(code)
  }
  deparse(val)
}

generate_tz <- function(col) {
  tz <- attr(col, "tzone")
  if (is.null(tz) || !length(tz)) {
    return("")
  }
  tz[[1]]
}
