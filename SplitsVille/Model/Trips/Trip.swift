//
//  Trip.swift
//  SplitsVille
//
//  Created by Kevin Earls on 17/04/2024.
//

import Foundation

// TODO are there other fields we need here?  Data?  Image?
struct Trip: Codable, Equatable, Identifiable, Hashable {
  var id = UUID()
  let name: String
  let location: String
  var people: [Friend] = []
}
