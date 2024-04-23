//
//  FriendRowView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI
import SwiftData

struct FriendRowView: View {
  var friend: Friend
  var body: some View {
    HStack {
      InitialsAvatar(friend: friend)
      Text(friend.lastName + ", " + friend.firstName + "  " + friend.currency)
        .font(.title2)
    }
  }
}

#Preview {
  let config = ModelConfiguration(isStoredInMemoryOnly: true)
  let container = try! ModelContainer(for: Friend.self, configurations: config)
  let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: "EUR")

  return FriendRowView(friend: fred)
    .modelContainer(container)
}
