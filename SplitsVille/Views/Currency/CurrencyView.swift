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
  @State var showAlert = false

  var body: some View {
    VStack {
      if let exchangeRates = exchangeRateStore.exchangeRates {
        Text("Todays' Exchange rates vs \(exchangeRates.base)")
          .font(.title)
        List {
          ForEach(exchangeRates.rates.keys.sorted(), id: \.self) { key in
            HStack {
              Text("\(key)")
                .font(.headline)
              Text("\(exchangeRates.rates[key] ?? "---")")
                .font(.headline)
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
