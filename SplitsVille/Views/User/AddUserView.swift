//
//  AddUser.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI

struct AddUserView: View {
  @Binding var showModal: Bool
  @EnvironmentObject var userStore: UsersStore
  @State var firstName: String = ""
  @State var lastName: String = ""

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
            let newUser = User(firstName: firstName, lastName: lastName)
            userStore.addUser(user: newUser)
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
      }
    }
  }
}

#Preview {
  AddUserView(showModal: .constant(true))
    .environmentObject(UsersStore())
}
