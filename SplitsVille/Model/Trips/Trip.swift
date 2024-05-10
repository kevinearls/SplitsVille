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
  var id = UUID()   // FIXME do I need this?
  @Attribute(.unique)
  let name: String
  let location: String
  var startDate: Date
  var endDate: Date

  @Relationship()
  var friends: [Friend] = []

  @Relationship()
  var transactions: [Transaction] = []

  init(id: UUID = UUID(), name: String, location: String, startDate: Date = .now, endDate: Date = .distantFuture) {
    self.id = id
    self.name = name
    self.location = location
    self.startDate = startDate
    self.endDate = endDate
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

  public func addTransaction(transaction: Transaction) {
    transactions.append(transaction)
  }
}
