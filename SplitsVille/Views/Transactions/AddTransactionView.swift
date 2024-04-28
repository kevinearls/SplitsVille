//
//  AddTransactionView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 28/04/2024.
//

import SwiftUI
import SwiftData

struct AddTransactionView: View {
  @Environment(\.modelContext)
  private var modelContext

  @Query private var friends: [Friend]
  @Query private var trips: [Trip]
  @Binding var showModal: Bool
  @State var desc: String = ""
  @State private var selectedCurrency: Currency = .USD
  @State private var amount: Decimal = 0.0
  @State private var paidBy: Friend!
  @State private var selectedTrip: Trip!

  var body: some View {
    HStack {
      Section {
        Button("Cancel") {
          showModal = false
        }
        .padding()
        Spacer()
      }
      Section {
        Button("Add") {
          let newTransaction = Transaction(
            currency: selectedCurrency.rawValue,
            amount: amount,
            payer: paidBy!,
            trip: selectedTrip!,
            desc: desc
          )
          modelContext.insert(newTransaction)
          showModal = false
        }
        .padding()
      }
      .disabled(desc.isEmpty || amount == 0 || paidBy == nil || selectedTrip == nil)
    }
    VStack {
      Text("Add a transaction").font(.headline)
      TextField("Description:", text: $desc)
        .padding()
      HStack {
        Spacer()
        Text("Amount:")
        TextField("Amount:", value: $amount, format: .number)
          .padding()
      }
      NavigationStack {
        List(friends, id: \.self, selection: $paidBy) { friend in
          Text("\(friend.firstName)")
        }
        .navigationTitle("Who paid for this?")
      }
      NavigationStack {
        List(trips, id: \.self, selection: $selectedTrip) { trip in
          Text("\(trip.name)")
        }
        .navigationTitle("Which Trip")
      }
    }
  }
}

#Preview {
  let previewContainer = PreviewController.previewContainer
  return AddTransactionView(showModal: .constant(true))
    .modelContainer(previewContainer)
}
