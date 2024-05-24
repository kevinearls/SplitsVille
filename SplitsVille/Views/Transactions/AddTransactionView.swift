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
  @State private var amount: Double = 0.0
  // swiftlint:disable:next implicitly_unwrapped_optional
  @State private var paidBy: Friend!
  // swiftlint:disable:next implicitly_unwrapped_optional
  @State private var selectedTrip: Trip!

  var body: some View {
    HStack {
      Section {
        Button(Constants.Transactions.dismissPrompt) {
          showModal = false
        }
        .padding()
        Spacer()
      }
      Section {
        Text(Constants.Transactions.addTitle)
          .font(.headline)
          .padding()
        Spacer()
      }
      Section {
        Button(Constants.Transactions.addButtonText) {
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
      .disabled(desc.isEmpty || amount == 0)
    }
    Form {
      Section {
        TextField(Constants.Transactions.descriptionPrompt, text: $desc)
      } header: {
        Text(Constants.Transactions.descriptionTitle)
      }
      Section(header: Text(Constants.Transactions.amountHeader)) {
        TextField(Constants.Transactions.amountPrompt, value: $amount, format: .number)
        Picker(Constants.Transactions.currencyPickerLabel, selection: $selectedCurrency) {
          ForEach(Currency.allCases) { option in
            Text(String(describing: option))
              .font(.largeTitle)
          }
        }
        .pickerStyle(.menu)
      }
      Picker(Constants.Transactions.selectTripPrompt, selection: $selectedTrip) {
        ForEach(trips) { trip in
          Text(trip.name)
            .font(.largeTitle)
            .tag(Optional(trip))
        }
      }
      .pickerStyle(.menu)
      if selectedTrip != nil {
        Picker(Constants.Transactions.selectPaidByPrompt, selection: $paidBy) {
          ForEach(friends.filter { selectedTrip.friends.contains($0) }) { friend in
            Text(friend.fullName)
              .font(.largeTitle)
              .tag(Optional(friend))
          }
        }
        .pickerStyle(.menu)
      }
    }
    .onAppear {
      // This is required to get the Pickers to work correctly with SwiftData
      paidBy = friends.first
      selectedTrip = trips.first
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
