//
//  AddFriendView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI

struct AddFriendView: View {
  @Binding var showModal: Bool
  @EnvironmentObject var friendStore: FriendStore
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
            let newFriend = Friend(firstName: firstName, lastName: lastName)
            friendStore.addFriend(friend: newFriend)
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
  AddFriendView(showModal: .constant(true))
    .environmentObject(FriendStore())
}
