//
//  FriendsListView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//
import SwiftUI
import SwiftData

struct FriendsListView: View {
  @Environment(\.modelContext)
  private var modelContext
  @Query(sort: \Friend.firstName)
  private var friends: [Friend]
  @State private var isPresented = false
  var body: some View {
    VStack(alignment: .leading) {
      NavigationStack {
        List {
          if friends.isEmpty {
            VStack {
              Spacer()
              Text(Constants.Friends.noFriendsYetPrompt)
                .font(.largeTitle)
                Divider()
              Text(Constants.Friends.addYourselfReminder)
                .font(.title)
              Spacer()
            }
          } else {
            // swiftlint:disable:next trailing_closure
            ForEach(friends) { friend in
              NavigationLink(value: friend) {
                FriendRowView(friend: friend)
                  .accessibilityIdentifier(friend.firstName + friend.lastName + "Row")
              }
            }
            .onDelete(perform: { indexSet in
              for offset in indexSet {
                let friend = friends[offset]
                modelContext.delete(friend)
              }
            })
          }
        }
        .navigationDestination(for: Friend.self) { friend in
          FriendDetailView(friend: friend)
        }

        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: { isPresented.toggle() }, label: {
              Image(systemName: Constants.Friends.addFriendsSystemImage)
            })
            .accessibilityIdentifier(Constants.Friends.addFriendButton)
          }
          ToolbarItem(placement: .navigationBarLeading) {
            Text(Constants.Friends.friendsListTitle)
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
