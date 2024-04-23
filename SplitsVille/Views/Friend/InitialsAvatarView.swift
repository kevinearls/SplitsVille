//
//  AvatarView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI
import SwiftData

struct InitialsAvatar: View {
  let friend: Friend

  var body: some View {
    HStack {
      ZStack {
        Circle()
          .foregroundColor(Color(friend.avatarColor))
          .frame(width: Constants.InitialsAvatar.frameWidth, height: Constants.InitialsAvatar.frameHeight)

        Text(friend.initials)
          .foregroundStyle(.white)
          .font(.system(size: Constants.InitialsAvatar.initialsSize))
      }
    }
  }
}

#Preview("Light, Portrait") {
  let config = ModelConfiguration(isStoredInMemoryOnly: true)
  let container = try! ModelContainer(for: Friend.self, configurations: config)
  let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: "EUR")

  return InitialsAvatar(friend: fred)
    .modelContainer(container)
}

#Preview("Dark, Landscape", traits: .landscapeLeft, body: {
  let config = ModelConfiguration(isStoredInMemoryOnly: true)
  let container = try! ModelContainer(for: Friend.self, configurations: config)
  let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: "EUR")

  return InitialsAvatar(friend: fred)
    .preferredColorScheme(.dark)
    .modelContainer(container)
})
