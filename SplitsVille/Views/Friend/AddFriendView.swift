//
//  AddFriendView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddFriendView: View {
  @Environment(\.modelContext)
  private var modelContext
  @Binding var showModal: Bool
  @Query private var friends: [Friend]
  @State var firstName: String = ""
  @State var lastName: String = ""
  @State private var selectedCurrency: Currency = .USD
  @State private var avatarItem: PhotosPickerItem?
  @State private var avatarImageData: Data?

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
          Text("Add a friend")
            .font(.title3)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding()
          Spacer()
        }
        Section {
          Button("Add") {
            Task {
              if let imageData = try? await avatarItem?.loadTransferable(type: Data.self) {
                let newFriend = Friend(
                  firstName: firstName,
                  lastName: lastName,
                  currency: selectedCurrency.rawValue,
                  imageData: imageData
                )
                modelContext.insert(newFriend)
                showModal = false
              } else {
                print("Something failed...") // FIXME add a throw?
              }
            }
          }
          .padding()
        }
        .disabled(firstName.isEmpty || lastName.isEmpty || avatarItem == nil)
      }
      VStack {
        TextField("First Name:", text: $firstName)
          .padding()
        TextField("Last Name", text: $lastName, axis: .vertical)
          .padding()
        // TODO look into TextField with currency option!
        Picker("Currency", selection: $selectedCurrency) {
          ForEach(Currency.allCases) { option in
            Text(String(describing: option))
              .font(.largeTitle)
          }
        }
        .pickerStyle(.menu)
        Divider()
        PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)
      }
    }
  }
}

#Preview {
  let previewContainer = PreviewController.previewContainer
  return AddFriendView(showModal: .constant(true))
    .modelContainer(previewContainer)
}
