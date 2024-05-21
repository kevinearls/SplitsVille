//
//  BalancesView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 18/05/2024.
//

import SwiftUI
import SwiftData

struct BalancesView: View {
  // swiftlint:disable:next implicitly_unwrapped_optional
  @State private var selectedTrip: Trip!
  @Query(sort: \Transaction.paidBy.firstName)
  private var transactions: [Transaction]

  @Query(sort: \Trip.name)
  private var trips: [Trip]

  var body: some View {
    VStack(alignment: .leading) {
      List {
        if transactions.isEmpty {
          VStack {
            Spacer()
            Text("There are no transactions so far.  To add some, click on the + above")
              .font(.largeTitle)
            Spacer()
          }
        } else {
          Picker("Which trip?", selection: $selectedTrip) {
            ForEach(trips) { trip in
              Text(trip.name)
                .font(.largeTitle)
                .tag(Optional(trip))
            }
          }
          .pickerStyle(.menu)
          if let selectedTrip {
            let balances = BalanceCalculator().calculateBalances(trip: selectedTrip, transactions: transactions)

            ForEach(selectedTrip.friends) { friend in
              Text("\(friend.firstName)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
              let balance = balances[friend]
              if let balance {
                Text(formatBalance(balance: balance))
                  .font(.subheadline)
              }
            }
          }
        }
      }
      .onAppear {
        // This is required for the picker to work with Swift Data
        selectedTrip = trips.first
      }
    }
  }

  func formatBalance(balance: Balance) -> String {
    var result = """
    """
    for entry in balance.entries {
      result += "owes \(entry.friend.firstName) \(entry.amount.toTwoDecimalPlaces) \(entry.friend.currency)\n"
    }

    return result
  }
}

#Preview {
  let previewContainer = PreviewController.previewContainer
  return BalancesView()
    .modelContainer(previewContainer)
}
