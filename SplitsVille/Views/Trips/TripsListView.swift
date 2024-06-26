//
//  TripsListView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI
import SwiftData

struct TripsListView: View {
  @Environment(\.modelContext)
  private var modelContext

  @Query(sort: \Trip.name)
  private var trips: [Trip]

  @State private var isPresented = false
  // swiftlint:disable:next implicitly_unwrapped_optional
  @State private var tripToDelete: Trip!

  var body: some View {
    VStack(alignment: .leading) {
      NavigationStack {
        List {
          if trips.isEmpty {
            VStack {
              Spacer()
              Text(Constants.Trips.noTripsYetMessage)
                .font(.largeTitle)
              Spacer()
            }
          } else {
            VStack {
              Text(Constants.Trips.addFriendsReminder)
                .italic()
            }
            ForEach(trips) { trip in
              NavigationLink(value: trip) {
                TripRowView(trip: trip)
                  .accessibilityIdentifier(trip.name)
              }
            }
            .onDelete { indexSet in
              for offset in indexSet {
                let trip = trips[offset]
                modelContext.delete(trip)
              }
            }
          }
        }
        .navigationDestination(for: Trip.self) { trip in
          TripDetailView(trip: trip)
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: { isPresented.toggle() }, label: {
              Image(systemName: Constants.Trips.addTripsSystemImage)
            })
          }
          ToolbarItem(placement: .navigationBarLeading) {
            Text(Constants.Trips.tripsListTitle).font(.largeTitle)
          }
        }
      }
    }
    .sheet(isPresented: $isPresented) {
      AddTripView(showModal: $isPresented)
    }
    .padding()
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return TripsListView()
    .modelContainer(previewContainer)
}

#Preview("Light, Portrait, Empty") {
  let emptyContainer = PreviewController.emptyContainer
  return TripsListView()
    .modelContainer(emptyContainer)
}

#Preview("Dark, Landscape") {
  let previewContainer = PreviewController.previewContainer
  return TripsListView()
    .preferredColorScheme(.dark)
    .modelContainer(previewContainer)
}
