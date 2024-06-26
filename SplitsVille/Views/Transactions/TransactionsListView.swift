//
//  TransactionsListView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI
import SwiftData

struct TransactionsListView: View {
  @Environment(\.modelContext)
  private var modelContext
  @Query(sort: \Transaction.trip.name)
  private var transactions: [Transaction]
  @Query(sort: \Trip.name)
  private var trips: [Trip]

  // swiftlint:disable:next implicitly_unwrapped_optional
  @State private var selectedTrip: Trip!
  @State private var isPresented = false

  var body: some View {
    VStack(alignment: .leading) {
      NavigationStack {
        List {
          if transactions.isEmpty {
            VStack {
              Spacer()
              Text(Constants.Transactions.noTransactionsMessage)
                .font(.largeTitle)
              Spacer()
            }
          } else {
            Picker(Constants.Transactions.selectTripPrompt, selection: $selectedTrip) {
              ForEach(trips) { trip in
                Text(trip.name)
                  .font(.largeTitle)
                  .tag(Optional(trip))
              }
            }
            .pickerStyle(.menu)
            if let selectedTrip {
              ForEach(transactions.filter { $0.trip == selectedTrip }) { transaction in
                NavigationLink(value: transaction) {
                  TransactionRowView(transaction: transaction)
                }
              }
              .onDelete { indexSet in
                for offset in indexSet {
                  let transaction = transactions[offset]
                  modelContext.delete(transaction)
                }
              }
            }
          }
        }
        .navigationDestination(for: Transaction.self) { transaction in
          TransactionDetailView(transaction: transaction)
        }
        .onAppear {
          // This is required for the picker to work with Swift Data
          selectedTrip = trips.first
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: { isPresented.toggle() }, label: {
              Image(systemName: Constants.Transactions.addSystemImage)
            })
          }
          ToolbarItem(placement: .navigationBarLeading) {
            Text(Constants.Transactions.transactionsTitle)
              .font(.largeTitle)
          }
        }
        .sheet(isPresented: $isPresented) {
          AddTransactionView(showModal: $isPresented)
        }
      }
    }
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return TransactionsListView()
    .modelContainer(previewContainer)
}

#Preview("Light, Portrait, Empty") {
  let emptyContainer = PreviewController.emptyContainer
  return TransactionsListView()
    .modelContainer(emptyContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return TransactionsListView()
    .preferredColorScheme(.dark)
    .modelContainer(previewContainer)
}
