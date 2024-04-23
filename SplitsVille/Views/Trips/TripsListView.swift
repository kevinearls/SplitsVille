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

  return TripsListView()
    .modelContainer(container)
}
