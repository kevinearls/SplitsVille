//
//  FriendsListView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//
import SwiftUI
import SwiftData

struct FriendsListView: View {
  @Query private var friends: [Friend]
  @State private var isPresented = false
  var body: some View {
    VStack(alignment: .leading) {
      NavigationStack {
        List {
          if friends.isEmpty {
            VStack {
              Spacer()
              Text("There are no friends so far.  To add some, click on the + above")
                .font(.largeTitle)
              Spacer()
            }
          } else {
            ForEach(friends) { friend in
              NavigationLink(value: friend) {
                FriendRowView(friend: friend)
                  .accessibilityIdentifier(friend.firstName + friend.lastName + "Row")
              }
            }
          }
        }
        .navigationDestination(for: Friend.self) { friend in
          FriendDetailView(friend: friend)
        }

        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: { isPresented.toggle() }, label: {
              Image(systemName: "plus.circle.fill")
            })
            .accessibilityIdentifier(Constants.ButtonNames.addFriendButton)
          }
          ToolbarItem(placement: .navigationBarLeading) {
            Text("Friends")
              .font(.largeTitle)
              .accessibilityIdentifier("FriendsTitle")
          }
        }
      }
      .sheet(isPresented: $isPresented) {
        AddFriendView(showModal: $isPresented)
      }
    }
    .padding()
  }
}

#Preview("Light, Portrait", body: {
  let previewContainer = PreviewController.previewContainer
  return FriendsListView()
    .modelContainer(previewContainer)
})

#Preview("Light, Portrait, Empty", body: {
  let emptyContainer = PreviewController.emptyContainer
  return FriendsListView()
    .modelContainer(emptyContainer)
})

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return FriendsListView()
    .preferredColorScheme(.dark)
    .modelContainer(previewContainer)
}
