#' Bootstrap function for REM variance
#' 
#' Resamples camera trap data to calculate variance for Random Encounter Model density estimates. This function is called by remsD (see example, below).
#' 
#' @param dat = the data frame
#' @param tm = camera hours
#' @param v = distance travelled in 24 hours (km)
#' @keywords density, population, random encounter model, bootstrap
#' @export
#' @examples
#' 
#' bsD <- function(dat, tm, v){
#' bsDat <- dat[sample(1:nrow(dat), size = nrow(dat), replace = TRUE), ]
#' dOut <- rem(bsDat, tm, v)
#' return(dOut)
#' }
#' 
#' 
#' remsD <- lapply(grpDat, function(x){
#'  d <- replicate(nboots, bsD(dat, tm, v)) 
#'  return(d)
#' })


bsD <- function(dat, tm, v){
  bsDat <- dat[sample(1:nrow(dat), size = nrow(dat), replace = TRUE), ]
  dOut <- rem(bsDat, tm, v)
  return(dOut)
}
