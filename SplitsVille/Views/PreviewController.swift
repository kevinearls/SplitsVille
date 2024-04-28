//
//  PreviewController.swift
//  SplitsVille
//
//  Created by Kevin Earls on 23/04/2024.
//

import Foundation
import SwiftData

@MainActor
enum PreviewController {
  static let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: Currency.EUR.rawValue)
  static let wilma = Friend(firstName: "Wilma", lastName: "Flintstone", currency: Currency.EUR.rawValue)
  static let barney = Friend(firstName: "Barney", lastName: "Rubble", currency: Currency.GBP.rawValue)
  static let betty = Friend(firstName: "Betty", lastName: "Rubble", currency: Currency.GBP.rawValue)
  static let nightOutInBedrock = Trip(name: "Big Night Out", location: "Bedrock")
  static let anotherNightOut = Trip(name: "Another Night Out", location: "Somewhere")
  static let dinosaurBurgers = Transaction(
    currency: Currency.EUR.rawValue,
    amount: 15.75,
    payer: fred,
    trip: nightOutInBedrock,
    desc: "DinosaurBurgers"
  )

  static let previewContainer: ModelContainer = {
    do {
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: Trip.self, Friend.self, Transaction.self, configurations: config)
      let context = container.mainContext

      context.insert(fred)
      context.insert(wilma)
      context.insert(barney)
      context.insert(betty)
      context.insert(nightOutInBedrock)
      context.insert(anotherNightOut)
      nightOutInBedrock.addFriend(friend: fred)
      nightOutInBedrock.addFriend(friend: barney)

      context.insert(dinosaurBurgers)

      return container
    } catch {
      fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
    }
  }()
}
