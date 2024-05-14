//
//  TransactionsTest.swift
//  SplitsVilleUITests
//
//  Created by Kevin Earls on 14/05/2024.
//

import XCTest

final class TransactionsTest: XCTestCase {
  var app: XCUIApplication!

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    app = XCUIApplication()
    app.launch()

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }

  func testExample() throws {
    // FIXME I need at least one trip and one friend for this to work

    let app = XCUIApplication()
    app.tabBars["Tab Bar"].buttons["Transactions"].tap()
    app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"]/*@START_MENU_TOKEN@*/.buttons["Add"]/*[[".otherElements[\"Add\"].buttons[\"Add\"]",".buttons[\"Add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    
    let collectionViewsQuery = app.collectionViews
    let descriptionTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Description:"]/*[[".cells.textFields[\"Description:\"]",".textFields[\"Description:\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    descriptionTextField.tap()
    descriptionTextField.tap()
    
    let amountTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Amount:"]/*[[".cells.textFields[\"Amount:\"]",".textFields[\"Amount:\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    amountTextField.tap()
    descriptionTextField.tap()
    amountTextField.tap()
    amountTextField.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Currency, USD"]/*[[".cells.buttons[\"Currency, USD\"]",".buttons[\"Currency, USD\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["USD"]/*[[".cells",".buttons[\"Currency, USD\"].staticTexts[\"USD\"]",".staticTexts[\"USD\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
            
  }


}
