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
  @Query(sort: \Friend.firstName)
  private var friends: [Friend]
  @Query(sort: \Trip.name)
  private var trips: [Trip]
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
          // Add debugging code here...
          showModal = false
        }
        .padding()
      }
      .disabled(desc.isEmpty || amount == 0)   // FIXME?
    }
    Form {
      Section(header: Text("Description")) {
        TextField("Description:", text: $desc)
      }
      Section(header: Text("Amount")) {
        TextField("Amount:", value: $amount, format: .number)
        Picker("Currency", selection: $selectedCurrency) {
          ForEach(Currency.allCases) { option in
            Text(String(describing: option))
              .font(.largeTitle)
          }
        }
        .pickerStyle(.menu)
      }
      Picker("Which trip?", selection: $selectedTrip) {
        ForEach(trips) { trip in
          Text(trip.name)
            .font(.largeTitle)
            .tag(Optional(trip))
        }
      }
      .pickerStyle(.menu)
      // FIXME: Figure out how to only show friends on this trip
      Picker("Who paid?", selection: $paidBy) {
        ForEach(friends) { friend in
          Text(friend.fullName)
            .font(.largeTitle)
            .tag(Optional(friend))
        }
      }
      .pickerStyle(.menu)
      // TODO remove
      //      if let paidBy {
      //        Text("PaidBy: \(paidBy.fullName)")
      //      } else {
      //        Text("PaidBy is nil")
      //      }
      //      if let selectedTrip {
      //        Text("Trip: \(selectedTrip.name)")
      //      } else {
      //        Text("Trip is nil")
      //      }
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
