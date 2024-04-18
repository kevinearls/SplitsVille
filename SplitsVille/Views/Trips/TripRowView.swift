//
//  TripRowView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 18/04/2024.
//

import SwiftUI

struct TripRowView: View {
  var trip: Trip
  var body: some View {
    VStack {
      Text(trip.name)
        .font(.largeTitle)
      Text(trip.location)
        .font(.largeTitle)
    }
  }
}

#Preview {
  TripRowView(trip: Trip(name: "Vacation", location: "Hawaii"))
}
