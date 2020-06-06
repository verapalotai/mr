#' Function to query historical exchange rates for any currency for the given number of days in the past
#'
#' @param base is the currency we want to convert
#' @param symbol is the currency to which we want to convert the base currency
#' @param days is the number of days to retroactively query the exchange rates
#' @export
#' @import httr
#' @import data.table

convert_currency <- function(base, symbol, days){
  response <- GET(
    'https://api.exchangeratesapi.io/history',
    query = list(
      start_at = Sys.Date() - days,
      end_at   = Sys.Date(),
      base     = base,
      symbols  = symbol
    ))

  exchange_rates <- content(response)
  exchange_rates <- exchange_rates$rates

  historical_exchange_rates <- data.table(
    date = as.Date(names(exchange_rates)),
    rate = as.numeric(unlist(exchange_rates)))

  setorder(historical_exchange_rates, date)

  return(historical_exchange_rates)
}
