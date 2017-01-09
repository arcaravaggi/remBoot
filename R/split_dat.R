#' Data splitting for grpDat
#' 
#' Separate data into groups prior to bootstrapping. Calls grpDat_func.
#' 
#' @param .df = the data frame
#' @export
#' @examples
#' 
#' split_dat <- function(.df) {
#'   lapply(unique(.df[[1]]), grpDat_func, df = .df)
#' }
#' 
#' grpDat <- split_dat(dat)


split_dat <- function(.df) {
  lapply(unique(.df[[1]]), grpDat_func, df = .df)
}