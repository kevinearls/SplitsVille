//
//  AvatarView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI

struct InitialsAvatar: View {
  let friend: Friend

  var body: some View {
    HStack {
      ZStack {
        Circle()
          .foregroundColor(Color(friend.avatarColor))
          .frame(width: 100, height: 100)    // TODO create constants?

        Text(friend.initials)
          .foregroundStyle(.white)
          .font(.system(size: 59))
      }
    }
  }
}

#Preview {
  InitialsAvatar(friend: Friend(firstName: "Fred", lastName: "Flintstone"))
    .modelContainer(for: Friend.self)
}
