//
//  FriendDetailView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI

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
  FriendDetailView(friend: Friend(firstName: "Fred", lastName: "Flintstone"))
}
