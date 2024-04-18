//
//  TripsTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 18/04/2024.
//

import XCTest
@testable import SplitsVille

final class TripsTest: XCTestCase {
  var friendStore = FriendStore()
  let fred = Friend(firstName: "Fred", lastName: "")
  let barney = Friend(firstName: "Barney", lastName: "")
  let wilma = Friend(firstName: "Wilma", lastName: "")
  let betty = Friend(firstName: "Betty", lastName: "")

  override func setUpWithError() throws {
    friendStore = FriendStore()
    friendStore.addFriend(friend: fred)
    friendStore.addFriend(friend: barney)
    friendStore.addFriend(friend: wilma)
    friendStore.addFriend(friend: betty)
  }

  func testSimple() throws {
    var trip1 = Trip(name: "Go Somewhere", location: "Paris")

    XCTAssertNotNil(trip1)
    XCTAssertEqual(trip1.name, "Go Somewhere")
    XCTAssertEqual(trip1.location, "Paris")
    XCTAssertNotNil(trip1.friends)
    XCTAssertEqual(0, trip1.friends.count)

    trip1.addFriend(friend: fred)
    trip1.addFriend(friend: barney)
    XCTAssertEqual(2, trip1.friends.count)
    XCTAssertTrue(trip1.friends.contains(fred))
    XCTAssertTrue(trip1.friends.contains(barney))
  }
}
