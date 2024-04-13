# SplitsVille Proposal
Kevin Earls<br>
8 April 2024
This is the proposal for my capstone project for the KodeCo iOS programming bootcamp.
# Overview
Splitsville is inspired by the popular iOS app [SplitWise](https://www.splitwise.com) which allows a group
of people traveling together to keep track of shared expenses.  Since I will not be writing a full back 
end at this time, this will not have the full functionality of SplitWise.  Instead, one person will add 
friends on their app and enter all the expense for everyone.
## Basic Functionality
- The app user will add themselves as a user, and then can add friends to the app.  Each friend can 
have an image, an icon, address, and preferred currency.
- They can then add trips, and select known users to be on trips.  During the trip they can add 
expenses, noting who paid for this, who it was shared with, and what the amount was in what currency.
- There will be a running account of which users are owed money by others, and in what currency.   
Currency conversion rates will be the API part of this project, as they will be obtained on a 
daily basis from a known and respected sources.
# How this meets requirements
- The API requirement will be met by downloading currency exchange rates, and URLSession will be used 
- All user, trip, and transaction data will be persisted on the phone.
- Users, trips, and transactions will be displayed in a scrollable list, and have associated detail pages
- The main page will be a tab view with tabs for users, trips, and possibly transactions
# Questions
- I am still not sure how to meet the listed requirement of "It uses images based on some kind of dynamic information 
delivered by the API"?  I could add an image picker to load images for users, but I am not sure if that suffices here.

