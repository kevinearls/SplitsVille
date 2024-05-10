//
//  Balance.swift
//  SplitsVille
//
//  Created by Kevin Earls on 10/05/2024.
//

import Foundation

public class OwedBy: Equatable {
  public static func == (lhs: OwedBy, rhs: OwedBy) -> Bool {
    return rhs.friend == lhs.friend && rhs.currency == lhs.currency && rhs.friend == lhs.friend
  }

  let friend: Friend
  let currency: Currency
  var amount: Double = 0.0  // FIXME should I use Decimal for money?

  init(friend: Friend, currency: Currency, amount: Double = 0.0) {
    self.friend = friend
    self.currency = currency
    self.amount = amount
  }
}

public class Balance {
  let principal: Friend
  let trip: Trip
  let friendsOnTrip: [Friend] = []
  var entries: [OwedBy] = []

  var description: String {
    var desc = "Principal: ["
    desc.append(principal.fullName)
    desc.append("] is owed ")
    for entry in entries {
      desc.append(String(entry.amount))
      desc.append(" by ")
      desc.append(entry.friend.fullName)
      desc.append("; ")
    }
    return desc
  }

  init(principal: Friend, trip: Trip) {
    self.principal = principal
    self.trip = trip
    for friend in trip.friends where friend != principal {
      // TODO: how to set currency here?
      let newEntry = OwedBy(friend: friend, currency: .USD, amount: 0.0)
      entries.append(newEntry)
    }
  }


  // FIXME do we need both of these?
  func addBalanceEntry(friend: Friend, currency: Currency, amount: Double) {
    let entry = OwedBy(friend: friend, currency: currency, amount: amount)
    entries.append(entry)
  }

  func addBalanceEntry(_ entry: OwedBy) {
    entries.append(entry)
  }
}
