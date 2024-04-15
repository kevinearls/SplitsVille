//
//  OnboardingItemTest.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 15/04/2024.
//

import XCTest
@testable import SplitsVille

// TODO do I really need this?  Does it make any sense to test immutable structs?
final class OnboardingItemTest: XCTestCase {
  func testOnboardingItem() throws {
    let item = OnboardingItem(systemImageName: "dollarsign", title: "title", subtitle: "subtitle")
    XCTAssertEqual("dollarsign", item.systemImageName)
    XCTAssertEqual("title", item.title)
    XCTAssertEqual("subtitle", item.subtitle)
  }
}
