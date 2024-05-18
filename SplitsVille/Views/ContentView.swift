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
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return ContentView()
    .modelContainer(previewContainer)
    .environmentObject(ExchangeRatesStore())
}
