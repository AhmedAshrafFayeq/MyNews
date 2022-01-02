//
//  Category.swift
//  MyNews
//
//  Created by Ahmed Fayeq on 01/01/2022.
//

import Foundation

struct Category: Codable {
  let title: String
  let value: String
}

// MARK: - Category+Hashable
//
extension Category: Hashable {}

// MARK: - Category+CustomStringConvertible
//
extension Category: CustomStringConvertible {
  var description: String {
    return title
  }
}
