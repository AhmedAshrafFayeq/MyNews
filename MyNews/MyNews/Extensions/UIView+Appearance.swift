//
//  UIView+Appearance.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.
//

import UIKit

// MARK: - UIView + Appearance
//
extension UIView {
  
  /// Apple custom CashCall appearance.
  ///
  func applyDarkBackgroundStyle() {
    backgroundColor = .primary
  }
  
  /// Apply default background style with `listBackground` color
  ///
  func applyDefaultBackgroundStyle() {
    backgroundColor = .listBackground
  }
  
  /// Remove BackGround color
  ///
  func clearBackgroundColor() {
    backgroundColor = .clear
  }
}

// MARK: - Metics Helpers
//
extension UIView {
  
  /// Apply default height
  ///
  func applyDefaultHeight() {
    let heightConstraint = heightAnchor.constraint(equalToConstant: UISettings.defaultHeight)
    heightConstraint.priority = .defaultHigh
    heightConstraint.isActive = true
  }
}
