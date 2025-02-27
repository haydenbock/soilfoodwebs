% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parameter_uncertainty.R
\name{parameter_uncertainty}
\alias{parameter_uncertainty}
\title{Parameter uncertainty returns community with new parameters drawn from a distribution of choice}
\usage{
parameter_uncertainty(
  usin,
  parameters = c("B"),
  replacetiny = 1e-06,
  distribution = "gamma",
  errormeasure = 0.2,
  errortype = "CV",
  fcntorun = "comana",
  replicates = 100,
  returnprops = F,
  returnresults = T,
  rejectnegconsump = T,
  correctstoich = T,
  verbose = T
)
}
\arguments{
\item{usin}{The community in which we want to calculate mineralization rates.}

\item{parameters}{A vector of parameters you want to vary.}

\item{replacetiny}{A number. All parameter draws less than this value are replaced with it to avoid numerical errors in the calculations. Set to zero if you want all values to be left as drawn. Default is 0.000001.}

\item{distribution}{A single string or matrix for the distribution from which to draw the parameters. If it is a matrix is has rownames of web nodes matching usin and column names matching parameters. The acceptable options are gamma, normal, uniform.}

\item{errormeasure}{A single value or matrix following the format of distribution recording the error. Value depends on errortype.}

\item{errortype}{A single value or matrix following the format of distribution recording the error type. This can be "CV" for coefficient of variation, "Variance" for the variance, and "Min" for the minimum value. The latter can only be used when the distribution is uniform.}

\item{fcntorun}{The function you want to run on the resulting communities and the result you want to return. Current options are comana, whomineralizes, CNsim, decompexpt. You can also include any of the outputs of comana or decompexpt to automatically subset the results to the vector of interest. For example, Cmin only returns carbon mineralization.}

\item{replicates}{The number of replicate communities you want to create and analyze.}

\item{returnprops}{Boolean. Do you want to return the communities with parameter values or just the results of the function? Only used if returnresults is TRUE.}

\item{returnresults}{Boolean. Do you want to return the results of the function? If this is FALSE, the fcntorun is ignored and a list of communities with parameter draws is returned.}

\item{rejectnegconsump}{Boolean. Should the draws reject communities with negative consumption rates?}

\item{correctstoich}{Boolean. Do you want to correct the stoichiometry of the community before running the fcntorun? This does NOT correct the community stoichiometry returned in communitylist, so the user can see the original result without the correction applied.}

\item{verbose}{Boolean. Do you want warning messages about the functionality?}
}
\value{
A list of the results. See details.
}
\description{
Parameter uncertainty returns community with new parameters drawn from a distribution of choice
}
\details{
The results are always in a list. If returnprops = T, then the top lay is a list of length 2 with resultslist and communitylist attributes, otherwise only resultslist is returned. The communitylist has the communities with parameter draws in order. The resultslist has the results of the function indicated in fcntorun.
}
\examples{
# Basic example for the introductory community:
parameter_uncertainty(intro_comm)
}
