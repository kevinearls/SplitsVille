//
//  TripDetailView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 18/04/2024.
//


// FIXME! For some reason my attempts at navigation have not worked here
// I tried to use a TabView, but that didn't seem to want to work inside
// Another tab view.  I also tried a NavigationStack without any luck
import SwiftUI
import SwiftData
struct TripDetailView: View {
  @Query(sort: \Friend.firstName)
  private var friends: [Friend]

  @Query(sort: \Transaction.paidBy.firstName)
  private var transactions: [Transaction]
  @State private var isPresented = false

  var trip: Trip
  var body: some View {
    Section {
      Group {
        HStack {
          VStack(alignment: .leading) {
            Text(trip.location)
              .font(.subheadline)
          }
          Spacer()
        }
      }
    } header: {
      HStack {
        Text(trip.name).font(.largeTitle)
        Spacer()
      }
    }
    Divider()
    Section {
      Group {
        List {
          ForEach(friends) { friend in
            HStack {
              Text("\(friend.firstName) \(friend.lastName)")
              Spacer()
              Image(systemName: trip.friends.contains(friend) ? "checkmark.square" : "square")
                .foregroundColor(trip.friends.contains(friend) ? Color.secondary : Color.accentColor)
                .onTapGesture {
                  if trip.friends.contains(friend) {
                    trip.removeFriend(friend: friend)
                  } else {
                    trip.addFriend(friend: friend)
                  }
                }
            }
          }
        }
      }
    } header: {
      HStack {
        Text("Click to add or delete friends from this trip")
        Spacer()
      }
    }
    Divider()
    Section {
      Group {
        List {
          // FIXME why did this not show when I used trip.transactions?
          ForEach(transactions.filter { $0.trip == trip }) { transaction in
            TransactionRowView(transaction: transaction)
          }
        }
      }
    } header: {  // FIXME move this?
      HStack {
        Text("Transactions for this trip")
        Spacer()
      }
    }
    Divider()
    Section {
      Group {
        let total = transactions.filter { $0.trip == trip }
          .reduce(0) { partialResult, transaction in
            partialResult + transaction.amount
          }
        Text("Total: \(total)")
      }
    } header: {
      HStack {
        Text("Balances")
        Spacer()
      }
    }
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return TripDetailView(trip: PreviewController.anotherNightOut)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return TripDetailView(trip: PreviewController.anotherNightOut)
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .modelContainer(previewContainer)
}
