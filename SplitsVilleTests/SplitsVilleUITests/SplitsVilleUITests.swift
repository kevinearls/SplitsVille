//
//  SplitsVilleUITests.swift
//  SplitsVilleUITests
//
//  Created by Kevin Earls on 11/04/2024.
//

import XCTest

final class SplitsVilleUITests: XCTestCase {
  // swiftlint:disable:next implicitly_unwrapped_optional
  var app: XCUIApplication!

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    app = XCUIApplication()
    app.launch()
    skipOnboarding(app: app)

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
  }

  func testHomeScreen() throws {
    // skipOnboarding(app: app)
    let tabBar = app.tabBars["Tab Bar"]
    // First make sure there are four tabs
    tabBar.buttons["Trips"].tap()
    XCTAssertEqual(tabBar.buttons.count, 5)

    XCTAssertTrue(tabBar.buttons["Friends"].exists)
    XCTAssertTrue(tabBar.buttons["Trips"].exists)
    XCTAssertTrue(tabBar.buttons["Transactions"].exists)
    XCTAssertTrue(tabBar.buttons["Balances"].exists)
    XCTAssertTrue(tabBar.buttons["Currency"].exists)

    // Now, tap on each and make sure it goes to the correct place?
    let friendsButton = tabBar.buttons["Friends"]
    let tripsButton = tabBar.buttons["Trips"]
    let transactionsButton = tabBar.buttons["Transactions"]
    let balancesButton = tabBar.buttons["Balances"]
    // let currencyButton = tabBar.buttons["Currency"]

    checkNavigation(button: tripsButton, expectedText: "Trips")
    checkNavigation(button: transactionsButton, expectedText: "Transactions")
    // checkNavigation(button: currencyButton, expectedText: "Todays' Exchange rates vs USD")
    checkNavigation(button: friendsButton, expectedText: "Friends")
  }

  func testBalancesScreen() {
    let tabBar = app.tabBars["Tab Bar"]
    let balancesButton = tabBar.buttons["Balances"]
    balancesButton.tap()
    let title = app.staticTexts["title"]

    XCTAssertTrue(title.exists);
  }

  public func skipOnboarding(app: XCUIApplication) {
    // swiftlint:disable:next line_length
    if app.collectionViews/*@START_MENU_TOKEN@*/.scrollViews/*[[".cells.scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.staticTexts["Welcome to $plitsvill€"].exists {
      print(">>>>>>>>>> Skipping onboarding...")
      app.buttons["Next"].tap()
      app.buttons["Done"].tap()
    } else {
      print(">>>>>>>>>> NOT on the onboarding screen")
    }
  }

  // Just tap this button and verify that it goes to the correct page
  private func checkNavigation(button: XCUIElement, expectedText: String) {
    button.tap()
    XCTAssertEqual(app.navigationBars.count, 1)  // There should only be one nav bar
    let navBar = app.navigationBars.firstMatch
    XCTAssertTrue(navBar.staticTexts[expectedText].exists)
  }
}
