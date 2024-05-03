//
//  CurrencyView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI

struct CurrencyView: View {
  @EnvironmentObject var exchangeRateStore: ExchangeRatesStore
  @State var downloadError: String = ""
  @State var isDownloading = false

  var body: some View {
    VStack {
      if let rates = exchangeRateStore.exchangeRates {
        Text("Todays' Exchange rates vs \(rates.base)")
          .font(.title)
        List {
          ForEach(Currency.allCases) { currency in
            HStack {
              Text("\(currency.rawValue)")
                .font(.headline)
              Text("\(rates.getRateFromBase(for: currency.rawValue))")
            }
          }
        }
      } else {
        Text("Waiting to load exchange rates...")
      }
    }
    .onAppear {
      downloadExchangeRates()  // FIXME should this be done when the program starts?
    }
  }

  func downloadExchangeRates() {
    Task {
      do {
        isDownloading = true
        try await exchangeRateStore.getExchangeRates()
        isDownloading = false
      } catch {
        print(error)
        isDownloading = false
      }
    }
  }
}

#Preview {
  CurrencyView()
    .environmentObject(ExchangeRatesStore())
}
