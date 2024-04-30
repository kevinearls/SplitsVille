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
      if let uiImage = UIImage(data: friend.avatarImageData) {
        Image(uiImage: uiImage)
          .resizable()
          .frame(maxWidth: 50, maxHeight: 50)
      } else {
        Image(.defaultAvatar)
          .resizable()
          .frame(maxWidth: 50, maxHeight: 50)
      }
      Text(friend.lastName + ", " + friend.firstName + "  " + friend.currency)
        .font(.title2)
    }
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer

  return FriendRowView(friend: PreviewController.fred)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer

  return FriendRowView(friend: PreviewController.fred)
    .preferredColorScheme(.dark)
    .modelContainer(previewContainer)
}
