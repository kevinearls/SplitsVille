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
    let container = try ModelContainer(for: Trip.self, Friend.self, configurations: config)
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
  func testSimple() throws {
    let trip = Trip(name: "Street Art", location: "Lisbon")
    XCTAssertNotNil(trip)
    XCTAssertEqual("Street Art", trip.name)
    XCTAssertEqual("Lisbon", trip.location)
  }

  @MainActor
  func testHasFriends() throws {
    let lisbon = Trip(name: "Street Art", location: "Lisbon")

    context.insert(lisbon)

    context.insert(TestData.amy)
    context.insert(TestData.nancy)
    context.insert(TestData.martha)
    context.insert(TestData.kevin)

    lisbon.addFriend(friend: TestData.amy)
    lisbon.addFriend(friend: TestData.nancy)
    lisbon.addFriend(friend: TestData.martha)
    lisbon.addFriend(friend: TestData.kevin)

    XCTAssertNotNil(lisbon.friends)
    XCTAssertEqual(lisbon.friends.count, 4)
    XCTAssertTrue(lisbon.friends.contains(TestData.amy))
    XCTAssertTrue(lisbon.friends.contains(TestData.nancy))
    XCTAssertTrue(lisbon.friends.contains(TestData.martha))
    XCTAssertTrue(lisbon.friends.contains(TestData.kevin))
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
