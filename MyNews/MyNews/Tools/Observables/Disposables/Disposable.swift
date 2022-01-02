//
//  Disposable.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.
//

import Foundation

extension ObservationToken: Disposable {
  func dispose() {
    cancel()
  }
}

/// Represents a disposable resource.
public protocol Disposable {
  /// Dispose resource.
  func dispose()
}
