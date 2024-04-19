//
//  Friend.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import Foundation
import SwiftUI
import SwiftData

// TODO is there a better way to do this?
let knownAvatarColors = [
  Constants.AvatarColor.blue,
  Constants.AvatarColor.brown,
  Constants.AvatarColor.cyan,
  Constants.AvatarColor.gray,
  Constants.AvatarColor.green,
  Constants.AvatarColor.indigo,
  Constants.AvatarColor.mint,
  Constants.AvatarColor.orange,
  Constants.AvatarColor.pink,
  Constants.AvatarColor.purple,
  Constants.AvatarColor.red,
  Constants.AvatarColor.teal,
  Constants.AvatarColor.yellow
]

// TODO add a preferred currency - default to euros?
@Model
final class Friend: Identifiable {
  var id = UUID()
  let firstName: String
  let lastName: String
  let initials: String
  let avatarColor: String
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName

    if let first = firstName.first, let last = lastName.first {
      self.initials = String(first) + String(last)
    } else {
      self.initials = "??"
    }

    if let randomAvatarColor = knownAvatarColors.randomElement() {
      self.avatarColor = randomAvatarColor
    } else {
      self.avatarColor = Constants.AvatarColor.teal
    }
  }
}
