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
  @State private var avatarImage: Image?

  var body: some View {
    Form {
      HStack {
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
                  firstName: firstName.trimmingCharacters(in: .whitespacesAndNewlines),
                  lastName: lastName.trimmingCharacters(in: .whitespacesAndNewlines),
                  currency: selectedCurrency.rawValue,
                  imageData: imageData
                )
                modelContext.insert(newFriend)
                showModal = false
              }
            }
          }
          .padding()
        }
        .disabled(firstName.isEmpty || lastName.isEmpty || avatarItem == nil)
      }
      VStack {
        TextField("First Name", text: $firstName)
          .padding()
        TextField("Last Name", text: $lastName, axis: .vertical)
          .padding()
        Picker("Currency", selection: $selectedCurrency) {
          ForEach(Currency.allCases) { option in
            Text(String(describing: option))
              .font(.largeTitle)
          }
        }
        .pickerStyle(.menu)
        Divider()
        PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)
        avatarImage?
          .resizable()
          .scaledToFit()
          .frame(width: 200, height: 200)
      }
      .onChange(of: avatarItem) {
        Task {
          if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
            avatarImage = loaded
          } else {
            print("Failed to download avatar image")
          }
        }
      }
    }
  }
}

#Preview {
  let previewContainer = PreviewController.previewContainer
  return AddFriendView(showModal: .constant(true))
    .modelContainer(previewContainer)
}
