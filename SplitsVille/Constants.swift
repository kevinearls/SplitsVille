//
//  Constants.swift
//  SplitsVille
//
//  Created by Kevin Earls on 15/04/2024.
//

import Foundation

enum Constants {
  enum Onboarding {
    static let currentOnboardingVersion = "onboardingVersion_1.0.0"
  }

  enum Application {
    static let applicationName = "$plitsvill€"
  }

  enum HomeScreen {
    static let balancesViewImage = "creditcard"
    static let balancesViewName = "Balances"
    static let currencyViewImage = "dollarsign.arrow.circlepath"
    static let currencyViewName = "Currency"
    static let dismissButtonText = "Dismiss"
    static let friendsViewImage = "person"
    static let friendsViewName = "Friends"
    static let tripsViewImage = "globe"
    static let tripsViewName = "Trips"
    static let transactionsViewImage = "cart"
    static let transactionsViewName = "Transactions"
  }

  enum Friends {
    static let addButtonText = "Add"
    static let addFriendButton = "addFriendButton"
    static let addFriendsSystemImage = "plus.circle.fill"
    static let addFriendTitle = "Add a friend"
    static let addYourselfReminder = "Don't forget to add yourself!"
    static let cancelButtonText = "Cancel"
    static let currencyPickerPrompt = "Currency"
    static let firstNamePrompt = "First Name"
    static let friendsListTitle = "Friends"
    static let lastNamePrompt = "Last Name"
    static let noFriendsYetPrompt = "There are no friends so far.  To add some, click on the + above"
    static let photoDownloadFailedMessage = "Failed to download avatar image"
    static let preferredCurrency = "Preferred Currency"
    static let selectAvatarPrompt = "Select a photo"
  }

  enum Trips {
    static let addFriendsReminder = "After adding a trip be sure to select the trip below and add friends"
    static let addTitle = "Add a trip"
    static let addTripsSystemImage = "plus.circle.fill"
    static let arrowSystemImage = "arrow.right"
    static let calendarSystemImage = "calendar"
    static let dismissPrompt = "Dismiss"
    static let doneButtonText = "Done"
    static let endDateLabel = "End Date"
    static let instructionsMessage = "Click to add or delete friends from this trip"
    static let notOnTripImage = "square"
    static let noTripsYetMessage = "There are no trips so far.  To add some, click on the + above"
    static let oneWeekFromNow: Date = .now.addingTimeInterval(86400 * 7)
    static let onTripImage = "checkmark.square"
    static let startDateLabel = "Start Date"
    static let tripsListTitle = "Trips"
    static let tripLocationPrompt = "Location:"
    static let tripLocationTitle = "Trip Location"
    static let tripNamePrompt = "Name:"
    static let tripNameTitle = "Trip Name"
  }

  enum Transactions {
    static let addButtonText = "Add"
    static let addSystemImage = "plus.circle.fill"
    static let addTitle = "Add a Transaction"
    static let amountHeader = "Amount"
    static let amountPrompt = "Amount:"
    static let currencyPickerLabel = "Currency"
    static let descriptionTitle = "Description"
    static let descriptionPrompt = "Description:"
    static let detailViewTitle = "Transaction Detail View"
    static let dismissPrompt = "Dismiss"
    static let noTransactionsMessage =
      "There are no transactions so far.  To add some, click on the + above"
    static let paidByLabel = "Paid by:"
    static let selectTripPrompt = "Which trip?"
    static let selectPaidByPrompt = "Who paid?"
    static let transactionsTitle = "Transactions"
    static let tripNameLabel = "Trip:"
  }

  enum Balances {
    static let noTransactionsMessage =
      "There are no transactions so far.  To add some, click on the + above"
    static let selectTripPrompt = "Which trip?"
    static let title = "Balances"
  }

  enum Currency {
    static let exchangeRatesDownloadFailed = "Exchange rates download failed"
  }

  enum CurrencyFreaks {
    static let apiKey = "a353a534a54248b9a31d7edfa2877bfd"
    static let baseURL = "https://api.currencyfreaks.com/v2.0/rates/latest/"
  }
}
