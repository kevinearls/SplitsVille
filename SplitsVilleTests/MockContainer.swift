//
//  MockContainer.swift
//  SplitsVilleTests
//
//  Created by Kevin Earls on 20/04/2024.
//

import Foundation
import SwiftData
@testable import SplitsVille

@MainActor
var mockContainer: ModelContainer {
  do {
    let container = try ModelContainer(for: Trip.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return container
  } catch {
    fatalError("Failed to create container")
  }
}
