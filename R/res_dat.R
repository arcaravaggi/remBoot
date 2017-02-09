#' Data splitting for grpSize
#' 
#' Use known row number to tell function how many data to resample in each iteration
#' 
#' @param .df = the data frame
#' @export
#' @examples 
#' 
#' res_dat <- function(.df) {
#' tapply(.df[,4], .df[,1], length)
#' }
#' 
#' grpSize <- res_dat(df)


res_dat <- function(.df) {
  tapply(.df[,3], .df[,1], length)
}
