% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chk-s4-class.R
\name{chk_s4_class}
\alias{chk_s4_class}
\alias{vld_s4_class}
\title{Check Inherits from S4 Class}
\usage{
chk_s4_class(x, class, x_name = NULL)

vld_s4_class(x, class)
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
Checks inherits from S4 class using

\code{isS4(x) && methods::is(x, class)}
}
\section{Functions}{
\itemize{
\item \code{vld_s4_class()}: Validate Inherits from S4 Class

}}
\examples{
# chk_s4_class
try(chk_s4_class(1, "numeric"))
chk_s4_class(getClass("MethodDefinition"), "classRepresentation")
# vld_s4_class
vld_s4_class(numeric(0), "numeric")
vld_s4_class(getClass("MethodDefinition"), "classRepresentation")
}
\seealso{
Other chk_is: 
\code{\link{chk_array}()},
\code{\link{chk_atomic}()},
\code{\link{chk_data}()},
\code{\link{chk_function}()},
\code{\link{chk_is}()},
\code{\link{chk_matrix}()},
\code{\link{chk_numeric}()},
\code{\link{chk_s3_class}()},
\code{\link{chk_vector}()},
\code{\link{chk_whole_numeric}()}
}
\concept{chk_is}
