//
//  TripStore.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import Foundation

class TripStore: ObservableObject {
  @Published var trips: [Trip] = []

  public func addTrip(trip: Trip) {
    trips.append(trip)
  }

  // TODO: Add a test
  // TODO: is there a better way to do this?
  public func addFriendToTrip(friend newFriend: Friend, trip: Trip) {
    if let index = trips.firstIndex(where: { $0.id == trip.id }) {
      let existing = trip.friends

      var newTrip = Trip(name: trip.name, location: trip.location)
      for existingFriend in existing {
        newTrip.addFriend(friend: existingFriend)
      }
      newTrip.addFriend(friend: newFriend)
      trips[index] = newTrip
    }
  }
}
