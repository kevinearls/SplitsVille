//
//  ExchangeRatesTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 03/05/2024.
//

import XCTest
@testable import SplitsVille


/*
  for: curl "https://api.currencyfreaks.com/v2.0/rates/latest?apikey=$CURRENCY_FREAKS_API_KEY&symbols=GBP,EUR,CHF,CAD,JPY,MXN,INR" | jq

  {
  "date": "2024-05-03 00:00:00+00",
  "base": "USD",
  "rates": {
  "CHF": "0.909835",
  "JPY": "153.0640314133071",
  "MXN": "16.979733333333332",
  "EUR": "0.9319709990078193",
  "GBP": "0.7974587918635101",
  "CAD": "1.3666883333333333",
  "INR": "83.41031742883256"
  }
  }
  */

final class ExchangeRatesTest: XCTestCase {
  let rates = [
    "CHF": "0.909835",
    "JPY": "153.0640314133071",
    "MXN": "16.979733333333332",
    "EUR": "0.9319709990078193",
    "GBP": "0.7974587918635101",
    "CAD": "1.3666883333333333",
    "INR": "83.41031742883256"
  ]
  // swiftlint:disable:next implicitly_unwrapped_optional
  var exchangeRates: ExchangeRates!

  override func setUpWithError() throws {
    exchangeRates = ExchangeRates(date: "2024-05-03 00:00:00+00", base: "USD", rates: rates)
  }

  func testGetRateSingle() throws {
    XCTAssertEqual(0.9319709990078193, try exchangeRates.getRateFromBase(for: "EUR"))
  }

  func testToFromNonUSD() throws {
    XCTAssertEqual(0.85, try exchangeRates.getRate(fromCurrency: "EUR", toCurrency: "GBP"), accuracy: 0.01)
  }

  func testToUSDollars() {
    XCTAssertEqual(1.07, try exchangeRates.getRate(fromCurrency: "EUR", toCurrency: "USD"), accuracy: 0.01)
  }

  func testCurrencyNotFoundErrorTest() {
    XCTAssertThrowsError(try exchangeRates.getRateFromBase(for: "XYZ"))
  }
}
