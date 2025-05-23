% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chk-missing.R
\name{chk_missing}
\alias{chk_missing}
\alias{vld_missing}
\title{Check Missing Argument}
\usage{
chk_missing(x, x_name = NULL)

vld_missing(x)
}
\arguments{
\item{x}{The object to check.}

\item{x_name}{A string of the name of object x or NULL.}
}
\value{
The \code{chk_} function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The \code{vld_} function returns a flag indicating whether the test was met.
}
\description{
Checks argument missing using

\code{missing(x)}
}
\details{
Currently only checks if value is available
(as opposed to whether it was specified).
}
\section{Functions}{
\itemize{
\item \code{vld_missing()}: Validate Missing Argument

}}
\examples{
# chk_missing
fun <- function(x) {
  chk_missing(x)
}
fun()
try(fun(1))
# vld_missing
fun <- function(x) {
  vld_missing(x)
}
fun()
fun(1)
}
\seealso{
\code{\link[=missing]{missing()}}

For more details about the use of this function,
please read the article
\code{vignette("chk-families")}.

Other missing_checkers: 
\code{\link{chk_function}()},
\code{\link{chk_not_missing}()}
}
\concept{missing_checkers}
