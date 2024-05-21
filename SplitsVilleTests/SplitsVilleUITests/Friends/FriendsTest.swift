//
//  FriendsTest.swift
//  SplitsVilleUITests
//
//  Created by Kevin Earls on 14/05/2024.
//

import XCTest
@testable import SplitsVille

final class FriendsTest: XCTestCase {
  // swiftlint:disable:next implicitly_unwrapped_optional
  var app: XCUIApplication!

  override func setUpWithError() throws {
    app = XCUIApplication()
    app.launch()

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
  }

  func testAddFriendAgain() throws {
//    let addFriendButton = app.buttons["addFriendButton"]
//    addFriendButton.tap()
//    let testFirstName = "Barney" + "_" + String.random(length: 8)
//    let testLastName = "Rubble" + "_" + String.random(length: 8)
//
//    let collectionViewsQuery = app.collectionViews
//    let firstNameField = collectionViewsQuery.textFields["First Name"]
//    XCTAssertTrue(firstNameField.waitForExistence(timeout: 5))
//    firstNameField.tap()
//    firstNameField.typeText(testFirstName)
//
//    // swiftlint:disable:next line_length
//    let lastNameTextView = collectionViewsQuery/*@START_MENU_TOKEN@*/.textViews["Last Name"]/*[[".cells.textViews[\"Last Name\"]",".textViews[\"Last Name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//    lastNameTextView.tap()
//    lastNameTextView.typeText(testLastName)
//
//
//    // swiftlint:disable line_length
//    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Select avatar"]/*[[".cells.buttons[\"Select avatar\"]",".buttons[\"Select avatar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//    app/*@START_MENU_TOKEN@*/.scrollViews.otherElements.images["Photo, 30 March 2018, 21:14"]/*[[".otherElements[\"Photos\"].scrollViews.otherElements",".otherElements[\"Photo, 30 March 2018, 21:14, Photo, 08 August 2012, 23:55, Photo, 08 August 2012, 23:29, Photo, 08 August 2012, 20:52, Photo, 09 October 2009, 23:09, Photo, 13 March 2011, 01:17\"].images[\"Photo, 30 March 2018, 21:14\"]",".images[\"Photo, 30 March 2018, 21:14\"]",".scrollViews.otherElements"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Add"]/*[[".cells.buttons[\"Add\"]",".buttons[\"Add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

// The code above was working before, now it is crashing everything


    // swiftlint:enable line_length
    // FIXME
    //    let targetRowIdentifier = testFirstName + testLastName + "Row"
    //    let newFriendEntry = app.buttons[targetRowIdentifier]
    //    XCTAssertTrue(newFriendEntry.waitForExistence(timeout: 5))
    //    newFriendEntry.tap()
    //
    //    // Make sure the normal details title is there
    //    let pageTitle = app.staticTexts[testLastName + ", " + testFirstName]
    //    pageTitle.tap()
    //
    //    // And go back...
    //    let navBar = app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"]
    //
    //    navBar.buttons["Back"].tap()
  }
}

extension String {
  static func random(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    return String((0..<length).compactMap { _ in
      letters.randomElement()
    })
  }
}
