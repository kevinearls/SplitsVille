//
//  FriendsStoreTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 17/04/2024.
//

import XCTest
@testable import SplitsVille

final class FriendsStoreTest: XCTestCase {
  func testExample() throws {
    let store = FriendStore()

    XCTAssertNotNil(store)
    XCTAssertEqual(0, store.friends.count)

    let fred = Friend(firstName: "Fred", lastName: "Flintstone")
    let barney = Friend(firstName: "Barney", lastName: "Rubble")
    store.addFriend(friend: barney)
    store.addFriend(friend: fred)

    XCTAssertEqual(2, store.friends.count)
    XCTAssertTrue(store.friends.contains(fred))
    XCTAssertTrue(store.friends.contains(barney))
  }
}
