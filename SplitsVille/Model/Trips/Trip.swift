//
//  Trip.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import Foundation
import SwiftData

// TODO add start and end dates, image?, deleteFriend

@Model
final class Trip: Equatable, Identifiable, Hashable {
  var id = UUID()
  let name: String
  let location: String
  @Relationship()
  var friends: [Friend] = []

  init(id: UUID = UUID(), name: String, location: String, friends: [Friend] = []) {
    self.id = id
    self.name = name
    self.location = location
    self.friends = friends
  }

  public func addFriend(friend: Friend) {
    friends.append(friend)
  }

  public func removeFriend(friend: Friend) {
    if let index = friends.firstIndex(of: friend) {
      friends.remove(at: index)
    }
  }
}
