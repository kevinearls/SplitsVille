//
//  ExchangeRatesStore.swift
//  SplitsVille
//
//  Created by Kevin Earls on 03/05/2024.
//

import Foundation

enum CurrencyFreaksDownloadError: Error {
  case failedToCreateURL
  case failedToDownloadFromURL
  case jsonDecodingError
}

/*
  This uses the CurrencyFreaks API - see doc here: https://currencyfreaks.com

  There are a couple of limitations I ran into with the CurrencyFreaks API.
  Because I am using a free account, I can only get the current days rates
  and cannot specify a date.  In this application it would be ideal to
  use exchange rates for the day on which a transaction occurred, but I
  would have to get a paid account to do that.

  The free tier also only allows using USD as the base currency, so I
  have accounted for that in ExchangeRates.swift to handle situations
  like converting from EUR to GBP

  Finally I believe I have a 1000 request limit, which hopefully will
  be enough for this exercise.

  Also, the API doesn't appear to provide a way to send the APIKEY securely,
  so this just sends it in the clear.

  curl "https://api.currencyfreaks.com/v2.0/rates/latest?apikey=$CURRENCY_FREAKS_API_KEY&symbols=PKR,GBP,EUR,USD"
  https://api.currencyfreaks.com/v2.0/rates/latest?apikey=YOUR_APIKEY
  */

class ExchangeRatesStore: ObservableObject {
  // swiftlint:disable:next implicitly_unwrapped_optional
  @MainActor @Published var exchangeRates: ExchangeRates!

  private func getDataFromURL(from urlString: String) async throws -> Data {
    guard let url = URL(string: urlString) else {
      throw CurrencyFreaksDownloadError.failedToCreateURL
    }

    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfiguration)

    let (data, response) = try await session.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
      print(response)
      throw CurrencyFreaksDownloadError.failedToDownloadFromURL
    }

    return data
  }

  public func getExchangeRates() async throws {
    let supportedCurrencies = Currency.allCases
      .filter { $0 != Currency.USD }
      .map { $0.rawValue }
      .joined(separator: ",")
    let theUrl = Constants.CurrencyFreaks.baseURL +
      "?apikey=\(Constants.CurrencyFreaks.apiKey)&symbols=\(supportedCurrencies)"
    let data = try await getDataFromURL(from: theUrl)

    try await MainActor.run {
      do {
        exchangeRates = try JSONDecoder().decode(ExchangeRates.self, from: data)
      } catch {
        print(error)
        throw CurrencyFreaksDownloadError.jsonDecodingError
      }
    }
  }
}
