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
    Section {
      Group {
        HStack {
        // TODO put an icon or image here?
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
              Image(systemName: trip.friends.contains(friend) ? "checkmark.square" : "square")
                .foregroundColor(trip.friends.contains(friend) ? Color.secondary : Color.accentColor)  // FIXME colors?
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
    } header: {  // FIXME move this?
      HStack {
        Text("Click checkbox to add or delete friends")
        Spacer()
      }
    }
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return TripDetailView(trip: PreviewController.nightOutInBedrock)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return TripDetailView(trip: PreviewController.nightOutInBedrock)
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .modelContainer(previewContainer)
}
