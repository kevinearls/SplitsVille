//
//  TripDetailView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 18/04/2024.
//

import SwiftUI

struct TripDetailView: View {
  var trip: Trip
  var body: some View {
    VStack {
      Text(trip.name)
        .font(.largeTitle)
      Text(trip.location)
        .font(.title)
    }
  }
}

#Preview {
  TripDetailView(trip: Trip(name: "Vacation", location: "Hawaii"))
}
