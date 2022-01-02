//
//  Country.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.
//

import Foundation

struct Country: Codable {
  let name: String
  let code: String
}

// MARK: - Country+Equatable
//
extension Country: Equatable {}

// MARK: - Country+CustomStringConvertible
//
extension Country: CustomStringConvertible {
  var description: String {
    return name
  }
}
