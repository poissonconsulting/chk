% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chk-not-any-na.R
\name{chk_not_any_na}
\alias{chk_not_any_na}
\alias{vld_not_any_na}
\title{Check Not Any Missing Values}
\usage{
chk_not_any_na(x, x_name = NULL)

vld_not_any_na(x)
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
Checks if not any missing values using

\code{!anyNA(x)}

\strong{Pass}: \code{1}, \code{1:2}, \code{"1"}, \code{logical(0)}.

\strong{Fail}: \code{NA}, \code{c(1, NA)}.
}
\section{Functions}{
\itemize{
\item \code{vld_not_any_na()}: Validate Not Any Missing Values

}}
\examples{
# chk_not_any_na
chk_not_any_na(1)
try(chk_not_any_na(NA))
# vld_not_any_na
vld_not_any_na(1)
vld_not_any_na(1:2)
vld_not_any_na(NA_real_)
vld_not_any_na(integer(0))
vld_not_any_na(c(NA, 1))
vld_not_any_na(TRUE)
}
\seealso{
For more details about the use of this function,
please read the article
\code{vignette("chk-families")}.

Other misc_checkers: 
\code{\link{chk_join}()},
\code{\link{chk_not_empty}()},
\code{\link{chk_unique}()}
}
\concept{misc_checkers}
