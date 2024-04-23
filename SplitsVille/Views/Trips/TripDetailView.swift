//
//  TripDetailView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 18/04/2024.
//

import SwiftUI
import SwiftData

struct TripDetailView: View {
  @Query private var friends: [Friend]
  @State private var isPresented = false

  var trip: Trip
  var body: some View {
    VStack {
      Text(trip.name).font(.largeTitle)
      Text(trip.location)
        .font(.subheadline)
      List {
        ForEach(friends) { friend in
          HStack {
            Text("\(friend.firstName) \(friend.lastName)")
              .font(.title)
            Spacer()
            Spacer()
            Image(systemName: trip.friends.contains(friend) ? "checkmark.square" : "square")
              .foregroundColor(trip.friends.contains(friend) ? Color.green : Color.red)
              .onTapGesture {
                trip.addFriend(friend: friend)
              }
          }
        }
      }
    }
    .padding()
  }
}

#Preview("Light, Portrait") {
  let config = ModelConfiguration(isStoredInMemoryOnly: true)
  let container = try! ModelContainer(for: Friend.self, Trip.self, configurations: config)
  let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: "EUR")
  let barney = Friend(firstName: "Barney", lastName: "Rubble", currency: "GBP")

  let context = container.mainContext
  context.insert(fred)
  context.insert(barney)

  let trip = Trip(name: "Fabulous Vacation", location: "Hawaii")
  context.insert(trip)


  return TripDetailView(trip: trip)
    .modelContainer(container)
}

// #Preview("Dark, Landscape", traits: .landscapeLeft, body: {
//   let config = ModelConfiguration(isStoredInMemoryOnly: true)
//   let container = try! ModelContainer(for: Friend.self, configurations: config)
//   let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: "EUR")
//
//   return InitialsAvatar(friend: fred)
//     .preferredColorScheme(.dark)
//     .modelContainer(container)
// })
