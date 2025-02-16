% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utility_functions.R
\name{TLcheddar}
\alias{TLcheddar}
\title{Calculates the trophic level for each tropospecies}
\usage{
TLcheddar(W)
}
\arguments{
\item{W}{A matrix of trophic species. Rows eat columns.}
}
\value{
A vector of trophic level assignments. The base of the food chain is 0.
}
\description{
Calculates the trophic level for each tropospecies
}
\examples{
TLcheddar(intro_comm$imat)
}
