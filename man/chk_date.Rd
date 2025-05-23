% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chk-date.R
\name{chk_date}
\alias{chk_date}
\alias{vld_date}
\title{Check Date}
\usage{
chk_date(x, x_name = NULL)

vld_date(x)
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
Checks non-missing Date scalar using

\code{inherits(x, "Date") && length(x) == 1L && !anyNA(x)}
}
\section{Functions}{
\itemize{
\item \code{vld_date()}: Validate Date

}}
\examples{
# chk_date
chk_date(Sys.Date())
try(chk_date(1))
# vld_date
vld_date(Sys.Date())
vld_date(Sys.time())
vld_date(1)
}
\seealso{
\code{\link[=inherits]{inherits()}}

\code{\link[=length]{length()}}

For more details about the use of this function,
please read the article
\code{vignette("chk-families")}.

Other scalar_checkers: 
\code{\link{chk_count}()},
\code{\link{chk_date_time}()},
\code{\link{chk_false}()},
\code{\link{chk_flag}()},
\code{\link{chk_lgl}()},
\code{\link{chk_scalar}()},
\code{\link{chk_string}()},
\code{\link{chk_true}()},
\code{\link{chk_tz}()}

Other datetime_checkers: 
\code{\link{chk_date_time}()}
}
\concept{datetime_checkers}
\concept{scalar_checkers}
