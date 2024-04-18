//
//  FriendsListView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

// TODO add space at top?
// TODO display a message if there are no users
import SwiftUI

struct FriendsListView: View {
  @EnvironmentObject var friendsStore: FriendStore
  @State private var isPresented = false
  var body: some View {
    VStack(alignment: .leading) {
      NavigationStack {
        List {
          ForEach(friendsStore.friends) { friend in
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
  }
}

#Preview {
  FriendsListView()
    .environmentObject(FriendStore())
}
