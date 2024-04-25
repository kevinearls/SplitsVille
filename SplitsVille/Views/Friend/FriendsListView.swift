//
//  FriendsListView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

// TODO add space at top?
// TODO display a message if there are no users
import SwiftUI
import SwiftData

struct FriendsListView: View {
  @Query private var friends: [Friend]
  @State private var isPresented = false
  var body: some View {
    VStack(alignment: .leading) {
      NavigationStack {
        List {
          ForEach(friends) { friend in
            NavigationLink(value: friend) {
              FriendRowView(friend: friend)
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
          }
          ToolbarItem(placement: .navigationBarLeading) {
            Text("Friends").font(.largeTitle)
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

#Preview("Dark, Landscape", body: {
  let previewContainer = PreviewController.previewContainer
  return FriendsListView()
    .preferredColorScheme(.dark)
    .modelContainer(previewContainer)
})
