//
//  ContentView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 11/04/2024.
//

import SwiftUI

enum Tabs {
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
          Text("Friends")
          Image(systemName: "person")
        }
        .tag(Tabs.friends)

      TripsListView()   // FIXME call everything groups or trips
        .tabItem {
          Text("Trips")
          Image(systemName: "person.3")
        }
        .tag(Tabs.trips)

      TransactionsListView()
        .tabItem {
          Text("Transactions")
          Image(systemName: "purchased")
        }
        .tag(Tabs.transactions)

      CurrencyView()
        .tabItem {
          Text("Currency")
          Image(systemName: "dollarsign.arrow.circlepath")  // TODO add constancts for all of this
        }
        .tag(Tabs.currency)
    }
  }
}

// TODO fix this?  For some reason this is crashing xcode, even though the app runs
#Preview("Light, Portrait") {
let previewContainer = PreviewController.previewContainer
  return ContentView()
    .modelContainer(previewContainer)
}
