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
  @State var showDownloadFailedAlert = false
  @State var downloadCompleted = false

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
        VStack {
          ProgressView("Downloading")
          Spacer()
        }
      }
    }
    .onAppear {
      downloadExchangeRates()  // FIXME should this be done when the program starts?
    }
    .alert("Download failed", isPresented: $showDownloadFailedAlert, actions: {
      Button("Dismiss", role: .cancel) {
        showDownloadFailedAlert = false
      }
    }, message: {
      Text(downloadError)
    })
  }

  func downloadExchangeRates() {
    if downloadCompleted {
      return
    }

    Task {
      do {
        isDownloading = true
        try await exchangeRateStore.getExchangeRates()
        isDownloading = false
        downloadCompleted = true
      } catch {
        print(error)
        isDownloading = false
        showDownloadFailedAlert = true
        downloadError = error.localizedDescription
      }
    }
  }
}

#Preview {
  CurrencyView()
    .environmentObject(ExchangeRatesStore())
}
