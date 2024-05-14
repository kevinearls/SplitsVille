//
//  SplitsVilleUITests.swift
//  SplitsVilleUITests
//
//  Created by Kevin Earls on 11/04/2024.
//

import XCTest

final class SplitsVilleUITests: XCTestCase {
  var app: XCUIApplication!

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    app = XCUIApplication()
    app.launch()

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testHomeScreen() throws {
  skipOnboarding(app: app)  // TODO can I put this in setup?
    let tabBar = app.tabBars["Tab Bar"]
    // First make sure there are four tabs
    tabBar.buttons["Trips"].tap()
    XCTAssertEqual(tabBar.buttons.count, 4)

    XCTAssertEqual(tabBar.buttons.count, 4)
    XCTAssertTrue(tabBar.buttons["Friends"].exists)
    XCTAssertTrue(tabBar.buttons["Trips"].exists)
    XCTAssertTrue(tabBar.buttons["Transactions"].exists)
    XCTAssertTrue(tabBar.buttons["Currency"].exists)

    // Now, tap on each and make sure it goes to the correct place?
    let friendsButton = tabBar.buttons["Friends"]
    let tripsButton = tabBar.buttons["Trips"]
    let transactionsButton = tabBar.buttons["Transactions"]
    //let currencyButton = tabBar.buttons["Currency"]

    checkNavigation(button: tripsButton, expectedText: "Trips")
    checkNavigation(button: transactionsButton , expectedText: "Transactions")
    //checkNavigation(button: currencyButton, expectedText: "Todays' Exchange rates vs USD")  // FIXME
    checkNavigation(button: friendsButton, expectedText: "Friends")
  }

  public func skipOnboarding(app: XCUIApplication) {
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
