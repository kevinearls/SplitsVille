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
  let amount: Decimal
  @Relationship()
  let trip: Trip
  @Relationship()
  let paidBy: Friend
  let desc: String  // TODO rename
  @Relationship()
  var sharedWith: [Friend]  // By default add all users on this trip, add issue to select?  How to Query this?

  init(id: UUID = UUID(), currency: String, amount: Decimal, payer: Friend, trip: Trip, desc: String, sharedWith: [Friend] = []) {
    self.id = id
    self.currency = currency
    self.amount = amount
    self.trip = trip
    self.paidBy = payer
    self.desc = desc
    self.sharedWith = sharedWith
  }

  public func addSharedWith(friend: Friend) {
    sharedWith.append(friend)
  }
}
