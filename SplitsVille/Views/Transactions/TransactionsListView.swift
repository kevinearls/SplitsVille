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

  @Query(sort: \Transaction.trip.name)  // TODO can we do more than 1 sort here?  
  private var transactions: [Transaction]
  @State private var isPresented = false

  var body: some View {
    VStack(alignment: .leading) {
      NavigationStack {
        List {
          if transactions.isEmpty {
            VStack {
              Spacer()
              Text("There are no transactions so far.  To add some, click on the + above")
                .font(.largeTitle)
              Spacer()
            }
          } else {
            ForEach(transactions) { transaction in
              NavigationLink(value: transaction) {
                TransactionRowView(transaction: transaction)
              }
            }
            .onDelete(perform: { indexSet in
              for offset in indexSet {
                let transaction = transactions[offset]
                modelContext.delete(transaction)
              }
            })
          }
        }
        .navigationDestination(for: Transaction.self) { transaction in
          TransactionDetailView(transaction: transaction)
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: { isPresented.toggle() }, label: {
              Image(systemName: "plus.circle.fill")
            })
          }
          ToolbarItem(placement: .navigationBarLeading) {
            Text("Transactions")
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
