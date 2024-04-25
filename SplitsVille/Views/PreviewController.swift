//
//  PreviewController.swift
//  SplitsVille
//
//  Created by Kevin Earls on 23/04/2024.
//

import Foundation
import SwiftData

@MainActor
class PreviewController {
  static let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: Currency.EUR.rawValue)
  static let wilma = Friend(firstName: "Wilma", lastName: "Flintstone", currency: Currency.EUR.rawValue)
  static let barney = Friend(firstName: "Barney", lastName: "Rubble", currency: Currency.GBP.rawValue)
  static let betty = Friend(firstName: "Betty", lastName: "Rubble", currency: Currency.GBP.rawValue)

  static let trip1 = Trip(name: "Big Night Out", location: "Bedrock")

  static let previewContainer: ModelContainer = {
    do {
      let config = ModelConfiguration(isStoredInMemoryOnly: true)
      let container = try ModelContainer(for: Trip.self, Friend.self, configurations: config)
      let context = container.mainContext

      context.insert(fred)
      context.insert(wilma)
      context.insert(barney)
      context.insert(betty)

      context.insert(trip1)

      trip1.addFriend(friend: fred)
      trip1.addFriend(friend: barney)

      return container
    } catch {
      fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
    }
  }()
}
