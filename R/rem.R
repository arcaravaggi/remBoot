#' Random Encounter Model function
#' 
#' This function allows the automated calculation of animal densities.km2 using camera trap data and Random Encounter Modelling. 
#' 
#' The function assumes that the first 5 columns are: 
#' 1) site number
#' 2) camera number
#' 3) number of individuals in each capture
#' 4) distance to animal (in metres)
#' 5) angle of detection (in radians). 
#' 
#' For an example of how to use rem, click (\href{http://htmlpreview.github.io/?https://github.com/arcaravaggi/remBoot/blob/master/vignettes/remBoot.html}{here}).
#' 
#' @param dat = the data frame
#' @param tm = camera hours
#' @param v = distance travelled in 24 hours (km)
#' @keywords density, population, random encounter model
#' @export
#' @examples
#' 
#' Define tm and v:
#' 
#' tm <- 3600
#' v <- 1.4
#' 
#' For one survey site:
#' 
#' rem(remDat, tm, v)
#' 
#' For multiple survey sites, assuming tm and v are constant:
#' rem(dat = grpDat[[1]], tm, v)


rem <- function(dat, tm, v){
  # Calculate y: total captures
  y <- sum(dat[,3])
  # Calculate the first half of the equation above
  trm1 <- y/tm
  trm2 <- pi/((v*mean(dat[,4], 
                      na.rm = TRUE)) * (2 + (mean(dat[,5], 
                                                  na.rm = TRUE))))
  # Calculate D
  return(trm1 * trm2)
}