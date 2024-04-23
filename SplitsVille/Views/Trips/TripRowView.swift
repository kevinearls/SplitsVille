//
//  TripRowView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 18/04/2024.
//

import SwiftUI
import SwiftData

struct TripRowView: View {
  var trip: Trip
  var body: some View {
    HStack {
      Text(trip.name)
        .font(.title2)
      Text(trip.location)
        .font(.title2)
      // TODO add friends...navigate to tipe detail?
    }
  }
}

#Preview {
  let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
  let container = try! ModelContainer(for: Friend.self, Trip.self, configurations: configuration)
  let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: "EUR")
  let barney = Friend(firstName: "Barney", lastName: "Rubble", currency: "GBP")

  let context = container.mainContext
  context.insert(fred)
  context.insert(barney)

  let trip = Trip(name: "Fabulous Vacation", location: "Hawaii")
  context.insert(trip)

  return TripRowView(trip: trip)
    .modelContainer(container)
}

