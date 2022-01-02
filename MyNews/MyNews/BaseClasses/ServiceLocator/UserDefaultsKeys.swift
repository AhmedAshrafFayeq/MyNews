//
//  UserDefaultsKeys.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//

import Foundation

// MARK: - UserDefaultsKeys
//
enum UserDefaultsKeys: String, CaseIterable {
  
  /// Current user codable value of `NewsFilter`
  case filter
  
  /// True if the app was launched and not the first time.
  case launchedBefore
  
}
