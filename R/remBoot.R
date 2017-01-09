#' Random Encounter Model bootstrapping function
#' 
#' This function allows the automated calculation of variance for animal densities estimates derived from Random Encounter Modelling. 
#' 
#' @param df = the data frame
#' @param tm = camera hours
#' @param v = distance travelled in 24 hours (km)
#' @param nboots = number of bootstrap iterations
#' @param error_stat = confidence intervals (ci) or standard deviation (sd)
#' @keywords density, population, random encounter model, bootstrap
#' @export
#' @examples
#' output <- remBoot(remDat, tm, v, nboots, error_stat = c("sd"))


remBoot <- function(.df, tm, v, nboots, error_stat){
    ## Written by Kevin Keenan 2013 and Anthony Caravaggi 2016
    ## distributed under GPL3
    grpDat <- split_dat(.df)
    grpSize <- res_dat(.df)
    remsD <- lapply(grpDat, boot_sd)
    res <- list()
    if(is.element("sd", error_stat)){
      resSD <- lapply(remsD, sd)
      names(resSD) <- levels(.df[[1]])
      res$sd <- c(res, resSD)
    }
    if(is.element("ci", error_stat)){
      resCI <- t(sapply(remsD, quantile, probs = c(0.025, 0.975)))
      colnames(resCI) <- c("Lower", "Upper")
      rownames(resCI) <- levels(.df[[1]])
      res$ci <- resCI
    }
    return(res)
}