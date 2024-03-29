% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chk-flag.R
\name{chk_flag}
\alias{chk_flag}
\alias{vld_flag}
\title{Check Flag}
\usage{
chk_flag(x, x_name = NULL)

vld_flag(x)
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
Checks if non-missing logical scalar using

\code{is.logical(x) && length(x) == 1L && !anyNA(x)}

\strong{Pass}: \code{TRUE}, \code{FALSE}.

\strong{Fail}: \code{logical(0)}, \code{c(TRUE, TRUE)}, \code{"TRUE"}, \code{1}, \code{NA}.
}
\section{Functions}{
\itemize{
\item \code{vld_flag()}: Validate Flag

}}
\examples{
# chk_flag
chk_flag(TRUE)
try(vld_flag(1))
# vld_flag
vld_flag(TRUE)
vld_flag(1)
}
\seealso{
Other chk_logical: 
\code{\link{chk_false}()},
\code{\link{chk_lgl}()},
\code{\link{chk_true}()}
}
\concept{chk_logical}
