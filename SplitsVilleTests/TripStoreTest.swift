//
//  TripStoreTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 17/04/2024.
//

import XCTest
@testable import SplitsVille

final class TripStoreTest: XCTestCase {
  func testSimple() throws {
    let store = TripStore()

    XCTAssertNotNil(store)
    XCTAssertEqual(0, store.trips.count)

    let portugal = Trip(name: "Possibly Portugal", location: "Lisbon")
    let football = Trip(name: "Olympic Football", location: "Bordeaux")
    store.addTrip(trip: portugal)
    store.addTrip(trip: football)

    XCTAssertEqual(2, store.trips.count)
    XCTAssertTrue(store.trips.contains(portugal))
    XCTAssertTrue(store.trips.contains(football))
  }
}
