//
//  Friend.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import Foundation
import SwiftUI
import SwiftData

@Model
final class Friend: Identifiable, Hashable {
  var debugDescription: String {
    return fullName
  }
  var id = UUID()
  let firstName: String
  let lastName: String
  var fullName: String {
    firstName + " " + lastName
  }
  let currency: String
  let avatarImageData: Data

  init(firstName: String, lastName: String, currency: String = Currency.USD.rawValue, imageData: Data) {
    self.firstName = firstName
    self.lastName = lastName
    self.currency = currency
    self.avatarImageData = imageData
  }
}
