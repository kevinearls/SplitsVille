//
//  FriendsListView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

// TODO add space at top?
// TODO display a message if there are no users
import SwiftUI
import SwiftData

struct FriendsListView: View {
  @Query private var friends: [Friend]
  @State private var isPresented = false
  var body: some View {
    VStack(alignment: .leading) {
      NavigationStack {
        List {
          ForEach(friends) { friend in
            NavigationLink(value: friend) {
              FriendRowView(friend: friend)
            }
          }
        }
        .navigationDestination(for: Friend.self) { friend in
          FriendDetailView(friend: friend)
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: { isPresented.toggle() }, label: {
              Image(systemName: "plus.circle.fill")
            })
          }
          ToolbarItem(placement: .navigationBarLeading) {
            Text("Friends").font(.largeTitle)
          }
        }
      }
      .sheet(isPresented: $isPresented) {
        AddFriendView(showModal: $isPresented)
      }
    }
    .padding()
  }
}

#Preview {
  let config = ModelConfiguration(isStoredInMemoryOnly: true)
  let container = try! ModelContainer(for: Friend.self, configurations: config)
  let fred = Friend(firstName: "Fred", lastName: "Flintstone", currency: "EUR")
  let barney = Friend(firstName: "Barney", lastName: "Rubble", currency: "GBP")

  let context = container.mainContext
  context.insert(fred)
  context.insert(barney)

  return FriendsListView()
    .modelContainer(container)
}
