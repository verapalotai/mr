#' Function to add the appropriate suffix to a value in HUF
#'
#' @param x is the value in HUF we would like to add the Ft suffix to
#' @export
#' @importFrom scales dollar

forint <- function(x){
  dollar(x, prefix='', suffix=' Ft')
}
