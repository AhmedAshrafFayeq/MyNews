//
//  ObservationToken.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//


/// An observation token that contains a closure when the observation is cancelled.
///
/// This acts like `AnyCancellable` in Combine and `IDisposable` in ReactiveX.
///
/// Example usage can be found in `ProductImageActionHandler`.
///
/// See:
///
///   - https://developer.apple.com/documentation/combine/anycancellable
///
final class ObservationToken {
  private let onCancel: () -> Void
  
  init(onCancel: @escaping () -> Void) {
    self.onCancel = onCancel
  }
  
  func cancel() {
    onCancel()
  }
}

