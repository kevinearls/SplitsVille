//
//  TripsListView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI
import SwiftData

struct TripsListView: View {
  @Query private var trips: [Trip]
  @State private var isPresented = false

  var body: some View {
    VStack(alignment: .leading) {
      NavigationStack {
        List {
          ForEach(trips) { trip in
            NavigationLink(value: trip) {
              TripRowView(trip: trip)
                .accessibilityIdentifier(trip.name)
            }
          }
        }
        .navigationDestination(for: Trip.self) { trip in
          TripDetailView(trip: trip)
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: { isPresented.toggle() }, label: {
              Image(systemName: "plus.circle.fill")
            })
          }
          ToolbarItem(placement: .navigationBarLeading) {
            Text("Trips").font(.largeTitle)
          }
        }
      }
      .sheet(isPresented: $isPresented) {
        AddTripView(showModal: $isPresented)
      }
    }
    .padding()
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return TripsListView()
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape") {
  let previewContainer = PreviewController.previewContainer
  return TripsListView()
    .preferredColorScheme(.dark)
    .modelContainer(previewContainer)
}
