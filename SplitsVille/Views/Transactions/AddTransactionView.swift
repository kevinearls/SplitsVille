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
  // swiftlint:disable:next implicitly_unwrapped_optional
  @State private var paidBy: Friend!
  // swiftlint:disable:next implicitly_unwrapped_optional
  @State private var selectedTrip: Trip!

  var body: some View {
    HStack {
      Section {
        Button("Dismiss") {
          showModal = false
        }
        .padding()
        Spacer()
      }
      Section {
        Text("Add a transaction")
          .font(.headline)
          .padding()
        Spacer()
      }
      Section {
        Button("Add") {
          if let paidBy = paidBy, let selectedTrip = selectedTrip {
            let newTransaction = Transaction(
              currency: selectedCurrency.rawValue,
              amount: amount,
              payer: paidBy,
              trip: selectedTrip,
              desc: desc
            )
            modelContext.insert(newTransaction)
          }
          showModal = false
        }
        .padding()
      }
      .disabled(desc.isEmpty || amount == 0 || paidBy == nil || selectedTrip == nil)
    }
    Form {
      Section(header: Text("Description")) {
        TextField("Description:", text: $desc)
      }
      Section(header: Text("Amount")) {
        TextField("Amount:", value: $amount, format: .number)
      }
      // FIXME: Figure out how to only show friends on this trip
      NavigationStack {
        List(trips, id: \.self, selection: $selectedTrip) { trip in
          Text("\(trip.name)")
            .font(.headline)
        }
        .navigationTitle("Select a Trip")
      }
      if selectedTrip != nil {
        NavigationStack {
          List(friends, id: \.self, selection: $paidBy) { friend in  // TODO do I need id?
            // if selectedTrip.friends.contains(friend) { // TODO get this to work as a filter
            Text("\(friend.firstName)")
            // }
          }
          .navigationTitle("Select the person who paid")
        }
      }
    }
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return AddTransactionView(showModal: .constant(true))
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return AddTransactionView(showModal: .constant(true))
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .modelContainer(previewContainer)
}
