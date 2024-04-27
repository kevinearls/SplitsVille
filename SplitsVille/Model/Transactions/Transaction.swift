//
//  Transaction.swift
//  SplitsVille
//
//  Created by Kevin Earls on 20/04/2024.
//

import Foundation
import SwiftData


// TODO add Date, ability to take photos of a receipt?
@Model
final class Transaction: Identifiable {
  var id = UUID()
  let currency: String
  @Relationship()
  let trip: Trip
  @Relationship()
  let paidBy: Friend
  let desc: String  // TODO rename
  @Relationship()
  var sharedWith: [Friend]

  init(id: UUID = UUID(), currency: String, trip: Trip, payer: Friend, desc: String, sharedWith: [Friend] = []) {
    self.id = id
    self.currency = currency
    self.trip = trip
    self.paidBy = payer
    self.desc = desc
    self.sharedWith = sharedWith
  }

  public func addSharedWith(friend: Friend) {
    sharedWith.append(friend)
  }
}
