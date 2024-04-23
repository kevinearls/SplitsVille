//
//  FriendDetailView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI
import SwiftData

struct FriendDetailView: View {
  var friend: Friend
  var body: some View {
    VStack {
      Text(friend.lastName + ", " + friend.firstName).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
      InitialsAvatar(friend: friend)
    }
  }
}

#Preview {
  let config = ModelConfiguration(isStoredInMemoryOnly: true)
  let container = try! ModelContainer(for: Friend.self, configurations: config)
  let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: "EUR")

  let context = container.mainContext
  context.insert(fred)

  return FriendDetailView(friend: fred)
    .modelContainer(container)
}
