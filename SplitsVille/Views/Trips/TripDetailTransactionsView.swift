//
//  TripDetailTransactionsView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 01/05/2024.
//

import SwiftUI

struct TripDetailTransactionsView: View {
  var trip: Trip
  var body: some View {
    VStack(alignment: .leading) {
      Divider()
      NavigationStack {
        List {
          ForEach(trip.transactions) { transaction in
            NavigationLink(value: transaction) {
              TransactionRowView(transaction: transaction)
            }
          }
        }
        .navigationDestination(for: Transaction.self) { transaction in
          TransactionDetailView(transaction: transaction)
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Text("Transactions for \(trip.name)")
              .font(.headline)
          }
        }
      }
    }
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return TripDetailTransactionsView(trip: PreviewController.nightOutInBedrock)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return TripDetailTransactionsView(trip: PreviewController.nightOutInBedrock)
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .modelContainer(previewContainer)
}
