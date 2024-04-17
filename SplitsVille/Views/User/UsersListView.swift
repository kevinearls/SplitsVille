//
//  UsersView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI

struct UsersListView: View {
  @EnvironmentObject var userStore: UsersStore
  @State private var isPresented = false
  var body: some View {
    VStack(alignment: .leading) {
      NavigationStack {
        List {
          ForEach(userStore.users) { user in
            NavigationLink(value: user) {
              UserRowView(user: user)
            }
          }
        }
        .navigationDestination(for: User.self) { user in
          UserDetailView(user: user)
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
              isPresented.toggle()
            }) {
              Image(systemName: "plus.circle.fill")
            }
          }
          ToolbarItem(placement: .navigationBarLeading) {
            Text("Users").font(.largeTitle)
          }
        }
      }
      .sheet(isPresented: $isPresented) {
        AddUserView(showModal: $isPresented)
      }
    }
  }
}

#Preview {
  UsersListView()
    .environmentObject(UsersStore())
}
