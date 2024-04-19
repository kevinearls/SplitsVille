//
//  TripsTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 18/04/2024.
//

import XCTest
@testable import SplitsVille

final class TripsTest: XCTestCase {
  var friends: [Friend] = []
  let fred = Friend(firstName: "Fred", lastName: "")
  let barney = Friend(firstName: "Barney", lastName: "")
  let wilma = Friend(firstName: "Wilma", lastName: "")
  let betty = Friend(firstName: "Betty", lastName: "")

  override func setUpWithError() throws {
    friends.removeAll()
    friends.append(fred)
    friends.append(barney)
    friends.append(wilma)
    friends.append(betty)
  }

  func testSimple() throws {
    let trip1 = Trip(name: "Go Somewhere", location: "Paris", friends: friends)

    XCTAssertNotNil(trip1)
    XCTAssertEqual(trip1.name, "Go Somewhere")
    XCTAssertEqual(trip1.location, "Paris")
    XCTAssertNotNil(trip1.friends)
    XCTAssertEqual(0, trip1.friends.count)

    //    trip1.addFriend(friend: fred)
    //    trip1.addFriend(friend: barney)
    // FIXME update after moving to SwiftData
    XCTAssertEqual(2, trip1.friends.count)
    XCTAssertTrue(trip1.friends.contains(fred))
    XCTAssertTrue(trip1.friends.contains(barney))
  }
}
