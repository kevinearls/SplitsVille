//
//  TransactionsListView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI
import SwiftData

struct TransactionsListView: View {
  @Query(sort: \Transaction.trip.name)
  private var transactions: [Transaction]
  @Query private var trips: [Trip]
  @State private var selectedTrip: Trip!
  
  private var transactionsForThisTrip: [Transaction] {
    var transactionsToShow = transactions
    if selectedTrip != nil {
      transactionsToShow = transactionsToShow.filter {
        $0.trip == selectedTrip
      }
    }
    return transactionsToShow
  }
  @State private var isPresented = false
  
  var body: some View {
    VStack(alignment: .leading) {
      NavigationStack {
        List(trips, id: \.self, selection: $selectedTrip) { trip in
          Text("\(trip.name)")
        }
        .navigationTitle("Which Trip?")
        // FIXME why is there so much wasted space here?
      }
      
      NavigationStack {
        List {
          ForEach(transactionsForThisTrip) { transaction in
            NavigationLink(value: transaction) {
              TransactionRowView(transaction: transaction)
            }
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

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return TransactionsListView()
    .preferredColorScheme(.dark)
    .modelContainer(previewContainer)
}
