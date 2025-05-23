% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chk-tz.R
\name{chk_tz}
\alias{chk_tz}
\alias{vld_tz}
\title{Check Time Zone}
\usage{
chk_tz(x, x_name = NULL)

vld_tz(x)
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
Checks if non-missing valid scalar timezone using

\code{is.character(x) && length(x) == 1L && !anyNA(x) && x \%in\% OlsonNames()}
}
\section{Functions}{
\itemize{
\item \code{vld_tz()}: Validate Time Zone

}}
\examples{
chk_tz("UTC")
try(chk_tz("TCU"))
vld_tz("UTC")
vld_tz("TCU")
}
\seealso{
\code{\link[=length]{length()}}

\code{\link[=OlsonNames]{OlsonNames()}}

\code{\link[=is.character]{is.character()}}

For more details about the use of this function,
please read the article
\code{vignette("chk-families")}.

Other scalar_checkers: 
\code{\link{chk_count}()},
\code{\link{chk_date}()},
\code{\link{chk_date_time}()},
\code{\link{chk_false}()},
\code{\link{chk_flag}()},
\code{\link{chk_lgl}()},
\code{\link{chk_scalar}()},
\code{\link{chk_string}()},
\code{\link{chk_true}()}
}
\concept{date_checkers}
\concept{scalar_checkers}
\concept{tz_checkers}
