#' Direct and indirect contributions to mineralizations
#'
#' @param usin The community in which we want to calculate mineralization rates.
#' @return A table of node effects on mineralization rates.
#' @details
#' The results are labeled as follows with direct contributions calculated from the full food web and indirect contributions calculated from the food web without that node. Indirect contributions do not include the direct contribution (i.e., it is subtracted).
#'
#'\describe{
#'   \item{DirectC}{The direct contribution to carbon mineralization.}
#'   \item{DirectN}{The direct contribution to nitrogen mineralization.}
#'   \item{IndirectC}{The indirect contribution to carbon mineralization.}
#'   \item{IndirectN}{The indirect contribution to nitrogen mineralization.}
#' }
#' The indirect contributions are calculated as the total mineralization of the community with the trophic species minus the trophic species direct mineralization minus the total mineralization without the trophic species all divided by the total mineralizaiton with the trophic species.
#'
#' @examples
#' # Basic example for the introductory community:
#' whomineralizes(intro_comm)
#' @export
whomineralizes <- function(usin){
  usin = checkcomm(usin, verbose = F)
  Nnodes = dim(usin$imat)[1]
  Nnames = usin$prop$ID

  res1 <- comana(usin)

  if(any(unname(usin$prop$ID) != names(res1$usin$prop$ID))){
    stop("Sorting of trophic levels not matching up")
  }

  output = data.frame(
    ID = unname(res1$usin$prop$ID),
    DirectC = res1$Cmin/sum(res1$Cmin),
    DirectN = rowSums(res1$Nminmat)/sum(res1$Nminmat),
    IndirectC = NA,
    IndirectN = NA)
  rownames(output) = NULL
  for(rmnode in Nnames){
    usinmod = removenodes(usin, rmnode)
    res2 = comana(usinmod)
    output[output$ID == rmnode, "IndirectC"] =
      (sum(res1$Cmin) - res1$Cmin[rmnode] - sum(res2$Cmin))/sum(res1$Cmin)

    output[output$ID == rmnode, "IndirectN"] =
      (sum(res1$Nminmat)- res1$Nmin[rmnode] - sum(res2$Nminmat))/sum(res1$Nminmat)
  }
  return(output)
}

