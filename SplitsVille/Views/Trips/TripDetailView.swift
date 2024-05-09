//
//  TripDetailView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 18/04/2024.
//


// FIXME! For some reason my attemps at navigation have not worked here
// I tried to use a TabView, but that didn't seem to want to work inseide
// Another tab view.  I also tried a NavigationStack without any luck
import SwiftUI
import SwiftData
struct TripDetailView: View {
  @Query private var friends: [Friend]
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
                .foregroundColor(trip.friends.contains(friend) ? Color.secondary : Color.accentColor)  // FIXME colors?
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
    } header: {  // FIXME move this?
      HStack {
        Text("Click to add or delete friends from this trip")
        Spacer()
      }
    }
    Divider()
    Section {
      Group {
        List {
          ForEach(trip.transactions) { transaction in
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
        let total = trip.transactions.reduce(0) { partialResult, transaction in
          partialResult + transaction.amount
        }
        Text("Total: \(total)")
      }
    } header: {
      HStack {
        Text("Balances go here!")
        Spacer()
      }
    }
  }
}

#Preview("Light, Portrait") {
  let previewContainer = PreviewController.previewContainer
  return TripDetailView(trip: PreviewController.paris)
    .modelContainer(previewContainer)
}

#Preview("Dark, Landscape", traits: .landscapeLeft) {
  let previewContainer = PreviewController.previewContainer
  return TripDetailView(trip: PreviewController.paris)
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .modelContainer(previewContainer)
}
