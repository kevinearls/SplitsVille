//
//  Trip.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import Foundation

struct Trip: Codable, Equatable, Identifiable, Hashable {
  var id = UUID()
  let name: String
  let location: String
  var people: [User] = []
}
