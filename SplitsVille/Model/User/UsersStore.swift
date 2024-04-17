//
//  UsersStore.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import Combine

class UsersStore: ObservableObject {
  @Published var users: [User] = []

  public func addUser(user: User) {
    users.append(user)
  }
}
