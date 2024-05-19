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

  @Binding var showModal: Bool
  @Query private var friends: [Friend]
  @State var name: String = ""
  @State var location: String = ""
  @State private var startDate = Date.now
  @State private var endDate = Constants.Trips.oneWeekFromNow

  private func addTrip() {
    withAnimation {
      let newTrip = Trip(name: name, location: location, startDate: startDate, endDate: endDate)
      modelContext.insert(newTrip)
    }
  }

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
        Text("Add a Trip")
          .font(.title3)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .padding()
        Spacer()
      }
      Section {
        Button("Done") {
          let newTrip = Trip(name: name, location: location)
          modelContext.insert(newTrip)
          showModal = false
        }
        .padding()
      }
      .disabled(name.isEmpty || location.isEmpty)
    }
    Form {
      Section(header: Text("Trip Name")) {
        TextField("Name:", text: $name)
      }
      Section(header: Text("Trip Location")) {
        TextField("Location:", text: $location)
      }
      DatePicker(selection: $startDate, displayedComponents: .date) {
        Label("Start Date", systemImage: "calendar")
      }
      DatePicker(selection: $endDate, displayedComponents: .date) {
        Label("End Date", systemImage: "calendar")
      }
    }
  }
}

#Preview {
  let previewContainer = PreviewController.previewContainer
  return AddTripView(showModal: .constant(true))
    .modelContainer(previewContainer)
}
