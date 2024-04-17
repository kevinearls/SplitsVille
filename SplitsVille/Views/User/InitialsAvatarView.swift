//
//  AvatarView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI

struct InitialsAvatar: View {
  let user: User

  var body: some View {
    HStack {
      ZStack {
        Circle()
          .foregroundColor(Color(user.avatarColor))
          .frame(width: 100, height: 100)    // TODO create constants?

        Text(user.initials)
          .foregroundStyle(.white)
          .font(.system(size: 59))
      }
    }
  }
}

#Preview {
  InitialsAvatar(user: User(firstName: "Fred", lastName: "Flintstone"))
}
