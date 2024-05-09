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
    context.insert(TestData.portugal)

    context.insert(TestData.amy)
    context.insert(TestData.nancy)
    context.insert(TestData.martha)
    context.insert(TestData.kevin)

    TestData.portugal.addFriend(friend: TestData.amy)
    TestData.portugal.addFriend(friend: TestData.nancy)
    TestData.portugal.addFriend(friend: TestData.martha)
    TestData.portugal.addFriend(friend: TestData.kevin)

    XCTAssertNotNil(TestData.portugal.friends)
    XCTAssertEqual(TestData.portugal.friends.count, 4)
    XCTAssertTrue(TestData.portugal.friends.contains(TestData.amy))
    XCTAssertTrue(TestData.portugal.friends.contains(TestData.nancy))
    XCTAssertTrue(TestData.portugal.friends.contains(TestData.martha))
    XCTAssertTrue(TestData.portugal.friends.contains(TestData.kevin))
  }

  @MainActor
  func testRemoveFriend() throws {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Trip.self, Friend.self, configurations: config)
    context = container.mainContext

    context.insert(TestData.portugal)
    context.insert(TestData.michelle)
    context.insert(TestData.paul)

    TestData.portugal.addFriend(friend: TestData.michelle)
    TestData.portugal.addFriend(friend: TestData.paul)
    XCTAssertEqual(2, TestData.portugal.friends.count)

    TestData.portugal.removeFriend(friend: TestData.michelle)
    XCTAssertEqual(1, TestData.portugal.friends.count)
    XCTAssertFalse(TestData.portugal.friends.contains(TestData.michelle))
    XCTAssertTrue(TestData.portugal.friends.contains(TestData.paul))
  }
}
