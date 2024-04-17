//
//  ContentView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 11/04/2024.
//

import SwiftUI

enum Tabs {
  case users
  case trips
  case currency
  case transactions
}

struct ContentView: View {
  @State private var selection: Tabs = .users

  var body: some View {
    TabView(selection: $selection) {
      UsersListView()
        .tabItem {
          Text("Users")
          Image(systemName: "person")
        }
        .tag(Tabs.users)

      TripsView()   // FIXME call everything groups or trips
        .tabItem {
          Text("Trips")
          Image(systemName: "person.3")
        }
        .tag(Tabs.trips)

      TransactionsView()
        .tabItem {
          Text("Transactions")
          Image(systemName: "person")  // TODO find a new image
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

#Preview {
  ContentView()
}
