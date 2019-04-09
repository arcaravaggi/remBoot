#' Random Encounter Model bootstrapping for error terms
#' 
#' Preliminary update 17th August 2018
#' remBoot is being incorporated into the RandEM package
#' 
#' The function assumes that the first 4 columns of the dataset contain: 
#' 1) An identifying number for each survey location (e.g. 1, 2, 3)
#' 2) The number of individuals of the focal species observed in each capture
#' 3) The radial distance to the detected animal in each capture, given in metres
#' 4) The angle of detection based on the location of the detected animal in each capture, given in radians
#' 
#'  
#' @param .df (data frame)
#' @param tm (numeric) The total number of hours all cameras were left in-situ at a focal site
#' @param v (numeric) The distance travelled by the focal species in 24 hours, in kilometres
#' @param nboots (numeric) The number of bootstrap iterations
#' @param error_stat (text) Variance, given as 95% confidence intervals (ci), 95% quantiles (quant), standard error (se) or standard deviation (sd)
#' @keywords density, population, random encounter model, bootstrap
#' @export
#' @examples
#' ## Define tm, v and nboots and pass the values to the function:
#' 
#' data(hDat)  
#' 
#' tm <- 1800
#' v <- 0.89
#' nboots <- 1000
#' 
#' output <- remBoot(hDat, tm, v, nboots, error_stat = c("sd"))
#' 
#' ## Alternatively, pass the values to the function, directly:
#' 
#' output <- remBoot(hDat, tm = 1800, v = 0.89, nboots = 1000, error_stat = c("ci"))



remBoot <- function(.df, tm, v, nboots, error_stat){
  ## Written by Kevin Keenan 2013 and Anthony Caravaggi 2016
  ## distributed under GPL3
  bsD <- function(dat, tm, v){
    bsDat <- dat[sample(1:nrow(dat), size = nrow(dat), replace = TRUE), ]
    dOut <- rem(bsDat, tm, v)
    return(dOut)
  }
  grpDat_func <- function(df, x){
    return(df[which(df[,1] == x), ])
  }
  
  split_dat <- function(.df) {
    lapply(unique(.df[[1]]), grpDat_func, df = .df)
  }
  rem <- function(dat, tm, v){
    # Calculate y: total captures
    y <- sum(dat[,2])
    # Calculate the first half of the equation above
    trm1 <- y/tm
    trm2 <- pi/((v*mean(dat[,3], 
                        na.rm = TRUE)) * (2 + (mean(dat[,4], 
                                                    na.rm = TRUE))))
    # Calculate D
    return(trm1 * trm2)
  }
  grpDat <- split_dat(.df)
  remsD <- lapply(grpDat, function(x){
    d <- replicate(nboots, bsD(x, tm, v)) 
    return(d)
  })
  res <- list()
  if(is.element("sd", error_stat)){
    resSD <- lapply(remsD, sd)
    names(resSD) <- levels(.df[[1]])
    res$sd <- c(res, resSD)
  }
  if(is.element("se", error_stat)){
    resSE <- mapply("/",lapply(remsD, sd),lapply(grpDat, function(x) sqrt(nrow(x))),SIMPLIFY = FALSE)
    names(resSE) <- levels(.df[[1]])
    res$se <- c(res, resSE)
  }
  if(is.element("ci", error_stat)){ #quantiles replaced with CI function
    require(Rmisc)
    resCI <- as.data.frame(t(sapply(remsD, CI, ci = 0.95)))
    resCI$mean <- NULL
    rownames(resCI) <- levels(.df[[1]])
    res$ci <- resCI
  }
  if(is.element("quant", error_stat)){
    resCI <- t(sapply(remsD, quantile, probs = c(0.025, 0.975)))
    colnames(resCI) <- c("Lower", "Upper")
    rownames(resCI) <- levels(.df[[1]])
    res$ci <- resCI
  }
  return(res)
}
