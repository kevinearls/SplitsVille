//
//  UserDetailView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI

struct UserDetailView: View {
  var user: User
  var body: some View {
    VStack {
      Text(user.lastName + ", " + user.firstName).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
      InitialsAvatar(user: user)
    }
  }
}

#Preview {
  UserDetailView(user: User(firstName: "Fred", lastName: "Flintstone"))
}
