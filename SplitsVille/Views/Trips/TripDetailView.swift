//
//  TripDetailView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 18/04/2024.
//

import SwiftUI

// FIXME!  This is not updating the checkbox -- how did I fix this for TaskList?
struct TripDetailView: View {
  @EnvironmentObject var friendsStore: FriendStore
  @EnvironmentObject var tripStore: TripStore
  @State private var isPresented = false

  var trip: Trip
  var body: some View {
    VStack {
      // TODO add title, instructions
      List {
        ForEach(friendsStore.friends) { friend in
          HStack {
            Text("\(friend.firstName) \(friend.firstName)")
              .font(.title)
            Spacer()
            Spacer()
            Image(systemName: trip.friends.contains(friend) ? "checkmark.square" : "square")
              .foregroundColor(trip.friends.contains(friend) ? Color.green : Color.red)
              .onTapGesture {
                tripStore.addFriendToTrip(friend: friend, trip: trip)
              }
          }
        }
      }

      Text(trip.name).font(.largeTitle)
    }
  }
}

#Preview {
  let fred = Friend(firstName: "Fred", lastName: "Flintstone")
  let barney = Friend(firstName: "Barney", lastName: "Rubble")
  var fabulousTrip = Trip(name: "Fabulous Vacation", location: "Hawaii")
  fabulousTrip.addFriend(friend: fred)

  return TripDetailView(trip: fabulousTrip)
    .environmentObject({ () -> FriendStore in
      let friendStore = FriendStore()
      friendStore.addFriend(friend: fred)
      friendStore.addFriend(friend: barney)
      return friendStore
    }() )
    .environmentObject({ () -> TripStore in
      let tripStore = TripStore()
      tripStore.addTrip(trip: fabulousTrip)
      return tripStore
    }() )
}
