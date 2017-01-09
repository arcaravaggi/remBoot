#' Required for split_dat
#' 
#' Separate data into groups prior to bootstrapping. Called by split_dat.
#' 
#' @param df = the data frame
#' @param x = group (site), derived from df
#' @export
#' @examples 
#' 
#' grpDat_func <- function(df, x){
#' return(df[which(df[,1] == x), ])
#' }
#' 
#' split_dat <- function(.df) {
#'   lapply(unique(.df[[1]]), grpDat_func, df = .df)
#' }

grpDat_func <- function(df, x){
  return(df[which(df[,1] == x), ])
}