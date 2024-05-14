//
//  TripsUITests.swift
//  SplitsVilleUITests
//
//  Created by Kevin Earls on 13/05/2024.
//

import XCTest

final class TripsUITests: XCTestCase {
  var app: XCUIApplication!

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    app = XCUIApplication()
    app.launch()

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
  }

  /*
  A simple test of the trip views

  1. Click on the trips tab - it should take us to the TripsListView
  2. Click on the + to add a trip  ; maybe with a generated name?
  3. Add the trip
  4. Make sure that trip exists
  5  Click on that trip to go to the detail view
  6. Navigate back to the list view
  */
  func testExample() throws {
    // 1. Go to the trips page
    app.tabBars["Tab Bar"].buttons["Trips"].tap()
    // 2. Verify that we're on that page and click the add button
    let navBar = app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"]
    XCTAssert(app.staticTexts["Trips"].exists)
    navBar/*@START_MENU_TOKEN@*/.buttons["Add"]/*[[".otherElements[\"Add\"].buttons[\"Add\"]",".buttons[\"Add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    XCTAssert(app.staticTexts["Add a Trip"].exists)

    // 3.  Add the trip
    // TODO find a shorter identifier that uuid...
    let tripUuid = UUID()
    let tripName = "TripName+\(tripUuid)"
    let tripLocation = "Location+\(tripUuid)"

    let collectionViewsQuery = app.collectionViews
    let nameTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Name:"]/*[[".cells.textFields[\"Name:\"]",".textFields[\"Name:\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    nameTextField.tap()
    nameTextField.typeText(tripName)

    let locationTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Location:"]/*[[".cells.textFields[\"Location:\"]",".textFields[\"Location:\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    XCTAssertTrue(locationTextField.waitForExistence(timeout: 5))
    locationTextField.tap()
    locationTextField.typeText(tripLocation)

    app.buttons["Done"].tap()

    // 4. Verify that the trip exists, then go to the detail page
    XCTAssert(app.staticTexts["Trips"].exists)
    let newTripView = app.staticTexts.matching(identifier: tripName).firstMatch
    XCTAssertNotNil(newTripView, "Could not find the new trip in the Trip List View")
    newTripView.tap()

    // 5. Make sure we're on the Details page
    XCTAssert(app.staticTexts[tripName].exists)
    app.staticTexts["Click to add or delete friends from this trip"].tap()
    app.staticTexts["Transactions for this trip"].tap()
    app.staticTexts["Balances"].tap()

    // 6. Hit Back and verify that we're on the trips list view
    navBar.buttons["Back"].tap()
    XCTAssert(app.staticTexts["Trips"].exists)
  }
}
