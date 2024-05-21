//
//  TripTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 17/04/2024.
//

import XCTest
import SwiftData
import SwiftUI
@testable import SplitsVille

final class TripTest: XCTestCase {
  // swiftlint:disable:next implicitly_unwrapped_optional
  var context: ModelContext!

  @MainActor
  override func setUpWithError() throws {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Trip.self, Friend.self, Transaction.self, configurations: config)
    context = container.mainContext
  }

  @MainActor
  override func tearDownWithError() throws {
    do {
      try context.delete(model: Trip.self)
      try context.delete(model: Friend.self)
    } catch {
      print("Failed to clear all Country and City data.")
    }
  }


  @MainActor
  func testHasFriends() throws {
    let kevin = Friend(firstName: "Kevin", lastName: "Earls", currency: "EUR", imageData: Data())
    let amy = Friend(firstName: "Amy", lastName: "Costa", currency: "USD", imageData: Data())
    let nancy = Friend(firstName: "Nancy", lastName: "Peterson", currency: "GBP", imageData: Data())

    context.insert(amy)
    context.insert(nancy)
    context.insert(kevin)

    let lisbon = Trip(name: "Street Art", location: "Lisbon")
    context.insert(lisbon)

    XCTAssertNotNil(lisbon)
    XCTAssertEqual("Street Art", lisbon.name)
    XCTAssertEqual("Lisbon", lisbon.location)
    XCTAssertEqual("Trip: Street Art to Lisbon", lisbon.debugDescription)


    lisbon.addFriend(friend: amy)
    lisbon.addFriend(friend: nancy)
    lisbon.addFriend(friend: kevin)

    XCTAssertNotNil(lisbon.friends)
    XCTAssertEqual(lisbon.friends.count, 3)
    XCTAssertTrue(lisbon.friends.contains(amy))
    XCTAssertTrue(lisbon.friends.contains(nancy))
    XCTAssertTrue(lisbon.friends.contains(kevin))
  }

  @MainActor
  func testRemoveFriend() throws {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Trip.self, Friend.self, configurations: config)
    context = container.mainContext

    let kevin = Friend(firstName: "Kevin", lastName: "Earls", currency: "EUR", imageData: Data())
    let martha = Friend(firstName: "Martha", lastName: "Earls", currency: "EUR", imageData: Data())
    let portugal = Trip(name: "Street Art", location: "Portugal")

    context.insert(portugal)
    context.insert(kevin)
    context.insert(martha)

    portugal.addFriend(friend: kevin)
    portugal.addFriend(friend: martha)

    XCTAssertEqual(2, portugal.friends.count)

    portugal.removeFriend(friend: martha)
    XCTAssertEqual(1, portugal.friends.count)
    XCTAssertFalse(portugal.friends.contains(martha))
    XCTAssertTrue(portugal.friends.contains(kevin))
  }
}
