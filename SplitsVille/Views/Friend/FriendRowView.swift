//
//  FriendRowView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI

struct FriendRowView: View {
  var friend: Friend
  var body: some View {
    HStack {
      InitialsAvatar(friend: friend)
      Text(friend.lastName + ", " + friend.firstName + "  " + friend.currency)
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
  }
}

#Preview {
  FriendRowView(friend: Friend(firstName: "Fred", lastName: "Flintstone", currency: "EUR"))
}
