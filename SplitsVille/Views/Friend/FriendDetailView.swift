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
      if let uiImage = UIImage(data: friend.avatarImageData) {
        Image(uiImage: uiImage)
          .resizable()
          .frame(maxWidth: 100, maxHeight: 100)
      } else {
        Image(.defaultAvatar)
      }
    }
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer

  return FriendDetailView(friend: PreviewController.barney)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer

  return FriendDetailView(friend: PreviewController.barney)
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .modelContainer(previewContainer)
}
