//
//  UsersStoreTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 17/04/2024.
//

import XCTest
@testable import SplitsVille

final class UsersStoreTest: XCTestCase {
  func testExample() throws {
    let store = UsersStore()

    XCTAssertNotNil(store)
    XCTAssertEqual(0, store.users.count)

    let fred = User(firstName: "Fred", lastName: "Flintstone")
    let barney = User(firstName: "Barney", lastName: "Rubble")
    store.addUser(user: barney)
    store.addUser(user: fred)

    XCTAssertEqual(2, store.users.count)
    XCTAssertTrue(store.users.contains(fred))
    XCTAssertTrue(store.users.contains(barney))
  }
}
