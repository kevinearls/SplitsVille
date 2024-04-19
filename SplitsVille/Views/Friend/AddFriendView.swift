//
//  AddFriendView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI
import SwiftData

struct AddFriendView: View {
  @Environment(\.modelContext)
  private var modelContext

  @Binding var showModal: Bool
  @Query private var friends: [Friend]
  @State var firstName: String = ""
  @State var lastName: String = ""
  @State private var selectedCurrency: Constants.Currency = .USD

  var body: some View {
    Form {
      HStack {  // TODO move this into its own view?
        Section {
          Button("Cancel") {
            showModal = false
          }
          .padding()
          Spacer()
        }
        Section {
          Button("Add") {
            let newFriend = Friend(firstName: firstName, lastName: lastName, currency: selectedCurrency.rawValue)
            modelContext.insert(newFriend)
            showModal = false
          }
          .padding()
        }
        .disabled(firstName.isEmpty || lastName.isEmpty)
      }
      VStack {
        TextField("First Name:", text: $firstName)
          .padding()
        TextField("Last Name", text: $lastName, axis: .vertical)
          .padding()
        Picker("Currency", selection: $selectedCurrency) {
          ForEach(Constants.Currency.allCases) { option in
            Text(String(describing: option))
              .font(.largeTitle)
          }
        }
        .pickerStyle(.menu)
      }
    }
  }
}

#Preview {
  AddFriendView(showModal: .constant(true))
    .modelContainer(for: Friend.self)
}
