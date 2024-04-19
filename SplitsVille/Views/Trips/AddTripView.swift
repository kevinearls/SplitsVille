//
//  AddTripView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 18/04/2024.
//

import SwiftUI
import SwiftData

struct AddTripView: View {
  @Environment(\.modelContext)
  private var modelContext

  @Query private var friends: [Friend]
  @Binding var showModal: Bool
  @State var name: String = ""
  @State var location: String = ""
  var body: some View {
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
          let newTrip = Trip(name: name, location: location)
          modelContext.insert(newTrip)
          showModal = false
        }
        .padding()
      }
      .disabled(name.isEmpty || location.isEmpty)
    }
    VStack {
      TextField("Name:", text: $name)
        .padding()
      TextField("Location", text: $location, axis: .vertical)
        .padding()
    }
  }
}


#Preview {
  AddTripView(showModal: .constant(true))
    .modelContainer(for: Trip.self)
}
