% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chk-is.R
\name{chk_is}
\alias{chk_is}
\alias{vld_is}
\title{Check Class}
\usage{
chk_is(x, class, x_name = NULL)

vld_is(x, class)
}
\arguments{
\item{x}{The object to check.}

\item{class}{A string specifying the class.}

\item{x_name}{A string of the name of object x or NULL.}
}
\value{
The \code{chk_} function throws an informative error if the test fails or
returns the original object if successful so it can used in pipes.

The \code{vld_} function returns a flag indicating whether the test was met.
}
\description{
Checks inherits from class using

\code{inherits(x, class)}
}
\section{Functions}{
\itemize{
\item \code{vld_is()}: Validate Inherits from Class

}}
\examples{
chk_is(1, "numeric")
try(chk_is(1L, "double"))

# vld_is
vld_is(numeric(0), "numeric")
vld_is(1L, "double")
}
\seealso{
Other chk_is: 
\code{\link{chk_array}()},
\code{\link{chk_atomic}()},
\code{\link{chk_data}()},
\code{\link{chk_function}()},
\code{\link{chk_matrix}()},
\code{\link{chk_numeric}()},
\code{\link{chk_s3_class}()},
\code{\link{chk_s4_class}()},
\code{\link{chk_vector}()},
\code{\link{chk_whole_numeric}()}
}
\concept{chk_is}
