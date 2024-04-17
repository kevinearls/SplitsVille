//
//  UserRowView.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import SwiftUI

struct UserRowView: View {
  var user: User
  var body: some View {
    HStack {
      InitialsAvatar(user: user)
      Text(user.lastName + ", " + user.firstName).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
  }
}

#Preview {
  UserRowView(user: User(firstName: "Fred", lastName: "Flintstone"))
}
