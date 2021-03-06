% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prblty.R
\name{prblty}
\alias{prblty}
\title{prblty}
\usage{
prblty(link, p)
}
\arguments{
\item{link}{Link to a storm's specific strike probability advisory product.}

\item{p}{dplyr::progress_estimate.}
}
\value{
Dataframe
}
\description{
Parse strike probability products
}
\details{
Given a direct link to a strike probability advisory product, parse
and return dataframe of values.
}
\seealso{
\code{\link{get_prblty}}
}
\keyword{internal}
