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
  let previewContainer = PreviewController.previewContainer
  return TripDetailView(trip: PreviewController.trip1)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return TripDetailView(trip: PreviewController.trip1)
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .modelContainer(previewContainer)
}
