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
      // TODO add title, instructions
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

      Text(trip.name).font(.largeTitle)
    }
  }
}

#Preview {
  TripDetailView(trip: Trip(name: "Fabulous Vacation", location: "Hawaii"))
}
