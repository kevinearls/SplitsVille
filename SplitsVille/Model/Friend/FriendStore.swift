//
//  FriendStore.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import Combine

class FriendStore: ObservableObject {
  @Published var friends: [Friend] = []

  public func addFriend(friend: Friend) {
    friends.append(friend)
  }
}
