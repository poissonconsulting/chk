err <- function (...) stop(..., call. = FALSE, domain = NA)

p0 <- function (..., collapse = NULL) 
  paste0(..., collapse = collapse)

p <- function (..., sep = " ", collapse = NULL) 
  paste(..., sep = sep, collapse = collapse)

cc <- function(x, con = ", ", bracket = "") {
  if(!length(x)) return(character(0))
  x <- p0(bracket, x, bracket)
  if(identical(length(x), 1L)) return(x)
  if(identical(length(x), 2L)) return(p(x, collapse = con))
  n <- length(x)
  p(c(p0(x[1:(n-1)], collapse = ", "), x[n]), collapse = con)
}

cc_and <- function(x) cc(x, con = " and ", bracket = "'")

cc_or <- function(x) cc(x, con = " or ", bracket = "'")
