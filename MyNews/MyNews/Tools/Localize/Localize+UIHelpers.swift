//
//  Localize+UIHelpers.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.
//



//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.


import UIKit

public extension Localize {
  
  static var isArabic: Bool {
    return Localize.currentLanguage() == "ar"
  }
}

// MARK: - UI Helpers
//
extension UIView {
  
  /// Returns true if the current language supports right to left
  ///
  static var isRightToLeft: Bool {
    return Localize.currentLanguage() == "ar"
  }

  /// Returns the semantic attributes for the current language.
  ///
  class var currentSemanticAttributes: UISemanticContentAttribute {
    return isRightToLeft ? .forceRightToLeft : .forceLeftToRight
  }
  
  /// Returns the semantic attributes for the current language.
  ///
  class var currentTextAlignment: NSTextAlignment {
    return isRightToLeft ? .right : .left
  }
}
