//
//  FriendDetailView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI
import SwiftData

struct FriendDetailView: View {
  @State var selected = false
  var friend: Friend
  var body: some View {
    VStack {
      Text(friend.lastName + ", " + friend.firstName)
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
      if let uiImage = UIImage(data: friend.avatarImageData) {
        FriendImageView(image: Image(uiImage: uiImage), selected: $selected)
      } else {
        FriendImageView(image: Image(.defaultAvatar), selected: $selected)
      }
      Text("Preferred Currency: \(friend.currency)")
        .font(.subheadline)
    }
  }
}

struct FriendImageView: View {
  var image: Image
  @Binding var selected: Bool
  var body: some View {
   image
      .resizable()
      .frame(maxWidth: 100, maxHeight: 100)
      .scaleEffect(selected ? 2.0 : 1.0)
      .animation(.bouncy, value: selected)
      .onTapGesture {
        selected.toggle()
      }
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer

  return FriendDetailView(friend: PreviewController.patrick)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer

  return FriendDetailView(friend: PreviewController.patrick)
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .modelContainer(previewContainer)
}

