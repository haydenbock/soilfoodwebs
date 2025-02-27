% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_descriptions.R
\docType{data}
\name{Koltz2018}
\alias{Koltz2018}
\title{The soil food web published for CPER}
\format{
A community with a feeding matrix and properties dataframe:
\describe{
  \item{imat}{The feeding matrix. Rows eat columns.}
  \item{prop}{The properties data frame containing node names (ID), assimilation efficiency (a), production efficiency(p), C:N ratio (CN), biomass (B), death rate (d), proportion of death cycled back to a detrital pool (DetritusRecycling), Booleans stating whether the node is detritus, plant, and can immobilize nitrogen, and a list of mutual predators. Biomass is in milligrams of carbon per square meter and turnover/death rate is in years.}
}
}
\source{
\url{http://link.springer.com/10.1007/s00300-017-2201-5}
}
\usage{
Koltz2018
}
\description{
The community contains 41 nodes in bacterial, fungal, and root energy channels. One node has zero biomass and is removed by the check_comm() function.
}
\keyword{datasets}
