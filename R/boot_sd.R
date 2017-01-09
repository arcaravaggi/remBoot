#' Bootstrapping for Standard Deviations
#' 
#' Called my remsD. Note that tm and v must be the same across all sites. If this is not the case, split your data before bootstrapping and run the function on each sub-group
#' @export
#' @examples 
#' boot_sd <-  function(x){
#' d <- replicate(nboots, bsD(x, tm, v)) 
#' return(d)
#' }
#' 
#' remsD <- lapply(grpDat, boot_sd)


boot_sd <-  function(x){
  d <- replicate(nboots, bsD(x, tm, v)) 
  return(d)
}