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
  func testSimple() throws {
    let trip = Trip(name: "Street Art", location: "Lisbon")
    XCTAssertNotNil(trip)
    XCTAssertEqual("Street Art", trip.name)
    XCTAssertEqual("Lisbon", trip.location)
  }

  @MainActor
  func testHasFriends() throws {
    let trip = Trip(name: "Street Art", location: "Lisbon")
    context.insert(trip)

    context.insert(TestData.fred)
    context.insert(TestData.barney)

    trip.addFriend(friend: TestData.fred)
    trip.addFriend(friend: TestData.barney)

    XCTAssertNotNil(trip.friends)
    XCTAssertEqual(trip.friends.count, 2)
    XCTAssertTrue(trip.friends.contains(TestData.fred))
    XCTAssertTrue(trip.friends.contains(TestData.barney))
  }
}
