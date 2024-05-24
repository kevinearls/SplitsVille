//
//  TripDetailView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 18/04/2024.
//

import SwiftUI
import SwiftData
struct TripDetailView: View {
  @Query(sort: \Friend.firstName)
  private var friends: [Friend]
  @State private var isPresented = false

  var trip: Trip
  var body: some View {
    Section {
      Group {
        HStack {
          VStack(alignment: .leading) {
            Text(trip.location)
              .font(.subheadline)
          }
          Spacer()
        }
      }
    } header: {
      HStack {
        Text(trip.name).font(.largeTitle)
        Spacer()
      }
    }
    Divider()
    Section {
      Group {
        List {
          ForEach(friends) { friend in
            HStack {
              Text("\(friend.firstName) \(friend.lastName)")
              Spacer()
              Image(systemName: trip.friends.contains(friend) ?
                Constants.Trips.onTripImage : Constants.Trips.notOnTripImage)
                .foregroundColor(trip.friends.contains(friend) ? Color.secondary : Color.accentColor)
                .onTapGesture {
                  if trip.friends.contains(friend) {
                    trip.removeFriend(friend: friend)
                  } else {
                    trip.addFriend(friend: friend)
                  }
                }
            }
          }
        }
      }
    } header: {
      HStack {
        Text(Constants.Trips.instructionsMessage)
        Spacer()
      }
    }
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return TripDetailView(trip: PreviewController.paris)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return TripDetailView(trip: PreviewController.paris)
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .modelContainer(previewContainer)
}
