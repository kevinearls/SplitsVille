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
    @Query private var friends: [Friend]


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
  let previewContainer = PreviewController.previewContainer
  return InitialsAvatar(friend: PreviewController.fred)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return InitialsAvatar(friend: PreviewController.barney)
    .modelContainer(previewContainer)
    .preferredColorScheme(.dark)
}
