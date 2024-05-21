//
//  ContentView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 11/04/2024.
//

import SwiftUI

enum Tabs {
  case balances
  case friends
  case trips
  case currency
  case transactions
}

struct ContentView: View {
  @EnvironmentObject var exchangeRateStore: ExchangeRatesStore
  @State var downloadError: String = ""
  @State var isDownloading = false
  @State var showAlert = false
  @State var showDownloadFailedAlert = false
  @State var downloadCompleted = false
  @State private var selection: Tabs = .friends

  var body: some View {
    TabView(selection: $selection) {
      FriendsListView()
        .tabItem {
          Text(Constants.HomeScreen.friendsViewName)
          Image(systemName: Constants.HomeScreen.friendsViewImage)
        }
        .tag(Tabs.friends)

      TripsListView()
        .tabItem {
          Text(Constants.HomeScreen.tripsViewName)
          Image(systemName: Constants.HomeScreen.tripsViewImage)
        }
        .tag(Tabs.trips)

      TransactionsListView()
        .tabItem {
          Text(Constants.HomeScreen.transactionsViewName)
          Image(systemName: Constants.HomeScreen.transactionsViewImage)
        }
        .tag(Tabs.transactions)

      BalancesView()
        .tabItem {
          Text(Constants.HomeScreen.balancesViewName)
          Image(systemName: Constants.HomeScreen.balancesViewImage)
        }
        .tag(Tabs.balances)

      CurrencyView()
        .tabItem {
          Text(Constants.HomeScreen.currencyViewName)
          Image(systemName: Constants.HomeScreen.currencyViewImage)
        }
        .tag(Tabs.currency)
    }
    .onAppear {
      downloadExchangeRates()
    }
    .alert("Exchange rates download failed", isPresented: $showDownloadFailedAlert, actions: {
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

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return ContentView()
    .modelContainer(previewContainer)
    .environmentObject(ExchangeRatesStore())
}
