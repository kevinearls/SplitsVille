#  SplitsVille!
Kevin Earls  
Capstone Project for Kodeco iOS boot camp.
## Basic explanation of the app
Splitsville is inspired by the popular iOS app [SplitWise](https://www.splitwise.com) which allows a group
of people traveling together to keep track of shared expenses.  Since I will not be writing a full back
end at this time, this will not have the full functionality of SplitWise.  Instead, one person will add
friends on their app and enter all the expense for everyone.

- The app user will add themselves as a friend, and then can add other friends to the app.  Each friend can
  have an image and preferred currency.
- They can then add trips, and select known friends to be on trips.  During the trip they can add
  expenses, noting who paid for this and what the amount was in what currency.
- There will be a running account of which friends are owed money by others, and in what currency.   
-  Currency conversion rates will be the API part of this project, as they will be obtained from 
- a known and respected public source.

## How I will fulfill requirements

### We suggest using Xcode 14.3 or 14.3.1 and iOS 16.x, rather than Xcode 15 and iOS 17.
As we discussed on Discord, I will be using the latest versions of both XCode and iOS
### A basic explanation of the app
*As well as explanations of how your app fulfills each of the rubric items. Identify 
your features and any specific file names so that your mentor doesn’t have to search for them while grading.*  
See above
### The app has a splash screen suitable for the app.
*It can be either a static or animated splash screen.*

### All features in the app should be completed.
*Any unfinished feature should be commented out.*
### The app has at least one screen with a list using a view of your choice (List, grid, ScrollView .. etc).
*Each item in the list should contain (as a minimum) a name, a sub-title/description, and an image of the item - the text 
should be styled appropriately. Pressing on items in this list should lead to detail pages - this should show the same 
data in the list with some further details such as a longer description, bigger picture, price, and a Buy/Order button.
Include enough items to ensure that the user has to scroll the list to see all the items in it.*  
  
The app will have views with lists of Friends, Trips, and Transactions, all of which will have multiple elements.  The 
Friends list will also include an image, which will be a photo selected when the friend is added.
### This should appear in a tab view with at least two tabs.
The primary view will be a tab view, and allow selection of the Friends, Trips, or Transactions views.
### The app has one or more network call(s) to download/upload data that relates to the core tasks of the app. Using strictly Apple’s URLSession.
*The app handles all typical errors related to network calls.
Including at least: No network connection, server error.*  
  
The app will download exchange rates from a public server and handle any errors in an expected manner.
### The app uses at least one way to save data: userdefaults, keychain, or local database. Please list your method in the Readme.
*The app communicates to the user whenever data is missing or empty, the reason for that condition, and a step to 
take in order to move forward. In other words, no blank screens. The user should never “feel” lost.  For example, 
whenever there are no items, such as when the data cannot be loaded, explain it).*  
  
I am using **AppStorage** to determine if the user has already seen the onboarding screen, and **SwiftData** to store Friends, Trips, and Users
### All included screens work successfully without crashes or UI issues.
- *App works for both landscape and portrait orientations.*
- *App works for both light and dark modes.*
- *No obvious UI issues.*
- *The code should be organized and easily readable.*
- *Project source files are organized in folders such as Views, Models, Networking etc.*
- *View components are abstracted into separate Views and source files.*
### The model includes at least one ObservableObject with at least one Published value that at least one view subscribes to.
As I am using **SwiftData** all model objects are **Observable** and **Published**
### The project utilizes SwiftLint with Kodeco’s configuration file. Follow instructions in the Kodeco Swift style guide.
*Project builds without Warnings or Errors. (TODO warnings should be moved to a different branch.)*

#### The code has both UI and unit testing with a minimum of 50% code coverage.
*All test cases pass*
### The app includes:
- *A custom app icon.*
- *An onboarding screen.*
- *A custom display name.*
- *At least one SwifUI animation.*  Clinking on the image on the FriendDetailPage uses animation.
- *Styled text properties. SwiftUI modifiers are sufficient.*

## A List of planned screens
### Launch screen
Implemented as a storyboard
### Onboarding Screens
There will be an onboarding screen, currently with 2 sections
### Home Screen (ContentView.swift)
This will be a tabbed view which will allow selection of the Friends, Trips, or Transactions screens
### Friend Screens
- **FriendListView:** 
- **FriendDetailView:**
- **AddFriendView:** 
### Trip Views
- **TripListView**
- **TripDetailView** 
- **AddTripView**
- **TripDetailFriendsView**
- **TripDetailTransactionsView**
- **TripDetailBalancesView**  


**Note:** I have not yet decided the best way to implement these.  I may either do it as listed here, where you
can get Friends, Transactions, and balances associated with a trip from the **TripDetailView**, or I may 
implement these as options on the **FriendListView** and **TripListView** (and create a **BalancesListView**) where 
you can select a trip on those views and see the associated data.
### Transaction Views
- **TransactionListView:** 
- **TransactionDetailView**
- **AddTransactionsView**



