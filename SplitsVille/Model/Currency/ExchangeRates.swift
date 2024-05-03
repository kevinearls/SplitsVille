//
//  ExchangeRates.swift
//  SplitsVille
//
//  Created by Kevin Earls on 03/05/2024.
//

import Foundation

struct ExchangeRates: Codable {
  var date: String
  var base: String
  var rates: [String: String]

  func getRateFromBase(for currency: String) -> Double {
    if let rate = rates[currency] {
      let doubleResult = Double(rate)
      if let doubleResult {
        return doubleResult
      }
      // TODO log or throw?
      return 0.0
    } else {
      // TODO log or throw?
      return 0.0
    }
  }

  /*
  The only rates we can get from CurrencyFreaks are based on US dollars.  In order to
  get the exchange rate from other currencies, for example, EUR to GBP, we need to
  do the following:
  - Divide 1.0 by the fromCurrencyRate
  - multiple that result by the toCurrencyRate

  if the toCurrency is the base, return 1.0/getRate(fromCurrency)

  if the fromCurrency == base, just return the rate from the other getRate function
  */
  func getRate(fromCurrency: String, toCurrency: String) -> Double {
    if fromCurrency == base {
      return getRateFromBase(for: fromCurrency)
    } else if toCurrency == base {
      return 1.0 / getRateFromBase(for: fromCurrency)
    } else {
      return 1.0 / getRateFromBase(for: fromCurrency) * getRateFromBase(for: toCurrency)
    }
  }
}
