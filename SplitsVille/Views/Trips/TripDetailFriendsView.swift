//
//  TripDetailFriendsView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 01/05/2024.
//

import SwiftUI

struct TripDetailFriendsView: View {
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
        Text(trip.name)
          .font(.largeTitle)
        Spacer()
      }
    }

    Divider()
    Section {
      NavigationStack {
        List {
          ForEach(trip.friends) { friend in
            NavigationLink(value: friend) {
              FriendRowView(friend: friend)
            }
            .navigationDestination(for: Friend.self) { friend in
              FriendDetailView(friend: friend)
            }
          }
        }
      }
    } header: {
      HStack {
        Text("Friends on this trip")
        Spacer()
      }
    }
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return TripDetailFriendsView(trip: PreviewController.nightOutInBedrock)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return TripDetailFriendsView(trip: PreviewController.nightOutInBedrock)
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .modelContainer(previewContainer)
}
