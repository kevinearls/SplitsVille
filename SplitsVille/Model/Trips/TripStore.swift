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
}
