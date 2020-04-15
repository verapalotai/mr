#' Function to get the price of one BTC in USD'
#'
#' This function is using the \code{binance_coins_prices} function from the \code{binancer} package.
#'
#' @export

get_bitcoin_price <- function(retried = 0) {
  tryCatch(
    btcusd <- binance_coins_prices()[symbol == 'BTC', usd],
    error = function(e){
      Sys.sleep(1 + retried^2)
      get_bitcoin_price(retried = retried + 1)
    }
  )
}

#' Function to add the appropriate suffix to a value in HUF
#'
#' @param x is the value in HUF we would like to add the Ft suffix to
#'
#' @export

forint <- function(x){
  dollar(x, prefix='', suffix=' Ft')
}
