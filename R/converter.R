#' Function to get the price of one BTC in USD by hitting the Binance API'
#'
#' This function is using the \code{binance_coins_prices} function from the \code{binancer} package.
#' This is a wrapper around the \code{binancer} package.
#' @export
#' @param retried the number of retries previously done before the exponential backoff sleep
#' @importFrom  binancer binance_coins_prices
#' @import  data.table

get_bitcoin_price <- function(retried = 0) {
  tryCatch(
    btcusd <- binance_coins_prices()[symbol == 'BTC', usd],
    error = function(e){
      Sys.sleep(1 + retried^2)
      get_bitcoin_price(retried = retried + 1)
    }
  )
}
